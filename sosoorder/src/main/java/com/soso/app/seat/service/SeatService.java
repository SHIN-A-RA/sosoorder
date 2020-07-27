package com.soso.app.seat.service;

import java.util.List;

public interface SeatService {
	public List<SeatVO> getSeat(SeatVO seatVO);
	public List<SeatVO> getSeatList(SeatVO seatVO);	
	public void seatInsert(SeatVO seatVO);
	public void seatUpdate(SeatVO seatVO);
	public void seatDelete(SeatVO seatVO);

}
