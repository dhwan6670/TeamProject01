package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.EvaluateDAO;
import controller.CommandAction;

public class EvaluateDelete implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int eval_num=Integer.parseInt(request.getParameter("num"));
		String eval_game=request.getParameter("game");
		
		EvaluateDAO dao=new EvaluateDAO();
		dao.evalDelete(eval_num);
		
		return "evaluate.do?game="+eval_game;
	}

}
