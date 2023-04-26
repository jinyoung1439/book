package com.test.webbook.service;

import com.test.webbook.dto.BookDto;
import com.test.webbook.repo.BookDao;

import java.util.List;

public interface BookService {


     List<BookDto> list();

     void insert(BookDto dto);

     BookDto detail(int book_id);

     void update(BookDto dto);

     void delete(BookDto dto);

     void decrementCount(int bookId);

     void returnCount(int bookId);
}
