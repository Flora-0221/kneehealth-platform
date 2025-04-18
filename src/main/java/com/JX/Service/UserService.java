package com.JX.Service;


import com.JX.dto.*;
import com.JX.entity.User;

import javax.servlet.http.HttpSession;


/**
 * 服务类
 */
public interface UserService {
    Result login(LoginFormDTO loginForm, HttpSession session);
    Result register(RegisterFormDTO registerFormDTO, HttpSession session);
    Result findUserByName(String username);
    Result updateUser (UserDTO user);
    Result findUserByPhone(String phone);
    Result updateUserPass(User user);
    Result predict(PredictRequest request);


}
