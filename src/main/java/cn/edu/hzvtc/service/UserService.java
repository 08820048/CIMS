package cn.edu.hzvtc.service;

import cn.edu.hzvtc.dao.UserMapper;
import cn.edu.hzvtc.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {


    @Autowired
    private UserMapper userMapper;


    public User login(String userName, String userPassword){
        User user = userMapper.login(userName,userPassword);
        return user;

    }
}
