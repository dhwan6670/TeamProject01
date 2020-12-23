package pic.controller;

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

import org.springframework.web.servlet.ModelAndView;

import board.dto.Board;
import board.dto.PartyPaging;
import board.dto.PicPaging;
import party.dao.PartyDAO;
import pic.dao.PicDAO;

@WebServlet(name = "PicList", urlPatterns = { "/picList" })
public class PicList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("picList 진입");
		// 데이터 가져오기(list)
		int pg = Integer.parseInt(request.getParameter("pg"));
		// select DB
		int pageSize = 10; // 한페이지에 출력할 게시물수
		int endNum = pg * pageSize; // 끝번호
		int startNum = endNum - (pageSize - 1);// 시작번호

		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		PicDAO dao = new PicDAO();
		List<Board> list = dao.getList(map);
		System.out.println("리스트 호출결과" + list);
		PicPaging paging = new PicPaging(pg, 10, pageSize);
		paging.makePagingHTML();
			if (list != null) {
				request.setAttribute("list", list);
				request.setAttribute("pg", pg);
				request.setAttribute("paging", paging);
				System.out.println(request);
				RequestDispatcher rd = request.getRequestDispatcher("pic_board/PicList.jsp");
				rd.forward(request, response);
		}
	}

}
