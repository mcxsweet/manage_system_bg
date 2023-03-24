package com.example.config;

import com.example.utility.Token.AuthenticationInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MVCConfig implements WebMvcConfigurer {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(authenticationInterceptor())
//                表示拦截所有请求
                .addPathPatterns("/**")
//                表示取消对特定路径的拦截
                .excludePathPatterns("/user/**")
                //取消拦截swagger文档
                .excludePathPatterns("/swagger-ui/**");
    }

    @Bean
    public AuthenticationInterceptor authenticationInterceptor() {
        return new AuthenticationInterceptor();
    }
}
