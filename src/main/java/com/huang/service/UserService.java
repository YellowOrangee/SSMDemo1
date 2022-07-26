package com.huang.service;

import com.huang.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserService {

    int addUser(User user);

    int delUserById(int id);

    int updateUser(User user);

    User queryUserById( int id);

    List<User> queryAllUser();

    User queryUserByName( String name);

    User Login(String name,String password);
}
