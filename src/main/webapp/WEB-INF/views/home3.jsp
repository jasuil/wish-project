<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style>
#top_button{
float:right;
}
.left{
float: left;
border: 1px solid red;
width:300px;
height:800px;
}
#left_top{
height:50px;
}
#left_down{
border: 1px solid red;
}
.right{
float: right;
border: 1px solid red;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script  src="/c/resources/jquery/jQuery-2.1.4.min.js"></script>
<title> 거래처 관리 </title>
</head>

<body>
<!-- 한 개의 폼 양식으로 제출한다  -->
<form metod='post' action=''>
<div id='top_button'>
<button id='save' onclick='go()'>저장</button>
<button id='save' >삭제</button>
<button id='sa' onclick='document.location="/3"'>삭제</button>
</div>
<br/>

<div class='left'>
	<div  id='left_top'>
	사업자번호<input type='text' name='busi_num' id='left_busi_num'><br/>
	거래처명<input type='text' name='custom' id='left_custom'>
	<button id='search_left'>조회</button><br/>
	</div>

	<div id='left_down'>
	<table border=1>
	<tr>
	<td>사업자 번호</td><td>거래처명</td>
	</tr>
	<c:forEach items="${customVO_left}" var='vo'>
	<tr>
	<td><a href='read/${vo.busi_num}'>${vo.busi_num}</a></td>
	<td><a href='read/${vo.custom}'>${vo.custom}</a></td>
	</tr>
	</c:forEach>
	</table>
	</div>
</div>

<div clas='right'>

	사업자번호<input type='text' name='busi_num' id='right_busi_num'>
	약칭<input type='text' name='Short' id='Short'><br/>
	거래처명<input type='text' name='custom' id='right_custom'><br/>
	대표자<input type='text' name='ceo' id='ceo'>
	담당자<input type='text' name='custom' id='custom'><br/>
	업태<input type='text' name='busy_condition' id='busy_condition'>
	종목<input type='text' name='item' id='item'><br/>
	우편번호<input type='text' name='post_num' id='post_num'>
	<button id='post_search'>선택</button><br/>
	주소1<input type='text' name='addr1' id='addr1'><br/>
	주소2<input type='text' name='addr2' id='addr2'><br/>
	전화번호<input type='text' name='tel' id='tel'>
	팩스번호<input type='text' name='fax' id='fax'><br/>
	홈페이지<input type='text' name='homepage' id='homepage'><br/>
	법인여부<input type='text' name='co_yn' id='co_yn'>
	해외여부<input type='text' name='foreign_yn' id='foreign_yn'><br/>
	과세구분<input type='text' name='tax_yn' id='tax_yn'>
	국가<input type='text' name='tax_yn' id='tax_yn'><br/>
	특수관계자<input type='checkbox' name='tax_yn' id='tax_yn' value='special_relation'>
	거래중지<input type='checkbox' name='trade_stop' id='trade_stop' value='trade_stop'><br/>
	계약기간<input type='text' name='contract_period_s' id='contract_period_s'>~
	<input type='text' name='contract_period_e' id='contract_period_e'><br/>
	<!-- 데이터베이스 시간 중심 -->
	등록정보<input type='text' name='regi_info_man' id='regi_info_man'>
	<input type='text' name='regi_info_date' id='regi_info_date'>
	변경정보<input type='text' name='modi_info_man' id='modi_info_man'>
	<input type='text' name='modi_info_date' id='modi_info_date'><br/>
	(거래처 계좌정보)
	<!-- 목록이 출력된다 -->

</div>

<P>  The time on the server is ${serverTime}. </P>


</form>

<!-- 템플릿, 정형화된 객체 -->
<script id="template" type="text/x-handlebars-template">
{{#each .}}
{{busi_num}} {{custom}}<br/>
{{/each}}
</script>

<script>
var printData = function(replyArr, target, templateObject) {

	var template = Handlebars.compile(templateObject.html());

	var html = template(replyArr);
	$(".replyLi").remove();
	target.after(html);

}


$("#tax_yn").click(function() {
	$("input[name=box]:checked").each(function() {
		var test = $(this).val();
		console.log(test);
	});
});

function go(){
	
	// true, false 값 반환한다.
	var url = "http://stackoverflow.com";    
self.location=url;
		 alert( $("#trade_stop").is(":checked"));
}
function go2(){
	
	// true, false 값 반환한다.
	var url = "http://stackoverflow.com";    
	document.location='/3';
		 
}

$("#search_left").on("click",function(){
	 
	 var left_busi_num = $("#left_busi_num");
	 var left_custom = $("#left_custom");
	 var busi_num = left_busi_num.val();
	 var custom = left_custom.val();
	 if(busi_num.length<=0)
		 busi_num =null;
	 if(custom.length<=0)
		 custom =null;
	 
	 
/*	 loc();
	 document.location='c/left-get?busi_num='+busi_num+'&custom='+custom;
	 var url = 'c/left-get?busi_num='+busi_num+'&custom='+custom;    
	 $(location).attr('href',url);
	 
	*/ 
	// alert("get--busi_num-"+busi_num+"custom-"+custom);	
	 
	
	
	 $.ajax({
			type:'POST',
			url:'/c/json/left',
			headers: { 
			      "Content-Type": "application/json",
			      "X-HTTP-Method-Override": "POST" },
			dataType:'texy',
			data: JSON.stringify({'busi_num':busi_num, 'custom':custom}),
			success:function(data){
				alert("get"+data);
				//템플릿형태로 보여준다
				printData(data, $("#left_down"), $('#template'));
				$("#left_down").html('data');
				alert('time!!!');
			},
			error:function(data){
				$("#left_down").append('error '+data);
			}
	 });

});

function loc(){
	document.location='/left-get';
	alert('d');
}
</script>
</body>
</html>
