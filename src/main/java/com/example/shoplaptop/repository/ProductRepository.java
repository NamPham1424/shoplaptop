package com.example.shoplaptop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import com.example.shoplaptop.domain.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> ,JpaSpecificationExecutor<Product> {
    Page<Product> findAll(Pageable page);

    Page<Product> findAll(Specification<Product> spec, Pageable page);

   


    
    // Product save(Product pro);

    // List<Product> findAll();

    // Product findById(long id);

    // Product findByName(String name);

    // void deleteById(long id);

  


}
