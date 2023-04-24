package com.test.webbook.repo;

import com.test.webbook.dto.UserDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao {

    @Autowired
    SqlSession sqlSession;


    public UserDto login_check(UserDto uDto) {
        return sqlSession.selectOne("user.login_check", uDto);
    }
    

    public void sign_up(UserDto uDto) {
        sqlSession.insert("user.insert",uDto);
    }

    public int getByEmail(String email) {
        return sqlSession.selectOne("user.getByEmail", email);
    }
}
