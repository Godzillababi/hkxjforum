package cn.hkxj.domain;

import javax.validation.constraints.Size;

/**
 * 帖子实体类
 * @author Allams
 *
 */
public class Post 
{
	private int post_id;//帖子id
	private int user_id;//作者id
	@Size(min=1,max=30,message="{post.topic.length.error}")
	private String topic;//标题
	@Size(min=1,max=1000,message="{post.content.length.error}")
	private String content;//正文
	private int follow_num;//关注人数
	private int browsetimes;//浏览次数
	
	public int getPost_id() {
		return post_id;
	}
	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getTopic() {
		return topic;
	}
	public void setTopic(String topic) {
		this.topic = topic;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getFollow_num() {
		return follow_num;
	}
	public void setFollow_num(int follow_num) {
		this.follow_num = follow_num;
	}
	public int getBrowsetimes() {
		return browsetimes;
	}
	public void setBrowsetimes(int browsetimes) {
		this.browsetimes = browsetimes;
	}
	
	
	
}
