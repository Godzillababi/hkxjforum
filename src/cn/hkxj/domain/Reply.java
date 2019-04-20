package cn.hkxj.domain;

import java.util.Date;

import javax.validation.constraints.Size;

/**
 * 回复实体类
 * @author Allams
 *
 */
public class Reply 
{
	private Integer reply_id;//回复id
	private Integer post_id;//帖子id
	private Integer user_id;//作者id
	private String author;//作者名字
	@Size(min=1,max=1000,message="{reply.content.length.error}")
	private String reply_content;//回复内容
	private Date reply_time;//回复时间
	
	public Integer getReply_id() {
		return reply_id;
	}
	public void setReply_id(Integer reply_id) {
		this.reply_id = reply_id;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public Date getReply_time() {
		return reply_time;
	}
	public void setReply_time(Date reply_time) {
		this.reply_time = reply_time;
	}
	
	public Integer getPost_id() {
		return post_id;
	}
	public void setPost_id(Integer post_id) {
		this.post_id = post_id;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	
	
}
