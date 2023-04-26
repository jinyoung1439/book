package com.test.webbook.controller;

import com.test.webbook.dto.BookDto;
import com.test.webbook.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("book/**")
public class BookController {

    @Autowired
    BookService bookService;

    // 현재 관리자만 접근되도록 구현안했음.-> 이후 추가될 것
    // 관리자용 책 리스트
    @RequestMapping(value = "list" )
    public ModelAndView list(ModelAndView mv){
        List<BookDto> list = bookService.list();
        mv.addObject("list", list);
        mv.setViewName("book/list");
        return mv;
    }

    // 관리자 책 등록 페이지 호출
    @RequestMapping(value="/create")
    public String create() {
        return "book/create";
    }

    // 관리자 책 등록
    @RequestMapping(value = "/insert")
    public String insert(BookDto dto){
        bookService.insert(dto);
        return "redirect:/book/list";
    }

    // 관리자 책 상세 호출
    @RequestMapping(value = "/detail")
    public ModelAndView detail(int book_id, ModelAndView mv){
        mv.setViewName("book/detail");
        mv.addObject("dto", bookService.detail(book_id));
        return mv;
    }

    // 관리자 등록한 책 수정
    @RequestMapping(value = "/update")
    public String update(BookDto dto){
        bookService.update(dto);
        return "redirect:/book/list";
    }

    // 관리자 등록한 책 삭제
    @RequestMapping(value = "/delete")
    public String delete(BookDto dto){
        bookService.delete(dto);
        return "redirect:/book/list";
    }


}
