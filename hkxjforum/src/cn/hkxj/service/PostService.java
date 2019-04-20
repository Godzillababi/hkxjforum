package cn.hkxj.service;

import java.util.List;

import cn.hkxj.domain.Post;

/**
 * 帖子业务逻辑层接口
 * @author Allams
 *
 */
public interface PostService 
{
	//发帖方法
	public void sendPost(Post post)throws Exception;
	
	//删帖方法
	public void deletePost(int post_id)throws Exception;
	
	//查找帖子方法
	public Post findPostById(int post_id)throws Exception;
	
	//返回帖子列表方法
	public List<Post> findAllPost()throws Exception;
}
