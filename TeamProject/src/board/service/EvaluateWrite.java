package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.EvaluateDAO;
import board.dto.EvaluateDTO;
import controller.CommandAction;

public class EvaluateWrite implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		String name=request.getParameter("name");
		String game=request.getParameter("game");
		int star=Integer.parseInt(request.getParameter("star"));
		String content=request.getParameter("content");
		
		EvaluateDTO dto=new EvaluateDTO();
		dto.setEval_name(name);
		dto.setEval_game(game);
		dto.setEval_star(star);
		dto.setEval_content(content);
		
		EvaluateDAO dao=new EvaluateDAO();
		int n=dao.evalInsert(dto);
		request.setAttribute("n", n);
		
		return "evaluate.do?game="+game;
	}

}
