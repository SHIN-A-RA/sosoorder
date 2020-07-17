package com.soso.app.storeorder.service;

import java.util.Date;

import lombok.NoArgsConstructor;

@NoArgsConstructor
public class ReorderVO {
	String tomail;
	String title;
	String contents;  
	String reorderNum;
	String memberNum;
	String storeId;
	Date reorderDate;
	String frommail;
	
	public String getTomail() {
		return tomail;
	}
	public void setTomail(String tomail) {
		this.tomail = tomail;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getReorderNum() {
		return reorderNum;
	}
	public void setReorderNum(String reorderNum) {
		this.reorderNum = reorderNum;
	}
	public String getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(String memberNum) {
		this.memberNum = memberNum;
	}
	public String getStoreId() {
		return storeId;
	}
	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}
	public Date getReorderDate() {
		return reorderDate;
	}
	public void setReorderDate(Date reorderDate) {
		this.reorderDate = reorderDate;
	}
	@Override
	public String toString() {
		return "ReorderVO [tomail=" + tomail + ", title=" + title + ", contents=" + contents + ", reorderNum="
				+ reorderNum + ", memberNum=" + memberNum + ", storeId=" + storeId + ", reorderDate=" + reorderDate
				+ "]";
	}
	public String getFrommail() {
		return frommail;
	}
	public void setFrommail(String frommail) {
		this.frommail = frommail;
	}

	
	
	
	
	
	
	
	
}
