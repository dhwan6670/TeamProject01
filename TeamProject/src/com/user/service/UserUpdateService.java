package com.user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.dao.LoginDao;
import com.login.dto.LoginDto;

import controller.CommandAction;

public class UserUpdateService implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		
		LoginDto dto = new LoginDto();
		dto.setMember_id(request.getParameter("id"));
		dto.setMember_password(request.getParameter("password"));
		dto.setMember_name(request.getParameter("name"));
		dto.setMember_email(request.getParameter("mail"));
		dto.setMember_phone(request.getParameter("phone"));
		dto.setMember_address(request.getParameter("address"));
		dto.setMember_hint(request.getParameter("hint"));
		dto.setMember_answer(request.getParameter("answer"));
		
		LoginDao dao = new LoginDao();
		dao.userUpdate(dto);
		
		LoginDto ob = dao.userSearch(dto);
		
//		HttpSession session = request.getSession();
//		session.setAttribute("updateOk", dto);
		
		//request.setAttribute("id", id);
		if(ob != null) {
			System.out.println("Login Search OK ");
			request.setAttribute("logOK", ob);
			return "user/mypageUpdate.jsp";
		}
		return null;
	}

}