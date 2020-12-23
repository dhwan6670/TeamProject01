package board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.CommentDAO;
import board.dao.FreeDAO;
import board.dto.Board;
import board.dto.CommentDTO;
import controller.CommandAction;

public class FreeView implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int num=Integer.parseInt(request.getParameter("num"));
		int pg=Integer.parseInt(request.getParameter("pg"));
		
		FreeDAO dao=new FreeDAO();
		dao.updateHit(num);
		Board dto=dao.getBoard(num);
		request.setAttribute("dto", dto);
		request.setAttribute("pg", pg);
		request.setAttribute("num", num);
		
		CommentDAO cd=new CommentDAO();
		List<CommentDTO> list=cd.getCommentList(num);
		
		if(list.size()>0) {
			request.setAttribute("list", list);
		}
		
		return "free_board/FreeView.jsp";
	}

}
