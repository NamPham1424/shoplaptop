package com.example.shoplaptop.config;

import org.apache.tomcat.util.net.DispatchType;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.session.security.web.authentication.SpringSessionRememberMeServices;

import com.example.shoplaptop.service.CustomUserDetailsService;
import com.example.shoplaptop.service.UserService;
import com.mysql.cj.x.protobuf.MysqlxSession.AuthenticateContinueOrBuilder;

import jakarta.servlet.DispatcherType;

@Configuration
@EnableMethodSecurity(securedEnabled = true)
public class SecurityConfiguration {

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    // @Bean
    //     public PasswordEncoder passwordEncoder() {
    //         return NoOpPasswordEncoder.getInstance(); // Không mã hóa, so sánh văn bản thuần
    //     }

   @Bean
   public UserDetailsService userDetailsService(UserService userService) {
       return new CustomUserDetailsService(userService);
   }


   @Bean
   public AuthenticationManager authenticationManager(HttpSecurity http ,PasswordEncoder passwordEncoder,
           UserDetailsService userDetailsService) throws Exception {
       AuthenticationManagerBuilder authenticationManagerBuilder = http
               .getSharedObject(AuthenticationManagerBuilder.class);
       authenticationManagerBuilder
               .userDetailsService(userDetailsService)
               .passwordEncoder(passwordEncoder);

       return authenticationManagerBuilder.build();

   }
   @Bean
   public AuthenticationSuccessHandler customSuccessHandler() {
       return new CustomSuccessHandler();
   }

   @Bean
   public SpringSessionRememberMeServices rememberMeServices() {
       SpringSessionRememberMeServices rememberMeServices = new SpringSessionRememberMeServices();
       rememberMeServices.setAlwaysRemember(true);

    //    rememberMeServices.setValiditySeconds(0);

       return rememberMeServices;
   }

           
   @Bean
   SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
    http
        .authorizeHttpRequests(authorize -> authorize
                .dispatcherTypeMatchers(DispatcherType.FORWARD, DispatcherType.INCLUDE)
        .permitAll()

                .requestMatchers("/", "/login", "/product/**", "/client/**",
                "/css/**", "/js/**", "/images/**")
                .permitAll()
        .requestMatchers("/admin/**").hasRole("ADMIN")
        .anyRequest().authenticated())
        
        .sessionManagement((sessionManagement) -> sessionManagement
        .sessionCreationPolicy(SessionCreationPolicy.ALWAYS)
        .invalidSessionUrl("/logout?expired")
        .maximumSessions(1)
        .maxSessionsPreventsLogin(false))

        .logout(logout -> logout.deleteCookies("JSESSIONID").invalidateHttpSession(false))
        
        .rememberMe(r -> r.rememberMeServices(rememberMeServices()))

        .formLogin(formLogin -> formLogin
        .loginPage("/login")
        .failureUrl("/login?error")
        .successHandler(customSuccessHandler())
        .permitAll())
        
        .exceptionHandling(ex -> ex.accessDeniedPage("/access-deny"));

    return http.build();



}










}
