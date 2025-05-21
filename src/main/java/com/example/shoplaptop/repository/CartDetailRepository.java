package com.example.shoplaptop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


import com.example.shoplaptop.domain.Cart;
import com.example.shoplaptop.domain.CartDetail;
import com.example.shoplaptop.domain.Product;

@Repository
public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {
    boolean existsByCartAndProduct(Cart cart, Product product);

    CartDetail findByCartAndProduct(Cart cart, Product product);
} 
