package com.example.mybatis.service;

import com.example.mybatis.entity.Book;
import com.example.mybatis.repository.BookMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BookService {

    private final BookMapper bookMapper;

    public List<Book> bookList(){
        return bookMapper.findAll();
    }
    public void register(Book book){
        bookMapper.save(book);
    }

    public Book view(Long id){
        return bookMapper.findById(id);
    }
}
