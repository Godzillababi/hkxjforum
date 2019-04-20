package cn.hkxj.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.PropertiesEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;


import cn.hkxj.domain.User;
import cn.hkxj.exception.UserException;
import cn.hkxj.mapper.UserMapper;
import cn.hkxj.service.UserService;

/**
 * 用户业务逻辑实现类
 * @author Allams
 *
 */
public class UserServiceImpl implements UserService
{

	@Autowired
	private UserMapper userMapper;
	
	
	//登陆方法
	@Override
	public User login(User form) throws Exception
	{
		//先使用student表进行登陆验证
		User student = userMapper.findStudentByAccount(form.getAccount());
		if(student==null)
		{
			throw new UserException("用户学号错误,请重新输入");
		}
		if(!form.getPassword().equals(student.getPassword()))
		{
			throw new UserException("密码错误,请重新输入");
		}
		//利用student表查到的id去forum_user里进行查询，没有就进行创建
		User user = userMapper.findUserById(student.getId());
		//没有该用户，进行创建
		if(user==null)
		{
			user = new User();
			user.setId(student.getId());
			//初始用户名
			user.setUsername("用户"+student.getId());
			userMapper.addUser(user);
		}
		//有这个用户则直接返回user
		return user;
	}


	@Override
	public String findUsernameById(int user_id) throws Exception 
	{
		String username = userMapper.findUsernameById(user_id);
		return username;
	}


	@Override
	public void updateUsername(User user) throws Exception 
	{
		userMapper.updateUsername(user);
	}


}

