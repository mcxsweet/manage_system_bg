package com.example.utility.Token;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.example.object.User;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class TokenUtil {

    //设置过期时间
    private static final long EXPIRE_TIME = 15 * 60 * 1000;//默认15分钟
    //私钥
    private static final String TOKEN_SECRET = "privateKey";

    //生成token
    public String generateToken(User user) {

        // 私钥和加密算法
        Algorithm algorithm = Algorithm.HMAC256(TOKEN_SECRET);

        // 设置头部信息
        Map<String, Object> header = new HashMap<>(2);
        header.put("Type", "Jwt");
        header.put("alg", "HS256");

        Date start = new Date();
        long currentTime = System.currentTimeMillis() + 60 * 60 * 1000;//一小时有效时间
        Date end = new Date(currentTime);
        String token = "";
        token = JWT.create()
                .withAudience(user.getId().toString())
                .withAudience(user.getName())
                .withIssuedAt(start)
                .withExpiresAt(end)
                .sign(Algorithm.HMAC256(user.getPassword()));

        String token2 = "";
        token2 = JWT.create()
                .withHeader(header)
                .withClaim("userId", user.getId())
                .withClaim("userName", user.getName())
                .withIssuedAt(start)
                .withExpiresAt(end)
                .sign(algorithm);
        return token2;
    }

    public static String verifyToken(String token) {
        try {
            Algorithm algorithm = Algorithm.HMAC256(TOKEN_SECRET);
            JWTVerifier verifier = JWT.require(algorithm).build();
            DecodedJWT jwt = verifier.verify(token);
            String userId = jwt.getClaim("userId").asString();
            return userId;
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * @param request
     * @return 获取token
     */
    public String getToken(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        for (Cookie c : cookies) {
            if (c.getName().equals("token")) {
                return c.getValue();
            }
        }
        return null;
    }
}

