package com.example.mybatis.repository;

import com.example.mybatis.entity.Book;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BookMapper {
    public List<Book> findAll(); // SQL
    public void save(Book book);
    public Book findById(Long id);
}
