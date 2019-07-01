package edu.nuc.service.impl;/**
 * Created by 57180 on 2019/5/17.
 */

import edu.nuc.dao.UsercommentMapper;
import edu.nuc.entity.*;
import edu.nuc.service.UserCommentService;
import edu.nuc.untils.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserComentServiceImpl implements UserCommentService {

    @Autowired
    private UsercommentMapper usercommentMapper;

    /*
    ** 插入评论
    */
    @Override
    public boolean insertComment(Usercomment usercomment) {
        int i= usercommentMapper.insertSelective(usercomment);
        if(i > 0){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public boolean deleteComment(int commentId) {
        Usercomment usercomment = new Usercomment();
        usercomment.setCommentid(commentId);
        usercomment.setStatus(Constant.DELETE);
        int i= usercommentMapper.updateByPrimaryKeySelective(usercomment);
        if(i > 0){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public boolean updateComment(Usercomment usercomment) {
        UsercommentExample example = new UsercommentExample();
        int i= usercommentMapper.updateByPrimaryKeySelective(usercomment);
        if(i > 0){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public boolean updateComentByBookId(Usercomment usercomment, UsercommentExample example) {
        int i= usercommentMapper.updateByExampleSelective(usercomment,example);
        if(i > 0){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public List<Usercomment> selectAllComment(int bookId) {
        UsercommentExample usercommentExample = new UsercommentExample();
        UsercommentExample.Criteria criteria = usercommentExample.createCriteria();
        criteria.andStatusEqualTo(Constant.VALID).andBookidEqualTo(bookId);
        List<Usercomment> list = usercommentMapper.selectByExample(usercommentExample);

        return list;

    }

    @Override
    public List<Usercomment> selectByTopic(String topic) {
        UsercommentExample usercommentExample = new UsercommentExample();
        UsercommentExample.Criteria criteria = usercommentExample.createCriteria();
        criteria.andTopicLike("%"+topic+"%").andStatusEqualTo(Constant.VALID);

        List<Usercomment> list = usercommentMapper.selectByExample(usercommentExample);
        return list;

    }

    /*
    ** 根据主键查看详情
    * */
    @Override
    public Usercomment selectBycommentId(int commentId){
        Usercomment usercomment =usercommentMapper.selectByPrimaryKey(commentId);

        return usercomment;
    }
    /*
    ** 按评论人类型查找
    */
    @Override
    public List<Usercomment> selectByUserType(int type){
        UsercommentExample usercommentExample = new UsercommentExample();
        usercommentExample.setOrderByClause("'createTime' DESC");
        UsercommentExample.Criteria criteria = usercommentExample.createCriteria();
        criteria.andUsertypeEqualTo(type).andStatusEqualTo(Constant.VALID);
        List<Usercomment> list = usercommentMapper.selectByExampleWithBLOBs(usercommentExample);
        return list;
    }

    /**
    * 查看我的评论
    */
    @Override
    public List<Usercomment> selectMyComment(String userid , int status){
        UsercommentExample usercommentExample = new UsercommentExample();
        usercommentExample.setOrderByClause("'createTime' DESC");
        UsercommentExample.Criteria criteria = usercommentExample.createCriteria();
        criteria.andUseridEqualTo(userid).andStatusEqualTo(status);
        List<Usercomment> list = usercommentMapper.selectByExample(usercommentExample);
        return list;
    }



}
