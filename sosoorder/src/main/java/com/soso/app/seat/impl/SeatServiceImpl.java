package com.soso.app.seat.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.soso.app.seat.mapper.SeatMapper;
import com.soso.app.seat.service.SeatService;
import com.soso.app.seat.service.SeatVO;

public class SeatServiceImpl implements SeatService{
	
	@Autowired SeatMapper seatMapper;

	@Override
	public List<SeatVO> getSeat(SeatVO seatVO) {
		// TODO Auto-generated method stub
		return seatMapper.getSeat(seatVO);
	}

	@Override
	public List<SeatVO> getSeatList(SeatVO seatVO) {
		// TODO Auto-generated method stub
		return seatMapper.getSeatList(seatVO);
	}

	@Override
	public void seatInsert(SeatVO seatVO) {
		// TODO Auto-generated method stub
		seatMapper.seatInsert(seatVO);
		
	}

	@Override
	public void seatUpdate(SeatVO seatVO) {
		// TODO Auto-generated method stub
		seatMapper.seatUpdate(seatVO);
	}

	@Override
	public void seatDelete(SeatVO seatVO) {
		// TODO Auto-generated method stub
		seatMapper.seatDelete(seatVO);
	}

}
