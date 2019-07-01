package edu.nuc.service.impl;/**
 * Created by 57180 on 2019/5/17.
 */

import com.github.pagehelper.PageInfo;
import edu.nuc.dao.UserMapper;
import edu.nuc.entity.User;
import edu.nuc.entity.UserExample;
import edu.nuc.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;

    @Override
    public List<User> selectUserList() {
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        List<User> list = userMapper.selectByExample(userExample);
        return list;
    }

    @Override
    public List<User> selectUserListByType(int type) {
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andTypeEqualTo(type);
        List<User> list = userMapper.selectByExample(userExample);
        return list;
    }

    @Override
    public boolean updateUser(User user) {
        int i = userMapper.updateByPrimaryKeySelective(user);
        if (i>0){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public User selectUserByUserId(String userId) {
        User user = userMapper.selectByPrimaryKey(userId);
        return user;
    }
}
