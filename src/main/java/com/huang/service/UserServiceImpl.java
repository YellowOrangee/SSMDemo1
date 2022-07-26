package com.huang.service;

import com.huang.dao.UserMapper;
import com.huang.pojo.User;

import java.util.List;

public class UserServiceImpl implements UserService{

    //调用dao层的操作，设置一个set接口，方便Spring管理
    private UserMapper userMapper;

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public int addUser(User user) {
        return this.userMapper.addUser(user);
    }

    @Override
    public int delUserById(int id) {
        return this.userMapper.delUserById(id);
    }

    @Override
    public int updateUser(User user) {
        return this.userMapper.updateUser(user);
    }

    @Override
    public User queryUserById(int id) {
        return this.userMapper.queryUserById(id);
    }

    @Override
    public List<User> queryAllUser() {
        return this.userMapper.queryAllUser();
    }

    @Override
    public User queryUserByName(String name) {
        return this.userMapper.queryUserByName(name);
    }

    @Override
    public User Login(String name, String password) {
        return this.userMapper.Login(name,password);
    }

}
