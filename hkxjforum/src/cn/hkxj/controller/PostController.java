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
import org.springframework.web.servlet.ModelAndView;

import cn.hkxj.domain.Post;
import cn.hkxj.domain.Reply;
import cn.hkxj.domain.User;
import cn.hkxj.service.PostService;
import cn.hkxj.service.ReplyService;
import cn.hkxj.service.UserService;


/**
 * 帖子表现层类
 * @author Allams
 *
 */
@Controller
@RequestMapping("/post")
public class PostController 
{
	@Autowired
	private PostService postService;
	@Autowired
	private UserService userService;
	@Autowired
	private ReplyService replyService;
	
	//发帖
	@RequestMapping("/sendPost")
	public String sendPost(@Validated Post post,BindingResult bindingResult,Model model,HttpSession session)throws Exception
	{
		//获取错误信息
		if(bindingResult.hasErrors())
		{
			List<ObjectError> allErrors = bindingResult.getAllErrors();
			model.addAttribute("allErrors",allErrors);
			return "/post";
		}
		try
		{
			User session_user = (User)session.getAttribute("session_user");
			post.setUser_id(session_user.getId());
			postService.sendPost(post);
		}
		catch(Exception e)
		{
			model.addAttribute("error_message", e.getMessage());
			model.addAttribute("post",post);
			return "/post";
		}
		
		model.addAttribute("success_message", "发帖成功！");
		return "/index";
	}
	
	
	@RequestMapping(value="/postList")
	public String postList(HttpSession session)throws Exception
	{
		List<Post> postList = postService.findAllPost();
		for(Post post:postList)
		{
			System.out.println(post.getTopic());
			
		}
		session.setAttribute("postList", postList);
		return "/index";		
	}
	
	@RequestMapping("/findPostById")
	public ModelAndView findPostById(String post_id,ModelAndView modelAndView)throws Exception
	{
		Post post = postService.findPostById(Integer.parseInt(post_id));
		String username =userService.findUsernameById(post.getUser_id());
		modelAndView.addObject("post",post);
		List<Reply> replyList = replyService.findReplyByPid(Integer.parseInt(post_id));
		modelAndView.addObject("replyList",replyList);
		modelAndView.addObject("username",username);
		modelAndView.setViewName("/postdetails");
		return modelAndView;
	}
}
