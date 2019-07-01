package edu.nuc.service.impl;/**
 * Created by 57180 on 2019/5/17.
 */

import edu.nuc.dao.UserMapper;
import edu.nuc.entity.User;
import edu.nuc.entity.UserExample;
import edu.nuc.service.LoginService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service
public class LoginServiceImpl implements LoginService {

    @Resource
    private UserMapper userMapper;

    @Override
    /*
    ** 登陆
    */
    public boolean selectByuserIdAndpassWord(String userId, String passWord) {

        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();
        criteria.andUseridEqualTo(userId).andPasswordEqualTo(passWord);
        List<User> list = userMapper.selectByExample(example);
        if(list.size()>0){
            return true;
        }else {
            return false;
        }
    }

    @Override
    /*
    ** 查看用户是否存在
    */
    public boolean selectUserId(String userId) {
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();
        criteria.andUseridEqualTo(userId);
        int i = userMapper.countByExample(example);
        if(i>0){
            return true;
        }else {
            return false;
        }
    }

    @Override
    /*
    ** 根据id查看用户信息
    */
    public User selectUserByuserId(String userId) {
        User user = userMapper.selectByPrimaryKey(userId);
        return user;
    }

    @Override
    public boolean registerUser(User user) {
        int i = userMapper.insertSelective(user);
        if(i>0){
            return true;
        }else {
            return false;
        }
    }
}
