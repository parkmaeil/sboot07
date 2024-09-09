package com.example.mybatis.service;

import com.example.mybatis.entity.Customer;
import com.example.mybatis.repository.CustomerMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CustomerService {

    private final CustomerMapper customerMapper;

    public Customer login(Customer customer){
        return customerMapper.findByUsernameAndPassword(customer);
    }
}
