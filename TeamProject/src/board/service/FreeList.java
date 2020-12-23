package board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.FreeDAO;
import board.dto.Board;
import board.dto.FreePaging;
import controller.CommandAction;

public class FreeList implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int pg=Integer.parseInt(request.getParameter("pg"));
		
		int pageSize=10;
		int endNum=pg*pageSize;
		int startNum=endNum-(pageSize-1);
		
		Map<String,Integer> map=new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		FreeDAO dao=new FreeDAO();
		List<Board> list=dao.getBoardList(map);
		
		FreePaging paging=new FreePaging(pg, 5, pageSize);
		paging.makePagingHTML();
		
		request.setAttribute("list", list);
		request.setAttribute("pg", pg);
		request.setAttribute("paging", paging);
		
		return "/free_board/FreeList.jsp";
	}

}
