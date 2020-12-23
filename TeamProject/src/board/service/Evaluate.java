package board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.EvaluateDAO;
import board.dto.EvaluateDTO;
import controller.CommandAction;

public class Evaluate implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		String game=request.getParameter("game");
		
		EvaluateDAO dao=new EvaluateDAO();
		EvaluateDTO dto=dao.getInfo(game);
		request.setAttribute("dto", dto);
		
		List<EvaluateDTO> list=dao.getEvaluate(game);
		if(list.size()>0) {
			request.setAttribute("list", list);
		}
		
		if(game.equals("lol")) {
			return "evaluate_board/lol.jsp";
		}else if(game.equals("bag")) {
			return "evaluate_board/bag.jsp";
		}else if(game.equals("overwatch")) {
			return "evaluate_board/overwatch.jsp";
		}else if(game.equals("fifa4")) {
			return "evaluate_board/fifa4.jsp";
		}else if(game.equals("maple")) {
			return "evaluate_board/maple.jsp";
		}else if(game.equals("aion")) {
			return "evaluate_board/aion.jsp";
		}else if(game.equals("suddenattack")) {
			return "evaluate_board/suddenattack.jsp";
		}else if(game.equals("eternalreturn")) {
			return "evaluate_board/eternalreturn.jsp";
		}else if(game.equals("lostark")) {
			return "evaluate_board/lostark.jsp";
		}else if(game.equals("starcraft")) {
			return "evaluate_board/starcraft.jsp";
		}else if(game.equals("cyberpunk")) {
			return "evaluate_board/cyberpunk.jsp";
		}else if(game.equals("valhalla")) {
			return "evaluate_board/valhalla.jsp";
		}else if(game.equals("lastofus2")) {
			return "evaluate_board/lastofus2.jsp";
		}else if(game.equals("amongus")) {
			return "evaluate_board/amongus.jsp";
		}else if(game.equals("fallguys")) {
			return "evaluate_board/fallguys.jsp";
		}else if(game.equals("acnh")) {
			return "evaluate_board/acnh.jsp";
		}else if(game.equals("smm2")) {
			return "evaluate_board/smm2.jsp";
		}else if(game.equals("wow")) {
			return "evaluate_board/wow.jsp";
		}else if(game.equals("deathstranding")) {
			return "evaluate_board/deathstranding.jsp";
		}else if(game.equals("gta5")) {
			return "evaluate_board/gta5.jsp";
		}else if(game.equals("diablo2")) {
			return "evaluate_board/diablo2.jsp";
		}else if(game.equals("pokemon")) {
			return "evaluate_board/pokemon.jsp";
		}else if(game.equals("princessmaker2")) {
			return "evaluate_board/princessmaker2.jsp";
		}else if(game.equals("hwansechwihojeon")) {
			return "evaluate_board/hwansechwihojeon.jsp";
		}else if(game.equals("dd")) {
			return "evaluate_board/dd.jsp";
		}else if(game.equals("doom")) {
			return "evaluate_board/doom.jsp";
		}else if(game.equals("rollercoastertycoon")) {
			return "evaluate_board/rollercoastertycoon.jsp";
		}else if(game.equals("farlandtactics2")) {
			return "evaluate_board/farlandtactics2.jsp";
		}else if(game.equals("rayman")) {
			return "evaluate_board/rayman.jsp";
		}else if(game.equals("ttt")) {
			return "evaluate_board/ttt.jsp";
		}else {
			return "home.jsp";
		}
		
		
	}

}
