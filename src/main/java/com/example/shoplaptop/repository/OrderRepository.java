package com.example.shoplaptop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.shoplaptop.domain.Order;
import com.example.shoplaptop.domain.User;

@Repository
public interface OrderRepository extends JpaRepository<Order,Long>{
    List<Order> findByUser(User user);
    
} 