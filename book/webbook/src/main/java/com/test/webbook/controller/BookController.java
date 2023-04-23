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


    @RequestMapping(value = "list" )
    public ModelAndView list(ModelAndView mv){
        List<BookDto> list = bookService.list();
        mv.addObject("list", list);
        mv.setViewName("book/list");
        return mv;
    }


    @RequestMapping(value="/create")
    public String create() {
        return "book/create";
    }

    @RequestMapping(value = "/insert" , produces="application/text; charset=UTF-8;")
    public String insert(BookDto dto){
        bookService.insert(dto);
        return "redirect:/book/list";
    }

    @RequestMapping(value = "/detail")
    public ModelAndView detail(int book_id, ModelAndView mv){
        mv.setViewName("book/detail");
        mv.addObject("dto", bookService.detail(book_id));
        return mv;
    }

    @RequestMapping(value = "/update")
    public String update(BookDto dto){
        bookService.update(dto);
        return "redirect:/book/list";
    }

    @RequestMapping(value = "/delete")
    public String delete(BookDto dto){
        System.out.println(dto.getBook_id());
        bookService.delete(dto);
        return "redirect:/book/list";
    }


}
