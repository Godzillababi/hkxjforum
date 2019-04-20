package cn.hkxj.exception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

public class SpringExceptionResolver implements HandlerExceptionResolver{

	@Override
	public ModelAndView resolveException(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex) 
	{

		Exception exception = null;
		
		if(ex instanceof UserException)
		{
			exception = (UserException)ex;			
		}
		else if(ex instanceof PostException)
		{
			exception = (PostException)ex;
		}
		else
		{
			exception = new Exception("未知错误");
		}
		//错误信息
		String message = exception.getMessage();
		ModelAndView modelAndView = new ModelAndView();
		//将错误信息传给页面
		modelAndView.addObject("error_message",message);
		//指向错误页面
		modelAndView.setViewName("/error");
		
		return modelAndView;
	}

}
