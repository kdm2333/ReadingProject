package edu.nuc.service;

import edu.nuc.entity.User;

public interface LoginService {

    //查询用户密码是否正确
    public boolean selectByuserIdAndpassWord(String userId, String passWord);

    //查询userId是否以及存在，true为存在，false为不存在
    public boolean selectUserId(String userId);

    //根据userId查询用户信息
    public User selectUserByuserId(String userId);

    //新用户注册
    public boolean registerUser(User user);
}
