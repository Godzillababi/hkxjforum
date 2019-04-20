package cn.hkxj.mapper;

import java.util.List;

import cn.hkxj.domain.Reply;

/**
 * 回复数据层接口
 * @author Allams
 *
 */
public interface ReplyMapper
{
	//根据帖子id查询所有回复方法
	public List<Reply> findReplyByPid(Integer post_id)throws Exception;
	
	//新增回复
	public void sendReply(Reply reply)throws Exception;
	
	//根据帖子id删除回复
	public void deleteReply(Integer post_id)throws Exception;
}
