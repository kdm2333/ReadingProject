package edu.nuc.untils;/**
 * Created by 57180 on 2019/5/31.
 */

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.regex.Pattern;

/**
 * @program: ReadingProject
 * @description:
 * @author: 李柏君
 * @create: 2019-05-31 11:29
 **/
public class BookSearch {

    private String bookname;

    private String author;

    private String press;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createtime;

    private Integer status;

    private Integer booktype;



    private Integer pageNum = 1;
    private Integer pageSize = 5;

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getBookname() {

        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getBooktype() {
        return booktype;
    }

    public void setBooktype(Integer booktype) {
        this.booktype = booktype;
    }



    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }
}
