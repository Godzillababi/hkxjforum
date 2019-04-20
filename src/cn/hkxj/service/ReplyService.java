package cn.hkxj.service;

import java.util.List;

import cn.hkxj.domain.Reply;

/**
 * 回复服务层
 * @author Allams
 *
 */
public interface ReplyService
{
	//回复帖子
	public void sendReply(Reply reply)throws Exception;
	
	//删帖时把回复也删了
	public void deleteReplyByPid(Integer post_id)throws Exception;
	
	//根据帖子找回复
	public List<Reply> findReplyByPid(Integer post_id)throws Exception;
}
