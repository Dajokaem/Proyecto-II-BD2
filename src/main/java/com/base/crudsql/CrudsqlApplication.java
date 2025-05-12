package com.base.crudsql;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import javax.sql.DataSource;
import org.springframework.boot.builder.SpringApplicationBuilder;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;

@SpringBootApplication
public class CrudsqlApplication {

    @Bean
    public JdbcTemplate jdbcTemplate(DataSource dataSource) {
        return new JdbcTemplate(dataSource);
    }

   
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(CrudsqlApplication.class);
    }

    public static void main(String[] args) {
        SpringApplication.run(CrudsqlApplication.class, args);
    }

}
