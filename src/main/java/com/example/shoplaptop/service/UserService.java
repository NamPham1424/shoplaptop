package com.example.shoplaptop.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.example.shoplaptop.domain.Role;
import com.example.shoplaptop.domain.User;
import com.example.shoplaptop.domain.dto.RegisterDTO;
import com.example.shoplaptop.repository.RoleRespository;
import com.example.shoplaptop.repository.UserRespository;

@Service
public class UserService {

    private final UserRespository userRespository;
    private final RoleRespository roleRespository;

    public UserService(UserRespository userRespository,RoleRespository roleRespository) {
        this.userRespository = userRespository;
        this.roleRespository = roleRespository;
    }

     public List<User> getAllUsers() {
        return this.userRespository.findAll();
    }
     
    public List<User> getAllUsersByEmail(String email) {
        return this.userRespository.findOneByEmail(email);
    }
     

      @Transactional
     public User handleSaveUser(User user) {
         User eric = this.userRespository.save(user);
         System.out.println(eric);
         return eric;
     }

     public User getUserById(long id) {
         return this.userRespository.findById(id);
     }
     
     public void deleteAUser(long id) {
         this.userRespository.deleteById(id);
         ;
     }
     
     public Role getRoleByName(String name) {
         return this.roleRespository.findByName(name);
     }
    
     public boolean checkEmailExist(String email) {
         return this.userRespository.existsByEmail(email);
     }

     public User registerDTOtoUser(RegisterDTO registerDTO) {
         User user = new User();

         user.setFullname(registerDTO.getFirstName() + " " + registerDTO.getLastName());
         user.setEmail(registerDTO.getEmail());
         user.setPassword(registerDTO.getPassword());

         return user;

     }

     public User getUserByEmail(String email) {

         return  this.userRespository.findByEmail(email);
    
  }

    
}
