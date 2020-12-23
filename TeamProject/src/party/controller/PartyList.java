package party.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dto.Board;
import board.dto.PartyPaging;
import party.dao.PartyDAO;

@WebServlet(name = "PartyList", urlPatterns = { "/partyList" })
public class PartyList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// 데이터 가져오기(list)
		int pg = Integer.parseInt(request.getParameter("pg"));
		// select DB
		int pageSize = 10; // 한페이지에 출력할 게시물수
		int endNum = pg * pageSize; // 끝번호
		int startNum = endNum - (pageSize - 1);// 시작번호

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		PartyDAO dao = new PartyDAO();
		List<Board> list = dao.getList(map);;
		
		PartyPaging paging = new PartyPaging(pg, 5, pageSize);
		paging.makePagingHTML();
			if (list != null) {
				request.setAttribute("list", list);
				request.setAttribute("pg", pg);
				request.setAttribute("paging", paging);
				RequestDispatcher rd = request.getRequestDispatcher("party_board/PartyList.jsp");
				rd.forward(request, response);
		}
	}

}
