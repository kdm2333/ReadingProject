package edu.nuc.entity;

import java.util.Date;

public class Book {
    private Integer bookid;

    private String bookname;

    private String author;

    private String press;

    private String description;

    private String contenturl;

    private String pictureurl;

    private Date createtime;

    private Integer status;

    private Integer booktype;

    private String isentity;

    private Integer commentno;

    public Integer getBookid() {
        return bookid;
    }

    public void setBookid(Integer bookid) {
        this.bookid = bookid;
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname == null ? null : bookname.trim();
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author == null ? null : author.trim();
    }

    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press == null ? null : press.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public String getContenturl() {
        return contenturl;
    }

    public void setContenturl(String contenturl) {
        this.contenturl = contenturl == null ? null : contenturl.trim();
    }

    public String getPictureurl() {
        return pictureurl;
    }

    public void setPictureurl(String pictureurl) {
        this.pictureurl = pictureurl == null ? null : pictureurl.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
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

    public String getIsentity() {
        return isentity;
    }

    public void setIsentity(String isentity) {
        this.isentity = isentity == null ? null : isentity.trim();
    }

    public Integer getCommentno() {
        return commentno;
    }

    public void setCommentno(Integer commentno) {
        this.commentno = commentno;
    }

    @Override
    public String toString() {
        return "Book{" +
                "bookid=" + bookid +
                ", bookname='" + bookname + '\'' +
                ", author='" + author + '\'' +
                ", press='" + press + '\'' +
                ", description='" + description + '\'' +
                ", contenturl='" + contenturl + '\'' +
                ", pictureurl='" + pictureurl + '\'' +
                ", createtime=" + createtime +
                ", status=" + status +
                ", booktype=" + booktype +
                ", isentity='" + isentity + '\'' +
                ", commentno=" + commentno +
                '}';
    }
}