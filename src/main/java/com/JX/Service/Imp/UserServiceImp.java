package com.JX.Service.Imp;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import cn.hutool.core.lang.UUID;
import cn.hutool.core.util.RandomUtil;

import com.JX.Service.UserService;
import com.JX.dto.*;
import com.JX.entity.User;
import com.JX.mapper.UserMapper;
import com.JX.utils.RedisConstants;
import com.JX.utils.RegexUtils;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import static com.JX.utils.SystemConstants.USER_NICK_NAME_PREFIX;

@Service
@Slf4j
public class UserServiceImp extends ServiceImpl<UserMapper,User> implements UserService {

    @Resource
    private StringRedisTemplate stringRedisTemplate;

    private final String PREDICT_URL = "http://localhost:5000/predict";  // Python后端API的URL

    @Autowired
    private RestTemplate restTemplate;

    @Autowired
    private UserMapper userMapper;

    /**
     * 根据用户名查询用户
     * @param username 前端传入的用户名
     * @return 返回结果函数
     */
    @Override
    public Result findUserByName(String username) {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("nick_name",username);
        User user = getOne(queryWrapper);
        if (user != null){
            return Result.fail("The user already exists");
        }else {
            return Result.ok();
        }

    }

    @Override
    public Result findUserByPhone(String phone) {
        System.out.println("电话号码是:" + phone);
        User user = userMapper.findByPhone(phone);
        System.out.println("搜寻的结果是："+user);
        return Result.ok(user);
    }

    @Override
    public Result updateUserPass(User user) {

        if( userMapper.update(user.getId(),user.getPassword()) == 1){
            return Result.ok("更新成功!");
        }else {
            return  Result.fail("更新失败");
        }

    }

    @Override
    public Result updateUser(UserDTO user) {
        // 检查用户是否存在


        User existingUser = userMapper.selectById(user.getId());
        if (existingUser!= null){

            // 更新用户信息
            existingUser.setNickName(user.getNickName());
            existingUser.setEmail(user.getEmail());
            existingUser.setGender(user.getGender());
            existingUser.setBirthdate(user.getBirthdate());
            existingUser.setAge(user.getAge());
            existingUser.setIcon(user.getIcon());
            existingUser.setPhone(user.getPhone());
            existingUser.setAddress(user.getAddress());
            existingUser.setComment(user.getComment());
            existingUser.setCountry(user.getCountry());
            existingUser.setOccupation(user.getOccupation());
            existingUser.setIdCardNumber(user.getIdCardNumber());
            existingUser.setHospitalId(user.getHospitalId());
            existingUser.setHeight(user.getHeight());
            existingUser.setWeight(user.getWeight());
            existingUser.setBmi(user.getBmi());
            existingUser.setWeightIncreaseAge(user.getWeightIncreaseAge());
            existingUser.setMaritalStatus(user.getMaritalStatus());
            existingUser.setWorkUnit(user.getWorkUnit());
            existingUser.setFamilyContactPhone(user.getFamilyContactPhone());
            existingUser.setEthnicity(user.getEthnicity());

            System.out.println("修改更新后的用户信息如下："+existingUser);
            // 保存更新后的用户信息
            userMapper.updateById(existingUser);
            //保存到redis中
            save2Redis(existingUser);
            return Result.ok();

        }else {
            throw new RuntimeException("User not found"); // 用户不存在，抛出异常
        }

    }



    /**
     * 实现登录功能
     * @param loginForm 登录数据
     * @param session 当前会话
     * @return Result
     */
    @Override
    public Result login(LoginFormDTO loginForm, HttpSession session) {
        String phone = loginForm.getPhone();
        //1.校验手机号
        if(RegexUtils.isPhoneInvalid(phone))
        {
            //不符合,返回错误信息
            return Result.fail("The phone number is in the wrong format");
        }

        //根据手机号查询用户
        User user = query().eq("phone", phone).one();
        LoginJobDTO loginJobDTO = new LoginJobDTO();
        if(user.getOccupation().equals("doctor")){
            loginJobDTO.setJob(1);
        }else{
            loginJobDTO.setJob(0);
        }

        //判断用户是否存在
        if(user == null){
            //不存在，返回错误提示
//            user = createUserWithPhone(phone);
            return Result.fail("If you don't have the user, please register first");
        }
        //存在验证密码
        String password = user.getPassword();
        if(password.equals(loginForm.getPassword())){
            // 写入redis
            String token = save2Redis(user);
            loginJobDTO.setToken(token);
            //返回token
            return Result.ok(loginJobDTO);
        }

       //密码验证失败
        return Result.fail("Wrong password");

    }


    @Override
    public Result predict(PredictRequest request) {
        // 调用Python后端进行预测
        PredictResponse predictResponse = restTemplate.postForObject(PREDICT_URL, request, PredictResponse.class);

        // 将predictResponse放入Result.ok()中返回
        return Result.ok(predictResponse);
    }

    /**
     * 实现注册功能
     * @param registerFormDTO 注册数据
     * @param session 当前会话
     * @return Result
     */
    @Override
    public Result register(RegisterFormDTO registerFormDTO, HttpSession session) {
        String phone = registerFormDTO.getPhone();

        //1.校验手机号
        if(RegexUtils.isPhoneInvalid(phone))
        {
            //不符合,返回错误信息
            return Result.fail("The phone number is in the wrong format");
        }

        //校验密码
        String password = registerFormDTO.getPassword();
        if(RegexUtils.isPasswordInvalid(password))
        {
            //不符合,返回错误信息
            return Result.fail("The password is formatted in the wrong way");
        }
        //判断用户是否存在
        //根据手机号查询用户
        User user = query().eq("phone", phone).one();
        if(user != null){
            //存在，返回错误提示
            return Result.fail("The user already exists, please log in directly");
        }
        //不存在，创建该用户
        user = createUser(registerFormDTO);
        //将用户存入Redis
        String token = save2Redis(user);
        return Result.ok(token);
    }


    private User createUser(RegisterFormDTO registerFormDTO) {
        User user = new User();
        user.setPhone(registerFormDTO.getPhone());
        user.setPassword(registerFormDTO.getPassword());
        user.setEmail(registerFormDTO.getEmail());
        user.setGender(Gender.valueOf(registerFormDTO.getGender()));
        user.setOccupation(Occupation.valueOf(registerFormDTO.getOccupation()));
        user.setBirthdate(registerFormDTO.getBirthdate());
        user.setAge(registerFormDTO.getAge());
        if(registerFormDTO.getNickName() == null || registerFormDTO.getNickName().isBlank()){
            //如果没有传入昵称
            user.setNickName(USER_NICK_NAME_PREFIX+ RandomUtil.randomString(10));
        }
        else {
            user.setNickName(registerFormDTO.getNickName());
        }
        save(user);
        return user;
    }
    private String save2Redis(User user){
        //随机生成token作为登录令牌
        //TODO 用JWT生成token
        String token = UUID.randomUUID().toString(true);

        //将User对象转换为HashMap存储
        String tokenKey =  RedisConstants.LOGIN_USER_KEY+ token;
        UserDTO userDTO = BeanUtil.copyProperties(user, UserDTO.class);
        Map<String, Object> userMap = BeanUtil.beanToMap(userDTO,new HashMap<>(),
                CopyOptions.create()
                        .setIgnoreNullValue(true)
                        .setFieldValueEditor((fieldName,fieldValue)->{
                            if (fieldValue == null) {
                                // 为null的字段提供默认值或者特殊处理
                                return ""; // 举例：返回默认值
                            }
                            return fieldValue.toString();
                        }
                        ));

        //存储
        stringRedisTemplate.opsForHash().putAll(tokenKey,userMap);
        //设置有效期
        stringRedisTemplate.expire(tokenKey,RedisConstants.LOGIN_USER_TTL,TimeUnit.MINUTES);
        return token;

    }
}
