package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.EvaluateDAO;
import board.dto.EvaluateDTO;
import controller.CommandAction;

public class EvaluateRenewal implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		int eval_num=Integer.parseInt(request.getParameter("num"));
		int eval_star=Integer.parseInt(request.getParameter("star"));
		String eval_content=request.getParameter("content");
		
		EvaluateDTO dto=new EvaluateDTO();
		dto.setEval_num(eval_num);
		dto.setEval_star(eval_star);
		dto.setEval_content(eval_content);
		
		EvaluateDAO dao=new EvaluateDAO();
		dao.evalUpdate(dto);
		
		return "evaluate_board/evaluateRenewal.jsp";
	}

}
