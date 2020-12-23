package com.signup.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.login.dao.LoginDao;
import com.login.dto.LoginDto;

import controller.CommandAction;

public class UserIdCheckService implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		String member_id = request.getParameter("id");
		LoginDto dto = new LoginDto();
		dto.setMember_id(request.getParameter("id"));

		LoginDao dao = new LoginDao();
		int n = dao.userIdCheck(member_id);

		if (n > 0) {
			HttpSession Session = request.getSession();
			Session.setAttribute("checkok", n);

		}
		return member_id;

	}
}
