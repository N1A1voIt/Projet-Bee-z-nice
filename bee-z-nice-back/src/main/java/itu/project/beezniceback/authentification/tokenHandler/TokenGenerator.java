package itu.project.beezniceback.authentification.tokenHandler;//package itu.project.beezniceback.authentification.tokenHandler;
//
//import io.jsonwebtoken.Claims;
//import io.jsonwebtoken.Jws;
//import io.jsonwebtoken.Jwts;
//import io.jsonwebtoken.SignatureAlgorithm;
//import io.jsonwebtoken.security.Keys;
//import itu.project.beezniceback.authentification.model.LoggedCustomer;
//import org.springframework.stereotype.Service;
//
//import java.nio.charset.StandardCharsets;
//import java.security.Key;
//import java.time.Instant;
//import java.time.temporal.ChronoUnit;
//import java.util.Arrays;
//import java.util.Date;
//import java.util.UUID;
//
//@Service
//public class TokenGenerator {
//    public String generateToken(Object object,String hmacKey){
//        String subject = "user123";
//        String issuer = "myApp";
//        Date now = new Date();
//        Date expiration = new Date(now.getTime() + 3600000);
//        byte[] secretKeyBytes = Keys.secretKeyFor(SignatureAlgorithm.HS256).getEncoded();
//
//        String token = Jwts.builder()
//                .setSubject(subject)
//                .setIssuer(issuer)
//                .setIssuedAt(now)
//                .setExpiration(expiration)
//                .claim("user",object)
//                .signWith(SignatureAlgorithm.HS256, secretKeyBytes)
//                .compact();
//        return token;
//    }
//    public Claims decodeToken(String token) {
//        byte[] secretKeyBytes = Keys.secretKeyFor(SignatureAlgorithm.HS256).getEncoded();
//        Jws<Claims> claimsJws = Jwts.parserBuilder()
//                .setSigningKey(secretKeyBytes)
//                .build()
//                .parseClaimsJws(token);
//        Claims claims = claimsJws.getBody();
//        return claims;
//    }
//
//}
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;
import org.springframework.stereotype.Service;

import java.util.Date;
@Service
public class TokenGenerator {

    private final byte[] secretKeyBytes;

    public TokenGenerator() {
        // Generate a secret key for HS256 algorithm
        this.secretKeyBytes = Keys.secretKeyFor(SignatureAlgorithm.HS256).getEncoded();
    }

    public String generateToken(Object object) {
        String subject = "user123";
        String issuer = "myApp";
        Date now = new Date();
        Date expiration = new Date(now.getTime() + 3600000);

        String token = Jwts.builder()
                .setSubject(subject)
                .setIssuer(issuer)
                .setIssuedAt(now)
                .setExpiration(expiration)
                .claim("user", object)
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

