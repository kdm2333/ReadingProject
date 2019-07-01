package edu.nuc.entity;

import java.util.Date;

/**
 * @Author: 裴佳琦
 * @CreateDate: 2019/5/22 17:03
 * @Description:
 */
public class CommentVO {
    private Integer commentid;

    private Integer bookid;

    private String userid;

    private String topic;

    private Integer clientcount;

    private Date createtime;

    private Integer status;

    private Integer usertype;

    private String content;


    //作者名
    private String username;

    //书名
    private String bookname;


    public Integer getCommentid() {
        return commentid;
    }

    public void setCommentid(Integer commentid) {
        this.commentid = commentid;
    }

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

    public Integer getClientcount() {
        return clientcount;
    }

    public void setClientcount(Integer clientcount) {
        this.clientcount = clientcount;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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
}
