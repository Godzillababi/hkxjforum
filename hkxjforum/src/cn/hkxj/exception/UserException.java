package cn.hkxj.exception;

/**
 * 用户自定义异常类
 * @author Allams
 *
 */
public class UserException extends Exception 
{
	public String message;

	public UserException(String message) {
		super(message);
		this.message = message;
	}
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
