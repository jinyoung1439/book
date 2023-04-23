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
    public void insert(UserDto uDto) {
        userDao.insert(uDto);

    }
}
