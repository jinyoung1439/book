package com.test.webbook.service;

import com.test.webbook.dto.UserDto;

public interface UserService {
    UserDto login_check(UserDto uDto);

    void sign_up(UserDto uDto);

    int getByEmail(String email);


//
//    UserDto detail(int userId);
//
//    void update(UserDto uDto);
}
