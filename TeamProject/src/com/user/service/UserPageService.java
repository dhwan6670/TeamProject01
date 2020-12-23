package com.user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.dao.LoginDao;
import com.login.dto.LoginDto;

import controller.CommandAction;

public class UserPageService implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String id = request.getParameter("id");
		
		LoginDao dao = new LoginDao();
		LoginDto dto = dao.getUserPage(id);
		
		if(dto !=null) {
			request.setAttribute("dto", dto);
			return "user/mypage.jsp";
		}
		return null;
	}

}
