package com.user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.dao.LoginDao;
import com.login.dto.LoginDto;

import controller.CommandAction;

public class PwdSearchService implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		LoginDto to= new LoginDto();
		to.setMember_id(request.getParameter("id"));
		to.setMember_name(request.getParameter("name"));
		to.setMember_phone(request.getParameter("phone"));
		
		LoginDao dao = new LoginDao();
		to = dao.pwdSearch(to);
		
		if(to !=null) {
			System.out.println("비밀번호 찾음");
			request.setAttribute("to", to);
		 return "user/pwdsearchend.jsp";
		}else {
			return null;
		}
	}

}
