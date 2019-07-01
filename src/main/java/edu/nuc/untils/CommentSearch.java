package edu.nuc.untils;/**
 * Created by 57180 on 2019/5/31.
 */

import java.util.Date;

/**
 * @program: ReadingProject
 * @description:
 * @author: 李柏君
 * @create: 2019-05-31 11:33
 **/
public class CommentSearch {

    private Integer bookid;

    private String userid;

    private String topic;

    private Date createtime;

    private Integer status;

    private Integer usertype;


    //作者名
    private String username;

    //书名
    private String bookname;

    private Integer pageNum = 1;
    private Integer pageSize = 5;

    public Integer getBookid() {
        return bookid;
    }

    public void setBookid(Integer bookid) {
        this.bookid = bookid;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
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

    public Integer getUsertype() {
        return usertype;
    }

    public void setUsertype(Integer usertype) {
        this.usertype = usertype;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    @Override
    public String toString() {
        return "CommentSearch{" +
                "bookid=" + bookid +
                ", userid='" + userid + '\'' +
                ", topic='" + topic + '\'' +
                ", createtime=" + createtime +
                ", status=" + status +
                ", usertype=" + usertype +
                ", username='" + username + '\'' +
                ", bookname='" + bookname + '\'' +
                ", pageNum=" + pageNum +
                ", pageSize=" + pageSize +
                '}';
    }
}
