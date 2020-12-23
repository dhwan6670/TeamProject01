package notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dto.Board;
import notice.dao.NoticeDAO;

@WebServlet(name = "NoticeUpdate", urlPatterns = { "/noticeUpdate" })
public class NoticeUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		Board ob = new Board();
		ob.setBoard_num(Integer.parseInt(request.getParameter("notice_num")));
		ob.setBoard_id(request.getParameter("notice_id"));
		ob.setBoard_name(request.getParameter("notice_name"));
		ob.setBoard_title(request.getParameter("notice_title"));
		ob.setBoard_content(request.getParameter("notice_content"));
		
		NoticeDAO dao = new NoticeDAO();
		int n = dao.updateNotice(ob);
		
		if(n > 0) {
			System.out.println("notice update OK");
			response.sendRedirect("/TeamProject/nView?num="+ob.getBoard_num());
		}
	}

}
