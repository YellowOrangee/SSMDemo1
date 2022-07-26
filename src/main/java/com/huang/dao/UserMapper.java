package com.huang.dao;

import com.huang.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {

    int addUser(User user);

    int delUserById(@Param("id") int id);

    int updateUser(User user);

    User queryUserById(@Param("id") int id);

    List<User> queryAllUser();

    User queryUserByName(@Param("name") String name);

    User Login(@Param("name") String name,@Param("password") String password);

}
