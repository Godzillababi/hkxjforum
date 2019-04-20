package cn.hkxj.service;

import cn.hkxj.domain.User;

/**
 * 用户业务逻辑层接口
 * @author Allams
 *
 */
public interface UserService 
{
	//登陆方法
	public User login(User form)throws Exception;
	//查询用户名方法
	public String findUsernameById(int user_id)throws Exception;
	//更新用户名
	public void updateUsername(User user)throws Exception;
}
