$(document).ready(function () {


	$('#tab_btn_box>div').click(function(){
		var box = $(this).index()+1;

		$('#tab_btn_box>div').removeClass('tab_on');
		$(this).addClass('tab_on');	

		$('#tab_con_box div.tab_con').css("display","none");
		$('#tab_con_box div.tab_con_box'+box).fadeIn(500);
	});


	//hd_main_wrap
	/*$('#hd_gnb.gnb_pc .gnb_dp1_wrap').hover(function(){
			$('#hd_wrap').addClass('over');
			$('#hd_wrap .hd_bg').slideDown(50);
			$('#hd_gnb.gnb_pc .gnb_dp1_wrap .gnb_dp2_wrap').stop().slideDown(200);
		}, function(){
			
			$('#hd_wrap .hd_bg').slideUp(50);
			$('#hd_gnb.gnb_pc .gnb_dp1_wrap .gnb_dp2_wrap').slideUp(100);
	});
	*/
	$('#hd_main_wrap #hd_gnb.gnb_pc .gnb_dp1_wrap').hover(function(){
		$('#hd_wrap').addClass('over');
		}, function(){
		$('#hd_wrap').removeClass('over');
	});
	

	//
	$('.gnb_mo_menu .gnb_dp1 span').click(function(){
		if($(this).hasClass('on')){
			$(this).removeClass('on');
			$(this).siblings('.gnb_dp2_wrap').slideUp(200);
			$('.gnb_mo_menu .gnb_dp1 span').css({opacity:1});
		}else{
			$(this).addClass('on');
			$('.gnb_mo_menu .gnb_dp1 span').removeClass('on');
			$('.gnb_mo_menu .gnb_dp1 span').not(this).css({opacity:0.7});
			$(this).css({opacity:1});
			$('.gnb_mo_menu .gnb_dp1 .gnb_dp2_wrap').slideUp(200);
			$(this).siblings('.gnb_dp2_wrap').slideDown(200);
		}
	});
	
	//
	$('#gnb_menu').click(function(){
		if($(this).hasClass('on')){
			$(this).removeClass('on');
			$('.gnb_mo_menu .gnb_dp1 .gnb_dp2_wrap').slideUp(200);
			$('#gnb_menu_box').animate({left:'-1100px'});
			
		}else{
			$(this).addClass('on');
			$('#gnb_menu_box').animate({left:'0px'});
		}
	});




});  
