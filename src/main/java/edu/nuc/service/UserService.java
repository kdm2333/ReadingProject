package edu.nuc.service;

import edu.nuc.entity.User;

import java.util.List;

/**
 * Created by 57180 on 2019/5/17.
 */

public interface UserService {

    //查询所有用户
    public List<User> selectUserList();
    //根据权限查询用户列表
    public List<User> selectUserListByType(int type);
    //更改用户信息(包括权限)
    public boolean updateUser(User user);

    public User selectUserByUserId(String userId);
}
