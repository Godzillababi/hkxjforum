package cn.hkxj.mapper;

import cn.hkxj.domain.User;

/**
 * 用户数据层接口
 * @author Allams
 *
 */
public interface UserMapper 
{
	public User findStudentByAccount(int account)throws Exception;
	
	public User findUserById(int id)throws Exception;
	
	public void addUser(User user)throws Exception;
	
	public String findUsernameById(int id)throws Exception;
	
	public void updateUsername(User user)throws Exception;
}
