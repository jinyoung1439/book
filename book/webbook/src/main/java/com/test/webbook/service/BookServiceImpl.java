package com.test.webbook.service;

import com.test.webbook.dto.BookDto;
import com.test.webbook.repo.BookDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookServiceImpl implements BookService{

    @Autowired
    BookDao bookDao;


    @Override
    public List<BookDto> list() {
        return bookDao.list();
    }

    @Override
    public void insert(BookDto dto) {
        bookDao.insert(dto);
    }

    @Override
    public BookDto detail(int book_id) {
        return bookDao.detail(book_id);
    }

    @Override
    public void update(BookDto dto) {
        bookDao.update(dto);
    }

    @Override
    public void delete(BookDto dto) {
        bookDao.delete(dto);
    }

    //유저용 책 대여
    @Override
    public void decrementCount(int bookId) {
        bookDao.decrementCount(bookId);
    }

    // 책 반납
    @Override
    public void returnCount(int bookId) {
        bookDao.returnCount(bookId);

    }


}
