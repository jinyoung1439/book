package com.test.webbook.repo;

import com.test.webbook.dto.BookDto;
import com.test.webbook.dto.RentalDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class RentalDao {

    @Autowired
    private SqlSession sqlSession;

    public void rentalbook(RentalDto rDto) {
        sqlSession.insert("rental.insert",rDto);

    }

    public List<BookDto> list() {
        return sqlSession.selectList("rental.list");
    }

    public int returnbook(RentalDto rDto) {
        return sqlSession.delete("rental.delete",rDto);
    }
}
