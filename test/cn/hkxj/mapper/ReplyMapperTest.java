package cn.hkxj.mapper;

import java.util.List;

import junit.framework.TestCase;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.hkxj.domain.Reply;
/**
 * 帖子回复类
 * @author Allams
 *
 */
public class ReplyMapperTest extends TestCase 
{
	private ApplicationContext applicationContext;
	
	@Before
	protected void setUp() throws Exception 
	{
		applicationContext = new ClassPathXmlApplicationContext("classpath:spring/applicationContext_dao.xml");
	}

	@Test
	public void testSendReply()throws Exception
	{
		Reply reply = new Reply();
		reply.setPost_id(6);
		reply.setReply_content("这是一个测试回复呀测试回复");
		reply.setUser_id(4284);
		reply.setAuthor("我是你爹");
		
		ReplyMapper replyMapper = (ReplyMapper)applicationContext.getBean("replyMapper");
		replyMapper.sendReply(reply);
		
	}
	
	@Test
	public void testFindReplyByPid()throws Exception
	{
		ReplyMapper replyMapper = (ReplyMapper)applicationContext.getBean("replyMapper");
		List<Reply> replyList = replyMapper.findReplyByPid(6);
		for(Reply reply:replyList)
		{
			System.out.println(reply.getReply_content());
		}
	}
	
	@Test
	public void testDeleteReply()throws Exception
	{
		ReplyMapper replyMapper = (ReplyMapper)applicationContext.getBean("replyMapper");
		
		replyMapper.deleteReply(6);
	}
}





