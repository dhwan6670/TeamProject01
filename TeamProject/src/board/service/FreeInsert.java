package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.FreeDAO;
import board.dto.Board;
import controller.CommandAction;

public class FreeInsert implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		
		Board dto=new Board();
		dto.setBoard_id(id);
		dto.setBoard_name(name);
		dto.setBoard_title(subject);
		dto.setBoard_content(content);
		
		FreeDAO dao=new FreeDAO();
		int n=dao.boardInsert(dto);
		request.setAttribute("n", n);
		
		return "free_board/FreeInsert.jsp";
	}

}
