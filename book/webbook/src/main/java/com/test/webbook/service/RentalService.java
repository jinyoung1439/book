package com.test.webbook.service;

import com.test.webbook.dto.BookDto;
import com.test.webbook.dto.RentalDto;

import java.util.List;

public interface RentalService {


    void rentalBook(RentalDto rDto);

    List<BookDto> list();

    void returnBook(RentalDto rDto);


}
