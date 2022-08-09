package com.ssm.mapper;

import com.ssm.po.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Integer stuid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer stuid);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    

     //根据账号或昵称查找返回user
    /**
     * 根据账号或昵称查找返回user
     * @param words
     * @return
     */
    public List<User> selectByLikeNameAccount(@Param("words")String words);
    
    /**
     * 查找账号个数
     * @param account
     * @return
     */
    public int selectAccountCount(@Param("account")String account);
    
    /**
     * 根据账号查找返回user
     * @param account
     * @return
     */
    public User selectUserByAccount(@Param("account")String account);
}