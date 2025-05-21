package com.example.shoplaptop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.shoplaptop.domain.User;
import java.util.List;


@Repository
public interface UserRespository extends JpaRepository<User,Long> {

    User save(User nam);
    
    List<User> findOneByEmail(String email);

    List<User> findAll();
    
    User findById(long id);

    void deleteById(long id);
 
    boolean existsByEmail(String email);

    User findByEmail(String email);
} 
