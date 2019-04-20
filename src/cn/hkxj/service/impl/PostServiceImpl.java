package cn.hkxj.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import cn.hkxj.domain.Post;
import cn.hkxj.mapper.PostMapper;
import cn.hkxj.service.PostService;

/**
 * 帖子业务逻辑实现类
 * @author Allams
 *
 */
public class PostServiceImpl implements PostService
{
	
	@Autowired
	private PostMapper postMapper;
	
	//发帖方法
	@Override
	public void sendPost(Post post) throws Exception 
	{
		postMapper.sendPost(post);
		
	}

	//删帖方法
	@Override
	public void deletePost(int post_id) throws Exception 
	{
		postMapper.deletePost(post_id);
		//带埋回复一起删
		//replyMapper.deleteReplyByPid(psot_id)
				
	}

	//查找帖子方法
	@Override
	public Post findPostById(int post_id) throws Exception {
		Post post = postMapper.findPostByPid(post_id);
		postMapper.updateBrowsetimes(post_id);
		return post;
	}

	//得到帖子列表方法
	@Override
	public List<Post> findAllPost() throws Exception {
		List<Post> postList = postMapper.findAllPost();
		return postList;
	}

}
