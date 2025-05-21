package com.example.shoplaptop.service;

import java.util.Collections;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.example.shoplaptop.domain.User;

public class CustomUserDetailsService implements UserDetailsService {

    public final UserService userService;

    public CustomUserDetailsService( UserService userService) {
        this.userService = userService;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
       
        com.example.shoplaptop.domain.User user = this.userService.getUserByEmail(username);
        if (user == null) {
            throw new UsernameNotFoundException("user not found");
        }
    

        return new org.springframework.security.core.userdetails.User(
            user.getEmail(), user.getPassword(), 
                Collections.singletonList(new SimpleGrantedAuthority("ROLE_"+user.getRole().getName())));
    }
    


}
