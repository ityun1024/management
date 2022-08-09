package com.ssm.service;

import com.ssm.po.School;

import java.util.List;

public interface SchoolService {
	
	/**
	 * 读取全部
	 * @return
	 */
	public List<School> getAllSchools();
	
	/**
	 * 读取全部,不含限制的,state=0
	 * @return
	 */
	public List<School> getAllSchoolsNoState();
	
	/**
	 * 读取1个
	 * @return
	 */
	public School getSchoolByID(Integer schoolid);
	
	/**
	 * 更新
	 * @return
	 */
	public int updateSchool(School school);
	
	/**
	 * 添加
	 * @return
	 */
	public int setSchool(School school);
	
}
