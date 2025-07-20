package com.example.shoplaptop.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.example.shoplaptop.domain.Role;
import com.example.shoplaptop.domain.User;
import com.example.shoplaptop.domain.dto.RegisterDTO;
import com.example.shoplaptop.repository.OrderRepository;
import com.example.shoplaptop.repository.ProductRepository;
import com.example.shoplaptop.repository.RoleRespository;
import com.example.shoplaptop.repository.UserRespository;

@Service
public class UserService {

    private final UserRespository userRespository;
    private final RoleRespository roleRespository;
    private final ProductRepository productRepository;
    private final OrderRepository orderRepository;

    public UserService(UserRespository userRespository,
            RoleRespository roleRespository,
                    ProductRepository productRepository,
                    OrderRepository orderRepository) {
        this.userRespository = userRespository;
        this.roleRespository = roleRespository;
        this.orderRepository = orderRepository;
        this.productRepository = productRepository;
    }

     public Page<User> getAllUsers(Pageable pageable) {
        return this.userRespository.findAll(pageable);
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

         return this.userRespository.findByEmail(email);

     }

     public long countUsers() {
         return this.userRespository.count();
     }

     public long countProducts() {
         return this.productRepository.count();

     }

     public long countOrders() {
         return this.orderRepository.count();
        
     }

    
}
