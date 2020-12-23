package notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dto.Board;
import notice.dao.NoticeDAO;

@WebServlet(name = "NView", urlPatterns = { "/nView" })
public class NoticeView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println("view num : " + num);
		NoticeDAO dao = new NoticeDAO();
		Board ob = dao.searchNotice(num);

		if (ob != null) {
			dao.noticeHitUpdate(num);
			System.out.println("notice search OK");
			request.setAttribute("ob", ob);
			RequestDispatcher rd = request.getRequestDispatcher("notice_board/NoticeView.jsp");
			rd.forward(request, response);
		}
	}

}
