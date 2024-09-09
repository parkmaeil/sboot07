package com.example.mybatis.repository;

import com.example.mybatis.entity.Review;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ReviewMapper {

    public void save(Review review); //SQL
    public List<Review> findAll(Long book_id);

    @Select("select avg(cost) from review where book_id=#{book_id}")
    public Double getAvgRating(Long book_id);

    @Delete("delete from review where id=#{id}")
    public void reviewDelete(Long id);
}
