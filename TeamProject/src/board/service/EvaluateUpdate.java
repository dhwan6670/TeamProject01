package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.EvaluateDAO;
import board.dto.EvaluateDTO;
import controller.CommandAction;

public class EvaluateUpdate implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		int eval_num=Integer.parseInt(request.getParameter("num"));
		
		EvaluateDAO dao=EvaluateDAO.getInstance();
		EvaluateDTO dto=dao.getComment(eval_num);
		
		request.setAttribute("dto", dto);
		
		return "evaluate_board/evaluateUpdate.jsp";
	}

}
