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
<button onclick='test(event)'>�ĺ���~</button>
</form>

<script>
/* $("#test").on('click', function(event) {
	  event.preventDefault();
		document.getElementsByName('t1').value='dfd';//�̰� �ȵ�
		this.action='formTest';
		this.method='post';
		this.t1.value='adfasf';//�̰��� ������ ���޵�
	  $("#test").submit();
}); */

$("#test").on('click', function(event) {
	test.t1.value='���� �˼��� ����';
	var formData = $("#test").serialize();
	$.ajax({data:formData,
		type : "POST",
			url : "formTest",
			cache : false,
			success : function(data, status){
				//��Ʈ�ѷ����� jsp������ Ŭ���̾�Ʈ���� �����ϴ� ���̹Ƿ� ������ �����Ϳ� �����
				//���� ���� �½��ϴ�.
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