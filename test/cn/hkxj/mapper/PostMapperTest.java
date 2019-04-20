package cn.hkxj.mapper;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.hkxj.domain.Post;

/**
 * 帖子测试类
 * @author Allams
 *
 */
public class PostMapperTest 
{
	private ApplicationContext applicationContext;
	
	@Before
	public void setUp() throws Exception 
	{
		applicationContext = new ClassPathXmlApplicationContext("classpath:spring/applicationContext_dao.xml");
	}

	@Test
	public void testSendPost()throws Exception
	{
		PostMapper postMapper = (PostMapper)applicationContext.getBean("postMapper");
		
		Post post = new Post();
		post.setUser_id(888);
		post.setTopic("test2");
		post.setContent("测试成功");
		
		postMapper.sendPost(post);
		
		System.out.println("添加成功");
	}
	
	@Test
	public void testDeletePost()throws Exception
	{
		PostMapper postMapper = (PostMapper)applicationContext.getBean("postMapper");
		
		postMapper.deletePost(1);
		
		System.out.println("删除成功");
		
	}
	
	@Test
	public void testFindPostById()throws Exception
	{
		PostMapper postMapper = (PostMapper)applicationContext.getBean("postMapper");
		
		Post post = postMapper.findPostByPid(2);
		
		System.out.println(post.getTopic());
		System.out.println(post.getContent());
		System.out.println("查找成功");
	}
	
	@Test
	public void testFindAllPost()throws Exception
	{
		PostMapper postMapper = (PostMapper)applicationContext.getBean("postMapper");
		
		List<Post> postList = postMapper.findAllPost();
		
		for(Post post:postList)
		{
			System.out.println(post.getTopic()+post.getContent());
		}
	}

}
