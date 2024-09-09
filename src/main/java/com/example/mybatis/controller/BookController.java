package com.example.mybatis.controller;

import com.example.mybatis.entity.Book;
import com.example.mybatis.entity.Review;
import com.example.mybatis.service.BookService;
import com.example.mybatis.service.ReviewService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class BookController {

    private final BookService bookService;
    private final ReviewService reviewService;

    @GetMapping("/")
    public String index(Model model){
       model.addAttribute("hello", "Hello JSP, Mybatis");
        return "index";
    }

    /*@GetMapping("/bookList")
    public String bookList(Model model){
        Book book1=new Book(1L, "자바", 30000,"나길동",600, null);
        Book book2=new Book(2L, "파이썬", 40000,"이길동",800, null);
        Book book3=new Book(3L, "오라클", 50000,"조길동",700, null);
        List<Book> list=new ArrayList<>();
        list.add(book1);
        list.add(book2);
        list.add(book3);
        model.addAttribute("list", list);
        return "bookList";
    }*/
    @GetMapping("/bookList")
    public String bookLists(Model model){
        List<Book> list=bookService.bookList();
        model.addAttribute("list", list);
        return "bookList";
    }

    @GetMapping("/bookRegister")
    public String bookRegisterGet(){
        return "bookRegister";  // bookRegister.jsp
    }

    @PostMapping("/bookRegister")
    public String bookRegisterPost(Book book){
        bookService.register(book);
        return "redirect:/bookList";
    }

    @GetMapping("/bookView/{id}") // /3
    public String bookView(@PathVariable Long id, Model model){
        Book book=bookService.view(id);
        model.addAttribute("book", book);
        // 리뷰정보 가져오기~~
        List<Review> reviews=reviewService.getByReviews(id);
        model.addAttribute("reviews", reviews);
        // 평점 가져오기
        Double avgRating=reviewService.getAvgRating(id);
        if(avgRating!=null){
            model.addAttribute("avgRating",avgRating);
        }else{
            model.addAttribute("avgRating","0.0");
        }
        return "bookView"; // bookView.jsp
    }

}
