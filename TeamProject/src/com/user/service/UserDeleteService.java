package com.user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.dao.LoginDao;
import com.login.dto.LoginDto;

import controller.CommandAction;

public class UserDeleteService implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String id =request.getParameter("id");	
		
		LoginDao dao = new LoginDao();
		int n = dao.userDelete(id);
	
		if(n > 0) {
		HttpSession session = request.getSession();
		session.setAttribute("deleteOk", n);
		}
		return "user/userdeleteend.jsp";
		
	}

}
