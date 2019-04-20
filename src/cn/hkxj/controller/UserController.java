package cn.hkxj.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import cn.hkxj.domain.User;
import cn.hkxj.service.UserService;

/**
 * 用户表现层类
 * @author Allams
 *
 */

@Controller
@RequestMapping("/user")
public class UserController 
{
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/login",method={RequestMethod.POST, RequestMethod.GET})
	public String login(Model model, @Validated User user, BindingResult bindingResult,HttpSession httpSession)
	{
		//获取错误信息
		if(bindingResult.hasErrors())
		{
			List<ObjectError> allErrors = bindingResult.getAllErrors();
			model.addAttribute("allErrors",allErrors);
			return "/login";
		}
		try{
			User session_user =	userService.login(user);
			httpSession.setAttribute("session_user", session_user);
		}
		catch (Exception e) {
			model.addAttribute("error_message", e.getMessage());
			model.addAttribute("user", user);
			return "/login";
		}
		return "redirect:/index.jsp";
	}
	
	//退出方法
	@RequestMapping(value="/quit",method={RequestMethod.POST, RequestMethod.GET})
	public String quit(ModelAndView modelAndView,HttpSession httpSession)
	{
		httpSession.removeAttribute("session_user");
		return "redirect:/index.jsp";
	}
	
	//更新用户名方法
	@RequestMapping(value="/updateUsername",method={RequestMethod.POST, RequestMethod.GET})
	public String updateUsername(String afusername,HttpSession session,Model model)throws Exception
	{
		if(afusername==null||afusername.length()<3||afusername.length()>16)
		{
			model.addAttribute("error_message", "用户名长度为3到16位");
			model.addAttribute("afusername", afusername);
			return "/userdetails";
		}
		User session_user = (User)session.getAttribute("session_user");
		System.out.println(session_user.getUsername());
		session_user.setUsername(afusername);
		userService.updateUsername(session_user);
		session.setAttribute("user", session_user);
		model.addAttribute("success_message","更改用户名成功");
		return "/userdetails";
	}
	
}
