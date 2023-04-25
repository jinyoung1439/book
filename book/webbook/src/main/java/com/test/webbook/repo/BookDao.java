package com.test.webbook.repo;


import com.test.webbook.dto.BookDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public class BookDao {

    @Autowired
    SqlSession sqlSession;

    public List<BookDto> list() {
        return sqlSession.selectList("book.list");
    }


    public void insert(BookDto dto) {
        sqlSession.insert("book.insert",dto);
    }

    public BookDto detail(int book_id) {
        return sqlSession.selectOne("book.detail",book_id);
    }

    public void update(BookDto dto) {
        sqlSession.update("book.update",dto);
    }

    public void delete(BookDto dto) {
        sqlSession.delete("book.delete",dto);
    }

    public void decrementCount(int bookId) {
        sqlSession.update("book.decrementCount",bookId);
    }
}
