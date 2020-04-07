package com.auc.mavendemo.controller;

import com.auc.mavendemo.aoplog.Log;
import com.auc.mavendemo.entity.*;
import com.auc.mavendemo.service.LoginService;
import com.auc.mavendemo.util.ResponseUtils;
import com.google.gson.Gson;
import com.sun.deploy.net.HttpResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController
{

	@Resource
	private LoginService loginService;

	@RequestMapping("/login")
	public String Welcome(){
		return "login";
	}

	@RequestMapping("path/{url}")
	public String MatchUrl(@PathVariable("url")String url){
		return url;
	}

	@RequestMapping("/test")
	public ModelAndView test(){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("index");

		return modelAndView;
	}

	@RequestMapping("ajaxLogin")
	@ResponseBody
	@Log(operationType="登录操作",operationName="用户登录")
	public String ajaxString(User user, HttpSession session){
		User user1=loginService.login(user);
		if(user1!=null)
		{
			Map map=new HashMap();
			map.put("rid",user1.getRid());
			map.put("parentid",0);
			List<Rolemenu> list=loginService.selectMenu(map);
			session.setAttribute("user",user1);
			session.setAttribute("menuList",list);
			return "success";
		}else{
			return "error";
		}
	}

	@RequestMapping("/reg")
	public String reg(String account,String password){
		return loginService.reg(account,password);
	}

	@RequestMapping("/file")
	@ResponseBody
	public String uploadFile(@RequestParam("file") MultipartFile file, FileInfo fileInfo, HttpSession session){
		String name=file.getOriginalFilename();
		User user=(User)session.getAttribute("user");
		fileInfo.setAccount(user.getAccount());
		fileInfo.setState("未审核");
		String str1=name.split("\\.")[1];
		fileInfo.setType(str1);

		Date now=new Date();
		fileInfo.setTime(now);

		loginService.upload(fileInfo);

		Map res=new HashMap<String,Object>();
		Gson g=new Gson();
		String str="";
		try
		{
			file.transferTo(new File("E:/test/"+name));
			res.put("code",0);
			res.put("msg","上传成功");
			str=g.toJson(res);
		} catch (IOException e)
		{
			res.put("msg","上传失败");
			res.put("code",2);
			str=g.toJson(res);
			e.printStackTrace();
		}
		return str;
	}

	@RequestMapping("/info")
	@ResponseBody
	public String info(String limit,String page,String key,HttpSession session){
		Map map=new HashMap();
		map.put("name",key);
		map.put("begin",(Integer.parseInt(page)-1)*Integer.parseInt(limit));
		map.put("end",Integer.parseInt(limit));
		List list=loginService.findInfo(map);
		int count=loginService.findCountInfo(key);
		Info info=new Info(0,"",count,list);
		Gson g=new Gson();
		String ss=g.toJson(info);
		session.setAttribute("list",list);
		return ss;
	}

	@RequestMapping("/findFile")
	@ResponseBody
	public String findFile(String limit,String page,String name,HttpSession session){
		Map map=new HashMap();
		map.put("name",name);
		map.put("begin",(Integer.parseInt(page)-1)*Integer.parseInt(limit));
		map.put("end",Integer.parseInt(limit));
		List list=loginService.findFile(map);
		int count=loginService.findCountFile(name);
		Info info=new Info(0,"",count,list);
		Gson g=new Gson();
		String ss=g.toJson(info);
		session.setAttribute("list",list);
		return ss;
	}

	@RequestMapping("/manager")
	@ResponseBody
	public void manager(String rid, HttpServletResponse response){
		Map map=new HashMap();
		map.put("rid",rid);
		map.put("parentid",0);
		List<Demo> allList = loginService.findAllMenu(0);
		for(int i=0;i<allList.size();i++){
			List<Demo> childList = loginService.findAllMenu(allList.get(i).getId());
			allList.get(i).setChildren(childList);
		}
		List<Demo> list=loginService.findMenu(map);
		for(int i=0;i<list.size();i++){
			map.put("parentid",list.get(i).getId());
			List<Demo> childList = loginService.findMenu(map);
			list.get(i).setChildren(childList);
		}
		Map map1=new HashMap();
		map1.put("all",allList);
		map1.put("has",list);
		ResponseUtils.outJson(response,map1);
	}

}
