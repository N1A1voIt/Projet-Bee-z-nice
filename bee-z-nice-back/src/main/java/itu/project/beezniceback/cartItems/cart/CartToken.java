package itu.project.beezniceback.cartItems.cart;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;
import org.springframework.stereotype.Service;

import java.util.Date;
@Service
public class CartToken {
    private final byte[] secretKeyBytes;

    public CartToken() {
        this.secretKeyBytes = Keys.secretKeyFor(SignatureAlgorithm.HS256).getEncoded();
    }

    public String generateToken(Object object) {
        String subject = "cart123";
        String issuer = "myApp";
        Date now = new Date();
        Date expiration = new Date(now.getTime() + 3600000);

        String token = Jwts.builder()
                .setSubject(subject)
                .setIssuer(issuer)
                .setIssuedAt(now)
                .setExpiration(expiration)
                .claim("cart", object)
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
}
