package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.FreeDAO;
import board.dto.Board;

import controller.CommandAction;

public class FreeUpdate implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터 얻어오기
	    request.setCharacterEncoding("UTF-8");

	    int pg = Integer.parseInt(request.getParameter("pg"));
	      
	    Board dto=new Board();
	    
	    dto.setBoard_num(Integer.parseInt(request.getParameter("seq")));
	    dto.setBoard_title(request.getParameter("subject"));
	    dto.setBoard_content(request.getParameter("content"));

	    //DB-update
	    FreeDAO dao=new FreeDAO(); 
	    dao.boardUpdate(dto);
	      
	    request.setAttribute("pg",pg);
		return "free_board/FreeUpdate.jsp";
	}

}
