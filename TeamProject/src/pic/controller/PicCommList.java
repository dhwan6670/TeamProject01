package pic.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dto.Board;
import board.dto.PicCommDTO;
import pic.dao.PicDAO;

@WebServlet(name = "picCommList", urlPatterns = { "/picCommList" })
public class PicCommList {
	private static final long serialVersionUID = 1L; 

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		System.out.println("num : " + board_num);
		
		PicDAO dao = new PicDAO();
		Board board= dao.selectPic(board_num);
		//댓글리스트 호출
		List<PicCommDTO> list = dao.selectPicCom(board_num);
		if(board != null) {
			System.out.println("OK");
			request.setAttribute("board", board);
			request.setAttribute("comment", list);
			request.setAttribute("pg", pg);
			RequestDispatcher rd = request.getRequestDispatcher("pic_board/PicView.jsp");
			rd.forward(request, response);
		}
	}
}
