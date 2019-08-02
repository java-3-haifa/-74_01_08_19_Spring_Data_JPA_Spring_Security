package com.telran.telranshopspringdata.config;

import com.telran.telranshopspringdata.data.UserDetailsRepository;
import com.telran.telranshopspringdata.service.CustomUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

@EnableWebSecurity
public class SecurityConfig {
    @Autowired
    UserDetailsRepository repository;

    @Bean
    public UserDetailsService userDetailsService(){
        return new CustomUserDetailsService(repository);
    }

    @Bean
    public PasswordEncoder encoder(){
        return PasswordEncoderFactories.createDelegatingPasswordEncoder();
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService())
                .passwordEncoder(encoder());
    }

    @Configuration
    static class AppSecurityConfig extends WebSecurityConfigurerAdapter{
        @Override
        protected void configure(HttpSecurity http) throws Exception {
            http.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                    .and()
                    .csrf().disable()
                    .authorizeRequests()
                    .antMatchers(HttpMethod.POST,"/registration").permitAll()
                    .antMatchers(HttpMethod.GET,"/products/**","/categories").permitAll()
                    .antMatchers("/user/**","/cart/**").hasRole("USER")
                    .antMatchers("/admin/**").hasRole("ADMIN")
                    .anyRequest().denyAll()
                    .and()
                    .httpBasic();
        }
    }
}
