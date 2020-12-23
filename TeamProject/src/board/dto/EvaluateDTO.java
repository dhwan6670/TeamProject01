package board.dto;

import java.sql.Date;

public class EvaluateDTO {
	private int eval_num;
	private String eval_name;
	private String eval_game;
	private int eval_star;
	private String eval_content;
	private Date eval_date;
	private double eval_avg;
	
	public EvaluateDTO() {
		super();
	}

	public EvaluateDTO(int eval_num, String eval_name, String eval_game, int eval_star, String eval_content,
			Date eval_date, double eval_avg) {
		super();
		this.eval_num = eval_num;
		this.eval_name = eval_name;
		this.eval_game = eval_game;
		this.eval_star = eval_star;
		this.eval_content = eval_content;
		this.eval_date = eval_date;
		this.eval_avg = eval_avg;
	}

	public int getEval_num() {
		return eval_num;
	}

	public void setEval_num(int eval_num) {
		this.eval_num = eval_num;
	}

	public String getEval_name() {
		return eval_name;
	}

	public void setEval_name(String eval_name) {
		this.eval_name = eval_name;
	}

	public String getEval_game() {
		return eval_game;
	}

	public void setEval_game(String eval_game) {
		this.eval_game = eval_game;
	}

	public int getEval_star() {
		return eval_star;
	}

	public void setEval_star(int eval_star) {
		this.eval_star = eval_star;
	}

	public String getEval_content() {
		return eval_content;
	}

	public void setEval_content(String eval_content) {
		this.eval_content = eval_content;
	}

	public Date getEval_date() {
		return eval_date;
	}

	public void setEval_date(Date eval_date) {
		this.eval_date = eval_date;
	}

	public double getEval_avg() {
		return eval_avg;
	}

	public void setEval_avg(double eval_avg) {
		this.eval_avg = eval_avg;
	}
	
}
