package com.example.mybatis.repository;

import com.example.mybatis.entity.Customer;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CustomerMapper {

    public Customer findByUsernameAndPassword(Customer customer);
}
