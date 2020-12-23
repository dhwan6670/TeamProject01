package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDAO;
import board.dao.CommentDAO;
import board.dto.CommentDTO;

import controller.CommandAction;

public class Comment implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int comment_boardnum=Integer.parseInt(request.getParameter("comment_boardnum"));
		String comment_id=request.getParameter("comment_id");
		String comment_content=request.getParameter("comment_content");
		
		CommentDTO dto=new CommentDTO();
		dto.setComment_boardnum(comment_boardnum);
		dto.setComment_id(comment_id);
		dto.setComment_content(comment_content);
		request.setAttribute("num", dto.getComment_boardnum());
		
		CommentDAO dao=new CommentDAO();
		int n=dao.commentInsert(dto);
		request.setAttribute("n", n);
		
		BoardDAO bd=new BoardDAO();
		String code=bd.getCode(comment_boardnum);
		
		System.out.println("코드 : "+ code);
		
		if(code.equals("F")) {
			return "free_board/commentInsert.jsp";
		}
		else {
			return "home.jsp";
		}
	}

}
