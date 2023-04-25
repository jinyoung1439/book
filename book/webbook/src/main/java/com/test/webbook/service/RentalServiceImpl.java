package com.test.webbook.service;


import com.test.webbook.dto.BookDto;
import com.test.webbook.dto.RentalDto;
import com.test.webbook.repo.RentalDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class RentalServiceImpl implements RentalService {

    @Autowired
    RentalDao rentalDao;
    @Autowired
    BookService bookService;

    @Override
    public List<BookDto> list() {
        return rentalDao.list();
    }

    @Override
    public void rentalBook(RentalDto rDto) {
        rentalDao.rentalbook(rDto);
        bookService.decrementCount(rDto.getBook_id());
    }


    @Override
    public void returnBook(RentalDto rDto) {

    }




}
