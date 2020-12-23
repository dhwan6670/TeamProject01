package notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dto.Board;
import notice.dao.NoticeDAO;

@WebServlet(name = "NoticeInsert", urlPatterns = { "/noticeInsert" })
public class NoticeInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		Board ob = new Board();
		ob.setBoard_id(request.getParameter("id"));
		ob.setBoard_name(request.getParameter("name"));
		ob.setBoard_title(request.getParameter("notice_title"));
		ob.setBoard_content(request.getParameter("notice_content"));
		ob.setBoard_code("n");
		
		NoticeDAO dao = new NoticeDAO();
		int n = dao.insertNotice(ob);
		
		if(n > 0) {
			System.out.println("notice insert OK");
			response.sendRedirect("/TeamProject/noticeList");
		}
	}

}
