package com.example.utility.Token;

import com.alibaba.druid.util.StringUtils;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.example.mapper.UserMAPPER;
import com.example.utility.DataResponses;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AuthenticationInterceptor implements HandlerInterceptor {
    @Autowired
    private TokenUtil tokenUtil;

    @Autowired
    private UserMAPPER userMAPPER;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
        response.setCharacterEncoding("utf-8");
        //        查看请求中是否存在token
        String token = tokenUtil.getToken(request);
        String userId = tokenUtil.verifyToken(token);
        if (StringUtils.isEmpty(token)) {
            response.getWriter().write(JSONObject.toJSONString(new DataResponses(false, "Lack of token")));
            return false;
        }
        //验证Token
//        if (userMAPPER.selectById(userId) != null) {
//            response.sendRedirect("http://localhost:8081/");
//            return false;
//        }


        return true;
    }
}
