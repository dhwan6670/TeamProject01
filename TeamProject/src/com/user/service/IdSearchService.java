package com.user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.dao.LoginDao;
import com.login.dto.LoginDto;

import controller.CommandAction;

public class IdSearchService implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		LoginDto ob = new LoginDto();
		ob.setMember_name(request.getParameter("name"));
		ob.setMember_phone(request.getParameter("phone"));
		
		LoginDao dao = new LoginDao();
		ob = dao.idSearch(ob);
		
		if(ob != null) {
			System.out.println("아이디 찾아옴");
			request.setAttribute("ob", ob);
			return "user/idsearchend.jsp";
		}else {
			return "user/searchId.jsp";
		}
	}

}
