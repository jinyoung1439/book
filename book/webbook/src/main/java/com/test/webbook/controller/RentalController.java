package com.test.webbook.controller;

import com.test.webbook.dto.BookDto;
import com.test.webbook.dto.RentalDto;
import com.test.webbook.service.BookService;
import com.test.webbook.service.RentalService;
import com.test.webbook.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
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

    // 로그인한 사람만 접근하도록 구현 못했음 -> 이후 추가될 것
    // 이용자가 보는 책 목록 구현완료
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView list(ModelAndView mv){
        List<BookDto> list = bookService.list();
        mv.addObject("list", list);
        mv.setViewName("rental/list");
        return mv;
    }

    // 책 상세내용 구현완료
    @RequestMapping(value = "/detail/{book_id}", method = RequestMethod.GET)
    public ModelAndView bookDetail(@PathVariable("book_id") int book_id) {
        BookDto book = bookService.detail(book_id);
        System.out.println(book.toString());
        ModelAndView mv = new ModelAndView();
        mv.addObject("book", book);
        mv.setViewName("rental/detail");
        return mv;
    }

    // 책 대여 구현완료
    @RequestMapping(value = "/detail", method =RequestMethod.POST)
    public String rentalBook(@RequestParam("rent") int book_id,RentalDto rentalDto, HttpSession session) {
        String user = String.valueOf( session.getAttribute("user_id"));
        rentalDto.setUser_id(Integer.parseInt(user));
        rentalDto.setBook_id(book_id);
        rentalService.rentalBook(rentalDto);
        bookService.decrementCount(book_id);
        return "redirect:/rental/list";
    }

    // 책 반납 구현완료 -> 실패 시 대여가능 수 증가 안됌
    @RequestMapping(value = "/return", method =RequestMethod.POST)
    public String returnBook(@RequestParam("return") int book_id, RentalDto r_dto, HttpSession session) {
        String user_id = String.valueOf(session.getAttribute("user_id"));
        r_dto.setUser_id(Integer.parseInt(user_id));
        r_dto.setBook_id(book_id);
        int returnBook = rentalService.returnBook(r_dto); // 빌린 사람이 아닌경우 반납하기 눌러도 아무 반응 없도록 설정
                                                        // 쿼리에서 딜리트 된 행이 없는 경우 0을 반환 , 있는 경우 1을 반환
        if(returnBook >0){
        bookService.returnCount(book_id);
        }
        return "redirect:/rental/list";
    }
}
