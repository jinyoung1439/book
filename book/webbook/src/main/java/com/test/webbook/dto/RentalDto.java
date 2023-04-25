package com.test.webbook.dto;

import java.util.Date;

public class RentalDto {

    private int rental_id;
    private int book_id;
    private int user_id;
    private Date rental_date; // 대여일
    private Date return_date; // 반납일

    public int getRental_id() {
        return rental_id;
    }

    public void setRental_id(int rental_id) {
        this.rental_id = rental_id;
    }

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public Date getRental_date() {
        return rental_date;
    }

    public void setRental_date(Date rental_date) {
        this.rental_date = rental_date;
    }

    public Date getReturn_date() {
        return return_date;
    }

    public void setReturn_date(Date return_date) {
        this.return_date = return_date;
    }

    @Override
    public String toString() {
        return "RentalDto{" +
                "rental_id=" + rental_id +
                ", book_id=" + book_id +
                ", user_id=" + user_id +
                ", rental_date=" + rental_date +
                ", return_date=" + return_date +
                '}';
    }
}
