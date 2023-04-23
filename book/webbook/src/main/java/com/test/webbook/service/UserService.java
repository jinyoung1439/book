package com.test.webbook.service;

import com.test.webbook.dto.UserDto;

public interface UserService {
    UserDto login_check(UserDto uDto);

    void insert(UserDto uDto);
}
