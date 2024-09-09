package com.example.mybatis.service;

import com.example.mybatis.entity.Review;
import com.example.mybatis.repository.ReviewMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ReviewService {

    private  final ReviewMapper reviewMapper;

    public void register(Review review){
        reviewMapper.save(review);
    }

    public List<Review> getByReviews(Long book_id){
        return reviewMapper.findAll(book_id);
    }

    public Double getAvgRating(Long book_id){
        return reviewMapper.getAvgRating(book_id);
    }

    public void reviewRemove(Long id){
        reviewMapper.reviewDelete(id);
    }
}
