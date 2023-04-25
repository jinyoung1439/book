package com.test.webbook.controller;

import com.test.webbook.dto.BookDto;
import com.test.webbook.dto.UserDto;
import com.test.webbook.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("user/**")
public class UserController {

    @Autowired
    UserService userService;

    /**
     * 회원가입 페이지 호출
     * @return
     */
    @RequestMapping(value="/sign_up", method = RequestMethod.GET)
    public String go_sign_up() {
        return "user/sign_up";
    }

    /**
     * 회원가입
     * @param u_dto
     * @return
     */
    @RequestMapping(value = "/sign_up", method = RequestMethod.POST)
    public String sign_up(UserDto u_dto) {
        System.out.println(u_dto);
        userService.sign_up(u_dto);
        return "redirect:/user/login";
    }

    /**
     * 이메일 중복체크
     * @param email
     * @return
     */
    @PostMapping("email_chk")
    @ResponseBody
    public String getByEmail(@RequestParam("email") String email) {
        int cnt = userService.getByEmail(email);
        String result = "";
        if (cnt>0){
            result="false";
        } else {
            result="true";
        }
        return result;
    }


    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(){
        return "login";
    }

    @RequestMapping(value = "/login_check", method = RequestMethod.POST)
    public ModelAndView login_check(UserDto u_dto, HttpSession session, ModelAndView mv){
        UserDto login_check = userService.login_check(u_dto);
        if(login_check != null){
            session.setAttribute("user_id", login_check.getUser_id());
            session.setAttribute("email", login_check.getEmail());
            session.setMaxInactiveInterval(1800);
            mv.setViewName("home");
        } else if (login_check == null) {
            mv.setViewName("login");
            mv.addObject("data", "error");
        }
        return mv;
    }

    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/user/login";
    }


    @RequestMapping(value = "/detail")
    public ModelAndView detail(int user_id, ModelAndView mv){
        mv.setViewName("user/detail");
        mv.addObject("dto", userService.detail(user_id));
        return mv;
    }

    @RequestMapping(value = "/update")
    public String update(UserDto u_dto){
        userService.update(u_dto);
        return "redirect:/user/detail";
    }

    @RequestMapping(value = "/delete")
    public String delete(UserDto uDto){
        System.out.println(uDto.getUser_id());
        userService.delete(uDto);
        return "redirect:/user/login";
    }

}
