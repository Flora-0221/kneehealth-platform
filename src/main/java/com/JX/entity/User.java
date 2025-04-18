package com.JX.entity;

import com.JX.dto.Gender;
import com.JX.dto.Occupation;
import com.JX.dto.marital;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;


@Data
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
@TableName("user")
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 手机号码
     */
    private String phone;

    /**
     * 密码，加密存储
     */
    private String password;

    /**
     * 昵称，默认是随机字符
     */
    private String nickName;

    /**
     * 用户头像
     */
    private String icon = "";

    /**
     * 创建时间
     */
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    private LocalDateTime updateTime;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 性别
     */
    private Gender gender;

    /**
     * 国家
     */
    private String country;

    /**
     * 地址
     */
    private String address;

    /**
     * 职业
     */
    private Occupation occupation;

    /**
     * 生日
     */
    private Date birthdate;

    /**
     * 年龄
     */
    private int age;

    /**
     * 个性签名
     */
    private String comment;

    /**
     * 身份证
     */
    private String idCardNumber;

    /**
     * 民族
     */
    private String ethnicity;

    /**
     * 医院号
     *
     */
    private String hospitalId;

    /**
     * 身高
     */
    private double height;

    /**
     * 体重
     */
    private double weight;

    /**
     * BMI
     */
    private double bmi;

    /**
     * 体重突然增加时候的年龄
     */
    private int weightIncreaseAge;

    /**
     * 婚姻
     */
    private marital maritalStatus;

    /**
     * 工作单位
     */
    private  String workUnit;

    /**
     * 家人联系电话
     */

    private String familyContactPhone;
}
