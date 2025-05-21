package com.example.shoplaptop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.shoplaptop.domain.Role;




@Repository
public interface RoleRespository extends JpaRepository<Role,Long> {

    Role findByName(String name);
} 
