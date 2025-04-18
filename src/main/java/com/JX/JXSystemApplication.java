package com.JX;

import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.Bean;
import org.springframework.web.client.RestTemplate;

@MapperScan("com.JX.mapper")
@SpringBootApplication
@Slf4j
@ServletComponentScan
public class JXSystemApplication {
    public static void main(String[] args) {
        SpringApplication.run(JXSystemApplication.class,args);
        log.info("项目启动成功......");
    }

    @Bean
    public RestTemplate restTemplate() {
        return new RestTemplate();
    }
}

