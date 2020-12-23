package notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.dao.NoticeDAO;

@WebServlet("/noticeDelete")
public class NoticeDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("notice_num"));
		
		NoticeDAO dao = new NoticeDAO();
		int n = dao.noticeDelete(num);
		
		if(n > 0) {
			System.out.println("notice delete ok");
			response.sendRedirect("/TeamProject/noticeList");
		}
	}

}
