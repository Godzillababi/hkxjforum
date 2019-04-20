package cn.hkxj.domain;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * 论坛用户实体类
 * @author Allams
 *
 */
public class User 
{	
	private int id;//用户id
	@NotNull(message="{user.account.isNull}")
	private int account;//学号
	@Size(min=1,max=10,message="user.password.length.error")
	private String password;//密码
	private String username;//用户名
	private int ifsuper;//是否为管理员
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getAccount() {
		return account;
	}
	public void setAccount(int account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getIfsuper() {
		return ifsuper;
	}
	public void setIfsuper(int ifsuper) {
		this.ifsuper = ifsuper;
	}
	
	
}
