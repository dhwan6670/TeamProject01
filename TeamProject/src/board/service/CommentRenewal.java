package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDAO;
import board.dao.CommentDAO;
import board.dto.CommentDTO;

import controller.CommandAction;

public class CommentRenewal implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		
		int bn=Integer.parseInt(request.getParameter("boardnum"));
		CommentDTO dto=new CommentDTO();
		dto.setComment_num(Integer.parseInt(request.getParameter("num")));
		dto.setComment_content(request.getParameter("content"));
		
		CommentDAO dao=new CommentDAO();
		dao.commentUpdqte(dto);
		
		BoardDAO bd=new BoardDAO();
		String code=bd.getCode(bn);
		
		if(code.equals("F")) {
			return "free_board/commentRenewal.jsp";
		}
		else {
			return "home.jsp";
		}
		
	}

}
