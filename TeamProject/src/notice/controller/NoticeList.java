package notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dto.Board;
import notice.dao.NoticeDAO;

@WebServlet(name = "NoticeList", urlPatterns = { "/noticeList" })
public class NoticeList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeDAO dao = new NoticeDAO();
		List<Board> list = dao.getNoticeList();
		
		int count = dao.getNoticeCount();
		if(list !=null) {
			System.out.println("notice list OK");
			request.setAttribute("count", count);
			request.setAttribute("list", list);
			RequestDispatcher rd = request.getRequestDispatcher("notice_board/NoticeList.jsp");
			rd.forward(request, response);
		}else {
			System.out.println("notice list null");
		}
	}

}
