package cn.hkxj.controller;

import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.hkxj.domain.Reply;
import cn.hkxj.domain.User;
import cn.hkxj.service.ReplyService;

/**
 * 回复表现层类
 * @author Allams
 *
 */
@Controller
@RequestMapping("/reply")
public class ReplyController 
{
	@Autowired
	private ReplyService replyService;
	//回复
	@RequestMapping("/sendReply")
	public String sendReply(String post_id,@Validated Reply reply,BindingResult bindingResult,Model model,HttpSession session)throws Exception
	{
		//获取错误信息
		if(bindingResult.hasErrors())
		{
			List<ObjectError> allErrors = bindingResult.getAllErrors();
			model.addAttribute("allErrors",allErrors);
			return "/postdetails";
		}
		User session_user = (User)session.getAttribute("session_user");
		reply.setUser_id(session_user.getId());
		reply.setAuthor(session_user.getUsername());
		
		reply.setPost_id(Integer.valueOf(post_id));
		replyService.sendReply(reply);
		return "redirect:/post/findPostById?post_id="+post_id;		
	}
}
















