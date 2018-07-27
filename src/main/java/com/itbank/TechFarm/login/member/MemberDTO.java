package com.itbank.TechFarm.login.member;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

public class MemberDTO {
	private int no;
	@NotEmpty
	@Length(min=4, max=15)
	private String id;
	@NotEmpty
	@Pattern(regexp="^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,}$")
	private String passwd;
	@NotEmpty
	private String name;
	@NotEmpty
	private String email1;
	@NotEmpty
	private String email2;
	@Pattern(regexp="^(?=.*[@])(?=.*[.]).{6,}$")
	private String email;
	@NotNull
	@Min(1900)
	@Max(2016)
	private int birthday_year;
	@NotNull
	@Min(1)
	@Max(12)
	private int birthday_month;
	@NotNull
	@Min(1)
	@Max(31)
	private int birthday_day;
	private int sex;
	private String joindate;
	private String rawPassword;
	
	public String getRawPassword() {
		return rawPassword;
	}
	public void setRawPassword(String rawPassword) {
		this.rawPassword = rawPassword;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getBirthday_year() {
		return birthday_year;
	}
	public void setBirthday_year(int birthday_year) {
		this.birthday_year = birthday_year;
	}
	public int getBirthday_month() {
		return birthday_month;
	}
	public void setBirthday_month(int birthday_month) {
		this.birthday_month = birthday_month;
	}
	public int getBirthday_day() {
		return birthday_day;
	}
	public void setBirthday_day(int birthday_day) {
		this.birthday_day = birthday_day;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
}
