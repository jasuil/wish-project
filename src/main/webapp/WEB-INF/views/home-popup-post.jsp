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
#post_select{
position:relative;
background-color:green;
border-left: 3px solid blue;
   	 	border-bottom: 1px solid blue;
   	 	border-collapse: collapse;
left: -50px;
top:-200px;
}
#country_select{
position:relative;
background-color:green;
border-left: 3px solid blue;
   	 	border-bottom: 1px solid blue;
   	 	border-collapse: collapse;
left: 20px;
top:20px;

}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script  src="/c/resources/jquery/jquery.min.js"></script>
	<!-- for datepicker -->
<link rel="stylesheet" href="/c/resources/jquery/jquery-ui.css">   
<script src="/c/resources/jquery/jquery-1.12.4.js"></script>
<script src="/c/resources/jquery/jquery-ui.js"></script>
	<!-- for datepicker -->

<title> 거래처 관리 </title>

<script>
$.datepicker.setDefaults({
    dateFormat: 'yy-mm-dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    showMonthAfterYear: true,
    yearSuffix: '년'
  });

  $(function() {
    $("#datepicker1, #datepicker2").datepicker();
  });
</script>
</head>

<body>
<!-- 한 개의 폼 양식으로 제출한다  -->

${vo}
${vo.trade_stop}  

${accountVO}



<div id='top_button'>
<button id='save' onclick='list_go()'>저장</button>
<button id='save'>삭제</button>
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
	<table border=1 id='left_list'>
	<tr>
	<td>사업자 번호</td><td>거래처명</td>
	</tr>
	<c:forEach items="${customVO_left}" var='vo' varStatus="status">
	<tr>
	<td class='left_list1' id='left${status.count}' value='${vo.busi_num}'>${vo.busi_num}</a></td>
	<td class='left_list2' >${vo.custom}</td>
	</tr>
	</c:forEach>
	</table>
	</div>
</div>

<div clas='right'>

	사업자번호<input type='text' name='busi_num' id='right_busi_num' value='${vo.busi_num}'>
	약칭<input type='text' name='Short' id='Short' value='${vo.Short}'><br/>
	거래처명<input type='text' name='custom' id='right_custom' value='${vo.custom}'><br/>
	대표자<input type='text' name='ceo' id='ceo' value='${vo.ceo}'>
	담당자<input type='text' name='charge_person' id='charge_person' value='${vo.charge_person}'><br/>
	업태<input type='text' name='busi_condition' id='busi_condition' value='${vo.busi_condition}'>
	종목<input type='text' name='item' id='item' value='${vo.item}'><br/>
	우편번호<input type='text' name='post_num' id='post_num' value='${vo.post_num}'>
	<button id='post_search' onclick='try_addr()'>선택</button><br/>
	주소1<input type='text' name='addr1' id='addr1' value='${vo.addr1}'><br/>
	주소2<input type='text' name='addr2' id='addr2' value='${vo.addr2}'><br/>
	전화번호<input type='text' name='tel' id='tel' value='${vo.tel}'>
	팩스번호<input type='text' name='fax' id='fax' value='${vo.fax}'><br/>
	홈페이지<input type='text' name='homepage' id='homepage' value='${vo.homepage}'><br/>
	
	법인여부
	<input type="radio" name="pub" value="y">법인
	<input type="radio" name="pub" value="n">개인
	
	해외여부
	<input type="radio" name="foreign" value="in">국내
	<input type="radio" name="foreign" value="out">해외
	<br/>
	
	과세구분
	<select name="tax_yn" id='tax_yn'>
    <option value="">과세/면세</option selected>
    <option value="y">과세</option>
    <option value="n">면세</option>
    </select>
    
	국가<input type='text' name='country_eng' id='country_eng' value='${vo.country_eng}'>
	<input type='text' name='country_kor' id='country_kor' value='${vo.country_kor}'>
	<button id='country_search'>선택</button><br/>
	
	특수관계자
	<c:if test='${vo == null }'>
		<input type='checkbox' name='special_relation' id='special_relation' value='n'>
	</c:if>
	<c:if test='${vo != null }'>
		<input type='checkbox' name='special_relation' id='special_relation' value='${vo.special_relation}'>
	</c:if>
	
	거래중지
	<c:if test='${vo == null }'>
		<input type='checkbox' name='trade_stop' id='trade_stop' value='n'>
	</c:if>
	<c:if test='${vo != null }'>
		<input type='checkbox' name='trade_stop' id='trade_stop' value='${vo.trade_stop}'>
	</c:if>
	<br/>
	
	계약기간<input type='text' name='contract_period_s' id="datepicker1" >
	  ~
	<input type='text' name='contract_period_e' id="datepicker2" value='${vo.contract_period_e}'>
	<br/>
	
	<!-- 데이터베이스 시간 중심 -->
	등록정보<input type='text' name='regi_info_man' id='regi_info_man'>
	
	<c:if test='${vo.regi_info_date ==null}'>
		<input type='text' name='regi_info_date' id='regi_info_date' value='등록먼저하세요' readonly>
	</c:if>
	<c:if test='${vo.regi_info_date !=null }'>
		<input type='text' name='regi_info_date' id='regi_info_date'  readonly>
	</c:if>		
	
	<c:if test='${vo.modi_info_date !=null }'>
	변경정보<input type='text' name='modi_info_man' id='modi_info_man'>
		 <input type='text' name='modi_info_date' id='modi_info_date'>
	</c:if>
	<br/>
	

 							<!-- 거래처 계좌정보 -->	
	(거래처 계좌정보)
	<!-- 목록이 출력된다 -->
	<table border=1>
		<tr><td>사무소</td><td>은행</td><td>계좌번호</td></tr>
		<c:forEach items="${accountVO}" var='avo'>
			<tr><td>${avo.factory}</td><td>${avo.trade_bank}</td><td>${avo.account_num}</td></tr>
		</c:forEach>
	${accountVO}
	</table>
</div>

<P>  The time on the server is ${serverTime}. </P>


	<!-- 우편번호와 주소 -->
<c:if test='${searches != "addr"}'>
<div id='post_select' border=1 style='display:none;'>
</c:if>
<c:if test="${searches == 'addr'}">
<div id='post_select' border=1>	
</c:if>

	주소를 입력하세요<br/>
	<input type='text' id='addr1_search'>
	<button id='addr1_button' onclick='try_addr()'>찾기</button>
	<button class='close' >닫기</button>	
		<div id="post_list">
		
		</div>	
</div>

	<!-- 국가 한글과 영어 -->
<c:if test="${searches == 'country'}">
<div id='country_select' border=1>	
</c:if>
<c:if test='${searches != "country"}'>
<div id='country_select' border=1 style='display:none;'>
</c:if>


	국가명을 한글로  입력하세요<br/>
	<input type='text' id='country_kor_search'>
<button id='addr1_button' onclick='try_country()'>찾기</button>
<button class='close' >닫기</button>
 	<div id="country_list">
		
	</div>

</div>





<!-- 템플릿, 정형화된 객체 -->
<script id="template" type="text/x-handlebars-template">
{{#each .}}
{{busi_num}} {{custom}}<br/>
{{/each}}
</script>

<script id="post-template" type="text/x-handlebars-template">
<table id='post-table' border=1>
	<tr>
		<td>우편번호</td><td>주소</td>
	</tr>
{{#each .}}
	<tr class='post-data'>
		<td>{{post_num}}</td><td>{{addr1}}</td>
	</tr>
{{/each}}
</table>
</script>

<script id="country-template" type="text/x-handlebars-template">
<table id='country-table' border=1>
	<tr>
		<td>영어</td><td>한글</td>
	</tr>
{{#each .}}
	<tr class='country-data'>
		<td>{{country_eng}}</td><td>{{country_kor}}</td>
	</tr>
{{/each}}
</table>
</script>

<script>

var printData = function(replyArr, target, templateObject) {

	var template = Handlebars.compile(templateObject.html());

	var html = template(replyArr);
	$(".replyLi").remove();
	target.after(html);

}

var HTMLData = function(replyArr, target, templateObject, removeObject) {

	var template = Handlebars.compile(templateObject.html());

	var html = template(replyArr);
	$(removeObject).remove();
	target.after(html);

}



$("#tax_yn").click(function() {
	$("input[name=box]:checked").each(function() {
		var test = $(this).val();
		console.log(test);
	});
});


//저장하기
function go(){
	var busi_num = $('#busi_num').val;
	var custom = $('#custom').val;
	var Short = $('#Short').val;
	var ceo = $('#ceo').val;
	var charge_person = $('#charge_person').val;
	var busi_condition = $('#busi_condition').val;
	var item = $('#item').val;
	var post_num = $('#post_num').val;
	var addr1 = $('#addr1').val;
	var addr2 = $('#addr2').val;
	var tel = $('').val;
	
	
	//법인여부 y/n
	var pub = $("input[type='radio'][name=pub]:checked").val();
	alert(pub);
	//해외여부 in/out
	var foreign = $("input[type='radio'][name=foreign]:checked").val();
	alert(foreign);
	//과세구분 
	var tax = $("#tax_yn option:selected").val();
	alert("tax"+tax);
	// true, false 값 반환한다.
	var trade = $('input:checkbox[id="trade_stop"]').val();
		 alert("trade "+trade);		 	
		 
		 self.location='/c/left-get/?busi_num='+busi_num;
}
function go2(){
	
	// true, false 값 반환한다.
	var url = "http://stackoverflow.com";    
	document.location='/3';
		 
}

//왼쪽의 조회버튼을 눌렀을 때 왼쪽의 하단에 나오는 목록들
$("#search_left").on("click",function(){
	 
	 var left_busi_num = $("#left_busi_num");
	 var left_custom = $("#left_custom");
	 var busi_num = left_busi_num.val();
	 var custom = left_custom.val();
	 if(busi_num.length<=0)
		 busi_num =null;
	 if(custom.length<=0)
		 custom =null;
	
	 
	alert('/c/left-get?busi_num='+busi_num+'&custom='+custom); 
//	list_go();
	 var url = 'c/left-get?busi_num='+busi_num+'&custom='+custom;    
	// $(location).attr('href',url);
	 
	
	// alert("get--busi_num-"+busi_num+"custom-"+custom);	
	 
	
	
	 $.ajax({
			type:'post',
			url:'/c/json/left',
			headers: { 
			      "Content-Type": "application/json",
			      "X-HTTP-Method-Override": "POST" },
			dataType:'JSON',
			data: JSON.stringify({busi_num:busi_num, custom:custom}),
			success:function(data){
				alert("get"+data);
				//템플릿형태로 보여준다
				printData(data, $("#left_down"), $('#template'));
		//		$("#left_down").html(data);
	
				alert('time!!!');
			},
			error:function(data){
				$("#left_down").html('error '+data);
			}
	 }); 

});

function loc(){
	document.location='/left-get';
	alert('d');
}

//더블클릭하면 정보를 얻어오는 곳
$('#left_list td').dblclick(function() {
    var Id = $(this).text();
   // var busi_num = left_busi_num.val();
    alert(Id);
    
    document.location='/c/left-get?busi_num='+Id+'&custom='+Id;
 });
 
 

//국가명 입력 새 창이 뜰 때
$(document).on("dblclick", ".country-data", function() {
    var Id1 = $(this).children('td:eq(0)').text();
    var Id2 = $(this).children('td:eq(1)').text();
    //var Id2 = $(this+'td:eq(2)').text();
   // var busi_num = left_busi_num.val();
    alert(Id1+":");
    
    $('#country_eng').val(Id1);
    $('#country_kor').val(Id2);
 	$('#country_select').hide();
 });
 
 $('.close').click(function(){
	 $(this).parent().hide();
 });

function post_search(){
	
	alert('w');
	try_addr();
}

$('#country_search').click(function(){
	
	alert('w');
	$('#country_select').show();
});

//우편번호 새 창이 뜰 때
$(document).on("dblclick", ".post-data", function() {
	  var Id1 = $(this).children('td:eq(0)').text();
	    var Id2 = $(this).children('td:eq(1)').text();
	    //var Id2 = $(this+'td:eq(2)').text();
	   // var busi_num = left_busi_num.val();
	    alert(Id1+"=Id1 : Id2="+Id2);
	    
	  $('#post_num').val(Id1);
	  $('#addr1').val(Id2);
	  $('#post_select').hide();
});

var winObject = null;
function try_addr(){
	var settings ='toolbar=0,directories=0,status=no,menubar=0,scrollbars=auto,resizable=no,height=200,width=200,left=0,top=0';
	winObject = window.open("/c/resources/html/post.html", "addr", settings);
}


/*
function try_addr(){
	var addr1=$('#addr1_search').val();
	alert("try_addr"+addr1);
	//document.location='/c/left-get?addr1='+addr1+"&searches=addr";
	
	 $.ajax({
			type:'post',
			url:'/c/json/post',
			headers: { 
			      "Content-Type": "application/json",
			      "X-HTTP-Method-Override": "POST" },
			dataType:'JSON',
			data: JSON.stringify({addr1: addr1}),
			success:function(data){
				alert("get"+data);
				//템플릿형태로 보여준다
				HTMLData(data, $("#post_list"), $('#post-template'),"#post-table");
				
				
			},
			error:function(data){
				$("#left_down").html('error '+data);
			}
	 }); 
}
*/
function try_country(){
	var country=$('#country_kor_search').val();
	alert("try_addr"+country);
	//document.location='/c/left-get?addr1='+addr1+"&searches=addr";
	
	 $.ajax({
			type:'post',
			url:'/c/json/country',
			headers: { 
			      "Content-Type": "application/json",
			      "X-HTTP-Method-Override": "POST" },
			dataType:'JSON',
			data: JSON.stringify({country_kor: country}),
			success:function(data){
				alert("get"+data);
				//템플릿형태로 보여준다
				HTMLData(data, $("#country_list"), $('#country-template'),"#country-table");
				
				
			},
			error:function(data){
				$("#left_down").html('error '+data);
			}
	 }); 
}

/* 삭제가 필요함
function try_cont(){
	var addr1=$('#country_kor_search').val();
	alert("try_cont"+addr1);
	document.location='/c/left-get?country_kor='+addr1+"&searches=country";
}
*/
function list_go(){

	var secDate = $("#datepicker1").val();
	var year = secDate.substr(0,4);
	var month = secDate.substr(5,2)-1; //한달이 추가되므로....
	var day = secDate.substr(8,2);
	var date = new Date(year, month, day);  
	alert(date+"==="+secDate);
	
	 var left_busi_num = $("#left_busi_num");
	 var left_custom = $("#left_custom");
	 var country = $("#country");
	 var addr1 = $("#addr1");
	 var busi_num = left_busi_num.val();
	 var custom = left_custom.val();
	  if(busi_num.length<=0)
		 busi_num =null;
	 if(custom.length<=0)
		 custom =null;
	 
	document.location='/c/left-get?busi_num='+busi_num+'&custom='+custom+'&addr1='+addr1+'&country='+country;
}



</script>
</body>
</html>
