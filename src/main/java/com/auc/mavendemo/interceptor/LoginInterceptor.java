package com.auc.mavendemo.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor
{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception{
		//获得请求路径的uri
		String uri = request.getRequestURI();

		//判断路径是登出还是登录验证,是这两者之一的话执行Controller中定义的方法
		if(uri.endsWith("/admin/ajaxLogin")||uri.endsWith("/admin/path/login")||uri.endsWith("/admin/login")){
			return true;
		}

		//其它情况判断session中是否有key,有的话继续用户操作
		if(request.getSession()!=null&&request.getSession().getAttribute("user")!=null){
			return true;
		}

		//最后一种情况就是进入登录页面
		response.sendRedirect(request.getContextPath()+"/admin/login");
		return false;
	}
}
