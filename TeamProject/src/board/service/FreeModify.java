package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.FreeDAO;
import board.dto.Board;
import controller.CommandAction;

public class FreeModify implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int num=Integer.parseInt(request.getParameter("num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		FreeDAO dao=new FreeDAO();
		Board dto=dao.getBoard(num);
		
		request.setAttribute("seq", num);
		request.setAttribute("pg", pg);
	    request.setAttribute("dto", dto);
	    
		return "free_board/FreeModify.jsp";
	}

}
