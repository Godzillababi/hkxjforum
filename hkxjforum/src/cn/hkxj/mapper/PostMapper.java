package cn.hkxj.mapper;

import java.util.List;

import cn.hkxj.domain.Post;

/**
 * 帖子数据访问层类
 * @author Allams
 *
 */
public interface PostMapper 
{
	//发帖
	public void sendPost(Post post)throws Exception;
	//删帖
	public void deletePost(int post_id)throws Exception;
	//查帖子
	public Post findPostByPid(int post_id)throws Exception;
	//返回帖子列表
	public List<Post> findAllPost()throws Exception;
	//浏览数+1
	public void updateBrowsetimes(int post_id)throws Exception;
}
