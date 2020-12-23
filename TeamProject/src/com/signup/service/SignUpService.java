package com.signup.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.dao.LoginDao;
import com.login.dto.LoginDto;

import controller.CommandAction;

public class SignUpService implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		String member_id = request.getParameter("id");
		String member_password = request.getParameter("password");
		String member_name = request.getParameter("name");
		String member_email = request.getParameter("mail");
		String member_phone = request.getParameter("phone");
		int member_admin = 1;
		String member_address = request.getParameter("address");
		String member_hint = request.getParameter("hint");
		String member_answer = request.getParameter("answer");
		System.out.println("ss = " + member_id);

		// 데이터 저장
		LoginDto dto = new LoginDto();
		dto.setMember_id(member_id);
		dto.setMember_password(member_password);
		dto.setMember_name(member_name);
		dto.setMember_email(member_email);
		dto.setMember_phone(member_phone);
		dto.setMember_admin(member_admin);
		dto.setMember_address(member_address);
		dto.setMember_hint(member_hint);
		dto.setMember_answer(member_answer);
		System.out.println("mm:" + dto.getMember_id());

		// insert DB
		LoginDao dao = new LoginDao();
		int n = dao.registerUser(dto);
		request.setAttribute("n", n);

		return "login/login.jsp";

	}

}