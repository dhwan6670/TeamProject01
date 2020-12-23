package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDAO;
import board.dao.CommentDAO;
import board.dto.CommentDTO;

import controller.CommandAction;

public class CommentReply implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		int comment_num=Integer.parseInt(request.getParameter("num"));
		int comment_boardnum=Integer.parseInt(request.getParameter("boardnum"));
		
		CommentDAO dao=CommentDAO.getInstance();
		CommentDTO dto=dao.getComment(comment_num);
		
		request.setAttribute("comment", dto);
		
		BoardDAO bd=new BoardDAO();
		String code=bd.getCode(comment_boardnum);
		
		if(code.equals("F")) {
			return "free_board/commentReply.jsp";
		}
		else {
			return "home.jsp";
		}
	}

}
