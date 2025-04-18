package com.JX.controller;

import cn.hutool.core.lang.Console;
import com.JX.Service.UserService;
import com.JX.dto.*;
import com.JX.entity.User;
import com.JX.utils.UserHolder;
import lombok.extern.slf4j.Slf4j;

import org.springframework.web.bind.annotation.*;

import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import java.util.UUID;


/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author Flora_YangFY
 * @since 2024-9-2
 */

@RestController
@RequestMapping("/users")
@CrossOrigin(origins = "*") // 允许所有域名的请求
@Slf4j
public class UserController {

    @Resource
    private UserService userService;

    private String basepath = "D://images";

    /**
     * 实现登录功能
     * @param loginFormDTO 登录的表单数据
     * @param session 当前会话
     * @return Result
     */
    @PostMapping("/login")
    public Result login(@RequestBody LoginFormDTO loginFormDTO, HttpSession session){
        //登录功能
        return userService.login(loginFormDTO,session);

    }

    /**
     * 算法评估
     * @param request 传入的数据
     * @return
     */
    @PostMapping("/predict")
    public Result predict(@RequestBody PredictRequest request) {
        return userService.predict(request);
    }
    /**
     * 用户注册功能
     * @param registerFormDTO 用户注册表信息
     * @param session 当前会话
     * @return 返回结果类
     */
    @PostMapping("/register")
    public Result register(@RequestBody RegisterFormDTO registerFormDTO, HttpSession session){
        return userService.register(registerFormDTO,session);
    }

    /**
     * 用户获取身份信息
     * @return 返回用户信息
     */
    @GetMapping("/me")
    public Result me(){
        // 获取当前登录的用户并返回

        UserDTO user = UserHolder.getUser();
        if(user == null){
            Console.log("用户"+user);
            System.out.println("用户不存在了");
            return Result.fail("用户不存在");
        }
        return Result.ok(user);
//        return Result.fail("功能未完成");
    }


    /**
     * 查询用户名是否存在
     * @param userName 用户名
     * @return 结果类
     */
    @GetMapping("/validateName")
    public Result validateName(@RequestParam("username") String userName){
        return userService.findUserByName(userName);

    }


    /**
     * 头像上传
     * @param request 请求
     * @param file 头像文件
     * @return 返回类
     */
    @PostMapping("/upload")
    public Result upload(HttpServletRequest request, MultipartFile file){
        //file是一个临时文件，需要转存到注定位置，否则本次请求完成后临时文件会删除
        log.info(file.toString());

        //原始文件名
        String originalFilename = file.getOriginalFilename();
        String suffix = originalFilename.substring(originalFilename.lastIndexOf("."));
        //使用UUID重新生成文件名防止文件名称重复造成文件覆盖
        String filename = UUID.randomUUID().toString() + suffix;

        //创建一个目录对象
        File dir = new File(basepath);

        //判断当前目录是否存在
        if(!dir.exists()){
            //目录不存在，需要创建
            dir.mkdirs();
        }
        try {
            //将临时文件转存到指定位置
            file.transferTo(new File(basepath + filename));
            return Result.ok(filename);

        }catch (IOException e) {
            e.printStackTrace();
        }
        return Result.ok(filename);
    }

    /**
     * 更新用户信息

     * @param user 用户信息
     * @return 返回类
     */
    @PutMapping("/update")
    public Result updateUser( @RequestBody UserDTO user) {
        System.out.println("接收到的用户信息如下："+user);
                Long id = UserHolder.getUser().getId();
                user.setId(id);
                userService.updateUser(user);
                return Result.ok("update success");
    }

    /**
     * 修改用户密码
     *
     * @param  loginFormDTO 包含手机号和新密码的信息
     * @return 返回操作结果
     */
    @PutMapping("/updatePassword")
    public Result updatePassword(@RequestBody LoginFormDTO loginFormDTO) {

        User user = (User) userService.findUserByPhone(loginFormDTO.getPhone()).getData();
        // 根据手机号查找用户

        System.out.println("用户信息如下："+userService.findUserByPhone(loginFormDTO.getPhone()).getData());
        if (user == null) {
            return Result.fail("用户不存在");
        }

        // 更新密码
        user.setPassword(loginFormDTO.getPassword());
        userService.updateUserPass(user);

        return Result.ok("密码更新成功");
    }

    /**
     * 获取头像
     * @param name 用户名
     * @param response
     */
    @GetMapping("/download")
    public void download(String name, HttpServletResponse response){

        try {
            //输入流，通过输入流读取文件内容
            FileInputStream fileInputStream = new FileInputStream(new File(basepath + name));
            //输出流，通过输出流将文件写回浏览器，在浏览器展示图片
            ServletOutputStream outputStream = response.getOutputStream();

            response.setContentType("image/jpeg");
            int len = 0;
            byte[] bytes = new byte[1024];
            //读取文件中的内容并将其写入输出流
            while((len = fileInputStream.read(bytes))!=-1){
                outputStream.write(bytes,0,len);
                //将缓冲区中的数据立即刷新/写入到目标设备，以确保数据的完整性
                outputStream.flush();
            }
            //关闭资源
            fileInputStream.close();
            outputStream.close();
            outputStream.flush();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 实现登出
     * @return Result
     */

    @GetMapping("/logout")
    public Result logout(){
        UserHolder.removeUser();
        return Result.ok();
    }

}
