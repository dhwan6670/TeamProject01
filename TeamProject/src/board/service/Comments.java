package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDAO;
import board.dao.CommentDAO;
import board.dto.CommentDTO;

import controller.CommandAction;

public class Comments implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		int comment_num=Integer.parseInt(request.getParameter("num"));
		int comment_boardnum=Integer.parseInt(request.getParameter("boardnum"));
		String comment_id=request.getParameter("id");
		String comment_content=request.getParameter("content");
		
		CommentDAO dao=CommentDAO.getInstance();
		CommentDTO dto=new CommentDTO();
		dto.setComment_boardnum(comment_boardnum);
		dto.setComment_id(comment_id);
		dto.setComment_content(comment_content);
		dto.setComment_parent(comment_num);
		
		int n=dao.commentInsert(dto);
		request.setAttribute("n", n);
		request.setAttribute("bn", dto.getComment_boardnum());
		
		BoardDAO bd=new BoardDAO();
		String code=bd.getCode(comment_boardnum);
		
		if(code.equals("F")) {
			return "free_board/commentRenewal.jsp";
		}
		else {
			return "home.jsp";
		}
	}

}
