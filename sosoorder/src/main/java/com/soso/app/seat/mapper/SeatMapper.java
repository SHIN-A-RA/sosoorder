package com.soso.app.seat.mapper;

import java.util.List;

import com.soso.app.seat.service.SeatVO;

public interface SeatMapper {
	public String getSeat(SeatVO seatVO);
	public List<SeatVO> getSeatList(SeatVO seatVO);	
	public void seatInsert(SeatVO seatVO);
	public void seatUpdate(SeatVO seatVO);
	public void seatDelete(SeatVO seatVO);
	
}
