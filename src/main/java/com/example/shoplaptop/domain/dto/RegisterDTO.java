package com.example.shoplaptop.domain.dto;

import com.example.shoplaptop.service.validator.RegisterChecked;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Size;

@RegisterChecked
public class RegisterDTO {
    @Size(min=3, message ="FirstNName must be at least 3 characters " )
    private String firstName;
     @Size(min=3, message ="LastName must be at least 3 characters " )
     private String lastName;
    
     @Email(message = "Invalid email " ,regexp = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$")
    private String email;
    private String password;
    private String confirmPassword;
    public String getFirstName() {
        return firstName;
    }
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    public String getLastName() {
        return lastName;
    }
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getConfirmPassword() {
        return confirmPassword;
    }
    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }


    
        
    
}
