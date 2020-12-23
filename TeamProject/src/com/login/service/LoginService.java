package com.login.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.dao.LoginDao;
import com.login.dto.LoginDto;

import controller.CommandAction;

public class LoginService implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String member_id=request.getParameter("id");
		String member_password=request.getParameter("pwd");
//		System.out.println(member_id+"  "+member_password);
	
		LoginDao dao=new LoginDao();
		LoginDto entity=dao.getLoginUser(member_id, member_password);
		
		if(entity != null) {
			//세션설정
			HttpSession session=request.getSession();
			session.setAttribute("logOK", entity);
			return "home.jsp";
		}else {
			return "login/login.jsp";
		}
	}
}









