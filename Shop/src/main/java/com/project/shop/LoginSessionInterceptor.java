package com.project.shop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.project.shop.user.vo.UserVO;


public class LoginSessionInterceptor implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();

		UserVO user = (UserVO)session.getAttribute("user");
		if(user == null) {
			response.sendRedirect(request.getContextPath() + "/");
			return false;
		}else {
			return true;
		}
	}
}
