package com.soso.app.work.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.soso.app.work.service.WorkService;

@Controller
public class WorkController {

	@Autowired
	WorkService workService;


}