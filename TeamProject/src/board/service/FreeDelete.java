package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.FreeDAO;
import controller.CommandAction;

public class FreeDelete implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int num=Integer.parseInt(request.getParameter("num"));
		int pg=Integer.parseInt(request.getParameter("pg"));
		
		FreeDAO dao=new FreeDAO();
		dao.boardDelete(num);
		
		request.setAttribute("pg", pg);
		return "free_board/FreeDelete.jsp";
	}

}
