package itu.project.beezniceback.authentification.tokenHandler;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;
import itu.project.beezniceback.authentification.model.LoggedCustomer;
import itu.project.beezniceback.cartItems.cart.model.Cart;
import itu.project.beezniceback.dishes.model.Dishes;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Service
public class TokenGenerator {

    private final byte[] secretKeyBytes;

    public TokenGenerator() {
        // Generate a secret key for HS256 algorithm
        this.secretKeyBytes = Keys.secretKeyFor(SignatureAlgorithm.HS256).getEncoded();
    }

    public String generateToken(Object object,Cart cart) throws JsonProcessingException {
        ObjectMapper objectMapper = new ObjectMapper();
        String userJson = objectMapper.writeValueAsString(object);
        String subject = userJson;
        String issuer = "myApp";
        Date now = new Date();
        Date expiration = new Date(now.getTime() + 3600000);

        String token = Jwts.builder()
                .setSubject(subject)
                .setIssuer(issuer)
                .setIssuedAt(now)
                .setExpiration(expiration)
                .claim("user", object)
                .claim("cart", cart)
                .signWith(Keys.hmacShaKeyFor(secretKeyBytes), SignatureAlgorithm.HS256)
                .compact();
        return token;
    }

    public Claims decodeToken(String token) {
        Jws<Claims> claimsJws = Jwts.parserBuilder()
                .setSigningKey(Keys.hmacShaKeyFor(secretKeyBytes))
                .build()
                .parseClaimsJws(token);
        return claimsJws.getBody();
    }
    public LoggedCustomer decodeCustomer(String token) throws JsonProcessingException {
        Claims claims = decodeToken(token);
        ObjectMapper objectMapper = new ObjectMapper();
        return objectMapper.readValue(claims.getSubject(), LoggedCustomer.class);
    }
    public Cart getCartFromClaims(String jwt) throws Exception {
        final ObjectMapper mapper = new ObjectMapper();

        Claims claims = Jwts.parser()
                .setSigningKey(secretKeyBytes)
                .parseClaimsJws(jwt)
                .getBody();
        System.out.println(mapper.convertValue(claims.get("cart"),HashMap.class));
        HashMap<Dishes,Integer> items = jsonToCustomMap(mapper.convertValue(claims.get("cart"),HashMap.class).toString());
        return new Cart(items);
    }
    public static HashMap<Dishes, Integer> jsonToCustomMap(String json) {
        try {
            ObjectMapper mapper = new ObjectMapper();
            Map<String, Object> tempMap = mapper.readValue(json, Map.class);

            HashMap<Dishes, Integer> result = new HashMap<>();
            for (Map.Entry<String, Object> entry : tempMap.entrySet()) {
                String dishJson = entry.getKey();
                Dishes dish = mapper.readValue(dishJson, Dishes.class);
                Integer quantity = (Integer) entry.getValue();
                result.put(dish, quantity);
            }
            return result;
        } catch (IOException e) {
            throw new RuntimeException("Error converting JSON to HashMap<Dishes, Integer>", e);
        }
    }
}

