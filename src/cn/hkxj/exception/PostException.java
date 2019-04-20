package cn.hkxj.exception;

/**
 * 帖子自定义异常类
 * @author Allams
 *
 */
public class PostException  extends Exception
{
	public String message;

	public PostException(String message) {
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
