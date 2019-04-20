package cn.hkxj.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import cn.hkxj.domain.Reply;
import cn.hkxj.mapper.ReplyMapper;
import cn.hkxj.service.ReplyService;

/**
 * 回复服务层表现类
 * @author Allams
 *
 */
public class ReplyServiceImpl implements ReplyService
{

	@Autowired
	private ReplyMapper replyMapper;
	
	//回复方法
	@Override
	public void sendReply(Reply reply)throws Exception {
		replyMapper.sendReply(reply);
		
	}

	//删回复方法
	@Override
	public void deleteReplyByPid(Integer post_id)throws Exception {
		replyMapper.deleteReply(post_id);
		
	}

	//查询帖子所有回复方法
	@Override
	public List<Reply> findReplyByPid(Integer post_id)throws Exception {
		List<Reply> replyList = replyMapper.findReplyByPid(post_id);
		return replyList;
	}

}
