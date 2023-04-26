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

    // 이메일 중복체크
    public int getByEmail(String email) {
        return sqlSession.selectOne("user.getByEmail", email);
    }

    public UserDto detail(int userId) {
        return  sqlSession.selectOne("user.detail",userId);
    }

    public void update(UserDto uDto) {
        sqlSession.update("user.update", uDto);
    }

    public void delete(UserDto uDto) {
        sqlSession.delete("user.delete",uDto);
    }
}
