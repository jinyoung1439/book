package com.test.webbook.service;

import com.test.webbook.dto.UserDto;
import com.test.webbook.repo.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    UserDao userDao;

    @Override
    public UserDto login_check(UserDto uDto) {
        return userDao.login_check(uDto);
    }

    @Override
    public void sign_up(UserDto uDto) {
        userDao.sign_up(uDto);
    }

    @Override
    public int getByEmail(String email) {
        return userDao.getByEmail(email);
    }


//    @Override
//    public UserDto detail(int userId) {
//        return null;
//    }
//
//    @Override
//    public void update(UserDto uDto) {
//
//    }
}
