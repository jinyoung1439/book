package com.test.webbook.controller;

import com.test.webbook.dto.BookDto;
import com.test.webbook.dto.RentalDto;
import com.test.webbook.service.BookService;
import com.test.webbook.service.RentalService;
import com.test.webbook.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/rental/**")
public class RentalController {

    @Autowired
    RentalService rentalService;

    @Autowired
    BookService bookService;

    // 이용자가 보는 책 목록
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView list(ModelAndView mv){
        List<BookDto> list = bookService.list();
        mv.addObject("list", list);
        mv.setViewName("rental/list");
        return mv;
    }

    // 책 상세내용
    @RequestMapping(value = "/detail/{book_id}", method = RequestMethod.GET)
    public ModelAndView bookDetail(@PathVariable("book_id") int book_id) {
        BookDto book = bookService.detail(book_id);
        System.out.println(book.toString());
        ModelAndView mv = new ModelAndView();
        mv.addObject("book", book);
        mv.setViewName("rental/detail");
        return mv;
    }

    // 책 대여
    @RequestMapping(value = "/detail/{book_id}", method = RequestMethod.POST)
    public String rentalBook(@PathVariable("book_id") int book_id, HttpSession session) {
        RentalDto r_dto = new RentalDto();
        String user = String.valueOf( session.getAttribute("user_id"));
        r_dto.setUser_id(Integer.parseInt(user));
        r_dto.setBook_id(book_id);
        rentalService.rentalBook(r_dto);
        bookService.decrementCount(book_id);
        return "redirect:/rental/list";
    }

    // 책 반납
//    @PostMapping("/return/{book_id}")
//    public String returnBook(@PathVariable("book_id") int book_id, HttpSession session) {
//        RentalDto r_dto = new RentalDto();
//        String user = (String) session.getAttribute("user_id");
//        r_dto.setRental_id(Integer.parseInt(user));
//        r_dto.setBook_id(book_id);
//        rentalService.returnBook(r_dto);
//        return "redirect:/book/detail/" + book_id;
//    }
}
