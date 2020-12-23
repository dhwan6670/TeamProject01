package board.dto;

import java.sql.Date;

public class PicCommDTO {
	private int board_num;
	private int com_num;
	private String pic_comment;
	private Date pic_com_date;
	
	
	
	public int getBoard_num() {
		return board_num;
	}



	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}



	public int getCom_num() {
		return com_num;
	}



	public void setCom_num(int com_num) {
		this.com_num = com_num;
	}



	public String getPic_comment() {
		return pic_comment;
	}



	public void setPic_comment(String pic_comment) {
		this.pic_comment = pic_comment;
	}



	public Date getPic_com_date() {
		return pic_com_date;
	}



	public void setPic_com_date(Date pic_com_date) {
		this.pic_com_date = pic_com_date;
	}



	@Override
	public String toString() {
		return "PicCommDTO [board_num=" + board_num + ", com_num=" + com_num + ", pic_comment=" + pic_comment
				+ ", pic_com_date=" + pic_com_date + "]";
	}
	
	
	
	
}
