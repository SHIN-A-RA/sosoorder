$(document).on('click', '.toggleBG', function () {
    var toggleBG = $(this);
    var toggleFG = $(this).find('.toggleFG');
    var left = toggleFG.css('left');
    if(left == '40px') {
        toggleBG.css('background', '#CCCCCC');
        toggleActionStart(toggleFG, 'TO_LEFT');
    }else if(left == '0px') {
        toggleBG.css('background', '#55b1df');
        toggleActionStart(toggleFG, 'TO_RIGHT');
    }
});
 
// 토글 버튼 이동 모션 함수
function toggleActionStart(toggleBtn, LR) {
    // 0.01초 단위로 실행
    var intervalID = setInterval(
        function() {
            // 버튼 이동
            var left = parseInt(toggleBtn.css('left'));
            left += (LR == 'TO_RIGHT') ? 5 : -5;
            if(left >= 0 && left <= 40) {
                left += 'px';
                toggleBtn.css('left', left);
            }
        },
        10);
    setTimeout(function(){
        clearInterval(intervalID);
    },
    201);
}

$("#buttonID").ready(function(){
	document.getElementById("memberLogin2").style.display = "block";   
	document.getElementById("adminLogin2").style.display = "none"; 
});

function getToggleBtnState(buttonID){
    var left_px = parseInt( $('#'+buttonID).css('left') );
    if(left_px > 0){
    	document.getElementById("memberLogin2").style.display = "block";   
    	document.getElementById("adminLogin2").style.display = "none"; 
    }else{
    	document.getElementById("memberLogin2").style.display = "none";   
    	document.getElementById("adminLogin2").style.display = "block"; 
    }
    /* return (left_px > 0)? "admin" : "member"; */
}