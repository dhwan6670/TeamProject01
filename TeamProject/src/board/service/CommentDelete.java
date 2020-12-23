package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDAO;
import board.dao.CommentDAO;
import controller.CommandAction;

public class CommentDelete implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int comment_num=Integer.parseInt(request.getParameter("comment_num"));
		int comment_boardnum=Integer.parseInt(request.getParameter("comment_boardnum"));
		
		CommentDAO dao=new CommentDAO();
		dao.commentDelete(comment_num);
		request.setAttribute("comment_boardnum", comment_boardnum);
		
		BoardDAO bd=new BoardDAO();
		String code=bd.getCode(comment_boardnum);
		
		if(code.equals("F")) {
			return "free_board/commentDelete.jsp";
		}
		else {
			return "home.jsp";
		}
	}

}
