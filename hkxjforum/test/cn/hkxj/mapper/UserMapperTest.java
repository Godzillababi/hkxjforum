package cn.hkxj.mapper;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.hkxj.domain.User;
import cn.hkxj.mapper.UserMapper;


/**
 * 数据层的单元测试类
 * @author Allams
 *
 */
public class UserMapperTest
{
	private ApplicationContext applicationContext;
	
	@Before
	public void setUp() throws Exception
	{
		//先得到容器
		applicationContext = new ClassPathXmlApplicationContext("classpath:spring/applicationContext_dao.xml");
	}
	
	@Test
	public void testFindStudentByAccount()throws Exception
	{
		UserMapper userMapper = (UserMapper) applicationContext.getBean("userMapper");
		User user = userMapper.findStudentByAccount(2009026489);
		
		System.out.println(user.getPassword());
	}
	
	@Test
	public void testAddUser()throws Exception
	{
		UserMapper userMapper = (UserMapper) applicationContext.getBean("userMapper");
		User user = new User();
		user.setId(88);
		user.setUsername("test");
		userMapper.addUser(user);
		
		System.out.println("新增用户完成！");
	}
	
	@Test
	public void testFindUserById()throws Exception
	{
		UserMapper userMapper = (UserMapper) applicationContext.getBean("userMapper");
		User user = userMapper.findUserById(88);
		
		System.out.println(user.getUsername());
	}
	@Test
	public void testUpdateUsername()throws Exception
	{
		UserMapper userMapper = (UserMapper) applicationContext.getBean("userMapper");
		User user = new User();
		user.setId(4284);
		user.setUsername("some1");
		userMapper.updateUsername(user);
	}
}





