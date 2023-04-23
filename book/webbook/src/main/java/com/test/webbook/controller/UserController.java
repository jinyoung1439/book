package com.test.webbook.controller;

import com.test.webbook.dto.UserDto;
import com.test.webbook.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("user/**")
public class UserController {

    @Autowired
    UserService userService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(){
        return "user/login";
    }

    @RequestMapping(value = "/login_check", method = RequestMethod.POST)
    public ModelAndView login_check(UserDto u_dto, HttpSession session, ModelAndView mv){
        UserDto login_chk = userService.login_check(u_dto);
        if(login_chk != null){
            session.setAttribute("email", login_chk.getEmail());
            session.setMaxInactiveInterval(1800);
            mv.setViewName("book/list");
        } else if (login_chk == null) {
            mv.setViewName("user/login");
            mv.addObject("data", "error");
        }
        return mv;
    }

    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/user/login";
    }

    @RequestMapping(value="/sign_in", method = RequestMethod.GET)
    public String sign_in(UserDto u_dto) {
        userService.insert(u_dto);
        return "redirect:/user/login";
    }




}
