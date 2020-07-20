//XMLHttpRequest: ajax의 비동기 통신 객체 (브라우저에 내장돼있음) 필요
//모듈화

var xmlHttp;

function createXMLHttpRequest(){
	//특징: 브라우저에 영향을 많이 받음 (호환이 되는것도 안되는것도 있음)

	var xmlReq = false;

	if(window.XMLHttpRequest) {

		xmlReq = new XMLHttpRequest();  // Non-Microsoft Browser 
	} else if (window.ActiveXObject) {
		try{

			xmlReq = new ActiveXObject("Msxml2.XMLHTTP"); //Microsoft Browser 5.0 이상이면

		}catch (e) {

			xmlReq = new ActiveXObject("Microsoft.XMLHTTP"); //Microsoft Browser 5.0 이전버전
		}
	}

	return xmlReq;
}