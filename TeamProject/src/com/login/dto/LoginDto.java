package com.login.dto;

public class LoginDto {
	private String member_id;
	private String member_password;
	private String member_name;
	private String member_address;
	private String member_phone;
	private String member_email;
	private int member_admin;
	private String member_hint;
	private String member_answer;

	public LoginDto() {
		super();
	}

	public LoginDto(String member_id, String member_password, String member_name, String member_address,
			String member_phone, String member_email, int member_admin, String member_hint, String member_answer) {
		super();
		this.member_id = member_id;
		this.member_password = member_password;
		this.member_name = member_name;
		this.member_address = member_address;
		this.member_phone = member_phone;
		this.member_email = member_email;
		this.member_admin = member_admin;
		this.member_hint = member_hint;
		this.member_answer = member_answer;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_password() {
		return member_password;
	}

	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_address() {
		return member_address;
	}

	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public int getMember_admin() {
		return member_admin;
	}

	public void setMember_admin(int member_admin) {
		this.member_admin = member_admin;
	}

	public String getMember_hint() {
		return member_hint;
	}

	public void setMember_hint(String member_hint) {
		this.member_hint = member_hint;
	}

	public String getMember_answer() {
		return member_answer;
	}

	public void setMember_answer(String member_answer) {
		this.member_answer = member_answer;
	}

}
