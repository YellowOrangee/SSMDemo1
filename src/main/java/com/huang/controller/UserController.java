package com.huang.controller;


import com.huang.pojo.User;
import com.huang.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    @Qualifier("UserServiceImpl")
    UserService userService;

    @RequestMapping("/allUser")
    public String list(Model model){

        List<User> list= userService.queryAllUser();
//        通过视图解析器将从数据库获取到的数据返回给前端进行渲染
        model.addAttribute("list",list);
        return "allUser";
    }

    @RequestMapping("/toAddUser")
    public String toAddUser(){
        return "addUser";
    }


    //    提交添加请求后,重定向到书籍列表页面
    @RequestMapping("/addUser")
    public String addPaper(User user) {
        System.out.println(user);
        userService.addUser(user);
        return "redirect:/user/allUser";
    }

    @RequestMapping("/toUpdateUser")
    public String toUpdateUser(Model model,int id){
        User user = userService.queryUserById(id);
        System.out.println(user);


//        修改功能
//        通过视图解析器带到前端页面的被修改的对象userA,目的是在输入框中显示修改前对象的信息
        model.addAttribute("userA",user);
        return "updateUser";
    }


    @RequestMapping("/updateUser")
    public String updateUser(User user){
        System.out.println(user);
        userService.updateUser(user);
        return "redirect:/user/allUser";
    }

    //    删除功能
    @RequestMapping("/deleteUSer")
    public String deleteUser(@PathVariable("id") int id ){
        userService.delUserById(id);
        return"redirect:/user/allUser";
    }


    @RequestMapping("/toLogin")
    public String toLogin(){
        return "login";
    }

    @RequestMapping("/login")
    public String Login(HttpServletRequest request, String name, String password){
        System.out.println(name+password);
        User user = userService.Login(name, password);
        System.out.println(user);
//        将登录的对象放入session,方便进行登录验证
        HttpSession session = request.getSession();
        session.setAttribute("user",user);
        User user1 = (User) session.getAttribute("user");
        System.out.println(user1);
        System.err.println(user1);
        System.err.println("edit by hot_fix ");
        System.err.println("edit by master ");



        if (user!=null) {
            return "redirect:/user/allUser";
        }else{
            return "/login";
        }
    }


    //退出登陆
    @RequestMapping("/logout")
    public String logout(HttpSession session) throws Exception {
        // session 过期
        session.invalidate();
        return "login";
    }
}
