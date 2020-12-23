package com.login.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.dto.LoginDto;

import controller.CommandAction;

public class LogoutService implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		HttpSession session = request.getSession();
		LoginDto entity = (LoginDto) session.getAttribute("logOK");

		if (entity != null) {
			session.removeAttribute("logOK"); // or session.invalidate();
			return "home.jsp";
		}
		return null;
	}

}
