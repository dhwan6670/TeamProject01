package pic.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import board.dto.Board;
import pic.dao.PicDAO;

@WebServlet(name = "picImage", urlPatterns = { "/picImage"})
public class PicImage extends HttpServlet{
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	         throws ServletException, IOException { 
	      request.setCharacterEncoding("UTF-8");
	      // asd
	      System.out.println("picImage 진입");
	      int board_num = Integer.parseInt(request.getParameter("board_num"));
	      System.out.println("board_num 삽입 : " + board_num);
	      // select DB
	      PicDAO dao = new PicDAO(); 
	      Board board = dao.selectPic(board_num);
	      System.out.println("board에 쿼리문 실행한 디테일 삽입 : " + board);
	      /*ModelAndView mav = new ModelAndView();
	      mav.setViewName("imageView");
	      mav.addObject("imageFile", board.getBoard_content2());
	      System.out.println("mav에 이미지 삽입 : " + mav);
	      response.setContentType("text/html");
	      PrintWriter out = response.getWriter();
	      out.println("<td><img src="+board.getBoard_content2()+"></td>");
	      out.close();*/
	   }
	
	/*public ModelAndView viewImage(int board_num, HttpServletRequest request, HttpServletResponse response) {
	      System.out.println("mav 진입");
	      board_num = Integer.parseInt(request.getParameter("board_num"));
	      System.out.println("board_num 삽입 : " + board_num);
	      PicDAO dao = new PicDAO();
	      Board board = dao.selectPic(board_num);
	      System.out.println("board에 쿼리문 실행한 디테일 삽입 : " + board);
	      ModelAndView mav = new ModelAndView();
	      mav.setViewName("imageView");
	      mav.addObject("imageFile", board.getBoard_content2());
	      System.out.println("mav에 이미지 삽입 : " + mav);
	      return mav;
	}*/
}
