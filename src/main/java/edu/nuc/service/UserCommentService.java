package edu.nuc.service;

import edu.nuc.entity.Usercomment;
import edu.nuc.entity.UsercommentExample;

import java.util.List;

public interface UserCommentService {

    //添加评论
     boolean insertComment(Usercomment usercomment);

    //将评论置为无效
     boolean deleteComment(int commentId);

     boolean updateComment(Usercomment usercomment);

     boolean updateComentByBookId(Usercomment usercomment, UsercommentExample example);


    //查找所有效评论（status为1）
     List<Usercomment> selectAllComment(int bookId);

    //查找所有名称
     List<Usercomment> selectByTopic(String topic);

     Usercomment selectBycommentId(int commentId);

    //按评论人类型查找
    List<Usercomment> selectByUserType(int type);

    List<Usercomment> selectMyComment(String userid,int  status);





}
