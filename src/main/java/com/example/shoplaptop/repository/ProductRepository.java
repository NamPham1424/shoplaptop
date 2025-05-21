package com.example.shoplaptop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.shoplaptop.domain.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product,Long> {

    
    // Product save(Product pro);

    // List<Product> findAll();

    // Product findById(long id);

    // Product findByName(String name);

    // void deleteById(long id);

  


}
