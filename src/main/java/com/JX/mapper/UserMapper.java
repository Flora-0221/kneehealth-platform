package com.JX.mapper;


import com.JX.dto.Result;
import com.JX.dto.UserDTO;
import com.JX.entity.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface UserMapper extends BaseMapper<User> {

    @Select("SELECT * FROM user WHERE phone = #{phone}")
    User findByPhone(@Param("phone") String phone);

    @Update("UPDATE user SET password = #{password} WHERE id = #{id}")
    int update(@Param("id") Long id, @Param("password") String password);
}
