package com.example.mybatis.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Customer {

    private Long id;
    private String username;
    private String password;
    private String customerName;
    private int age;
    private String rating;
    private String occupation;
    private int reserves;

}
