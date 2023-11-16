package kr.co.ezen.entity;

import lombok.Data;

@Data
public class Member {
	
	private String memberID;
	private String memberPwd;
	private String memberName;
	private String memberPhone;
	private String memberAddr;
	private double latitude;
	private double longtidue;
}
