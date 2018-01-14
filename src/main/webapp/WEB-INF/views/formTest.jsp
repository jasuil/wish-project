<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script  src="/c/resources/jquery/jquery.min.js"></script>
</head>
<body>

<form id='test' name='test' action='te'>
<input type='text' name='t1'>
<button onclick='test(event)'>쳐봐봐~</button>
</form>

<script>
/* $("#test").on('click', function(event) {
	  event.preventDefault();
		document.getElementsByName('t1').value='dfd';//이건 안됨
		this.action='formTest';
		this.method='post';
		this.t1.value='adfasf';//이것이 서버로 전달됨
	  $("#test").submit();
}); */

$("#test").on('click', function(event) {
	test.t1.value='몰라 알수가 없어';
	var formData = $("#test").serialize();
	$.ajax({data:formData,
		type : "POST",
			url : "formTest",
			cache : false,
			success : function(data, status){
				//컨트롤러에서 jsp파일을 클라이언트에게 전송하는 것이므로 문서가 데이터에 담아져
				//오는 것이 맞습니다.
				alert(data + status);
			},
			error : onError
	});
});
//function onSuccess(json, status){alert($.trim(json));}
function onError(data, status){alert("error");}
</script>
</body>
</html>