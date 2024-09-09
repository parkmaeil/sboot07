package com.example.mybatis.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Review {
    private Long id;
    private int cost;
    private String content;
    private Date createdAt;
    private Long customer_id;
    private Long book_id;
}
