<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style>
.table_list{
text-align: center;
}
.left_list_tr td:first-child{
width:150px;
}
.left_list_tr td:nth-child(2){
width:200px;
}
#top_button{
float:right;
}
.left{
float: left;
border: 5px solid red;
width:350px;
height:100%;
}
#left_top{
height:80px;
}
#left_down{
border: 1px solid blue;
}
.right{
float: left;
border: 1px solid green;
}
#post_select{
position:absolute;
background-color:green;
width:200px;
border-left: 3px solid blue;
   	 	border-bottom: 1px solid blue;
   	 	border-collapse: collapse;
display:none;
}
#country_select{
position:absolute;
background-color:green;
border-left: 3px solid blue;
   	 	border-bottom: 1px solid blue;
   	 	border-collapse: collapse;
left: 20px;
top:20px;

}
.load{
display:none;
}
.modified_date{
display:none;
}
#pointer{
width:100px;
border:5px solid red;
text-align:center;
display:inline-block;
}
.field{
display:inline-block;
border:2px solid black;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
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
    $("#contract_period_s, #contract_period_e").datepicker({
      showButtonPanel: true //현재의 달을 보여줌
    });
  });
</script>
</head>

<body>



<div class='left'>
<br/>
	<div  id='left_top'>
	<label id='pointer'>사업자번호</label>
	<input type='text' name='left_busi_num' id='left_busi_num'><br/>
	<label id='pointer'>거래처명</label>
	<input type='text' name='left_custom' id='left_custom'>
	<button id='search_left' onclick='left_search_data()'>조회</button><br/>
	</div>

	<div id='left_down'>
	<table class='table_list' border=1><tr class='left_list_tr'>
	<td>사업자 번호</td><td >거래처명</td></tr></table>
	</div>
</div>

<div class='right'>

<table border=2>
	<tr>
		<td colspan='2'>
		<div id='top_button'>
		<button id='save' onclick='list_go(1)'>저장</button>
		<button id='delete'>삭제</button>
		</div>
		</td>
	</tr>
	<tr>
		<td>
		<label id='pointer'>사업자번호</label>
		<input type='text' class='r' name='right_busi_num' id='busi_num' maxlength='20' rows='20'>
		</td>
		<td>
		<label id='pointer'>약 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 칭</label>
		<input type='text' class='l' name='abbreviation' id='abbreviation' maxlength='20'>
		</td>
	</tr>
	<tr>
		<td colspan='2'>
		<label id='pointer'>거 &nbsp 래 &nbsp 처 &nbsp 명</label>
		<input type='text' class='r' name='right_custom' id='custom' maxlength='20'>
		</td>
	</tr>
	<tr>
		<td>
		<label id='pointer'>대 &nbsp&nbsp 표 &nbsp&nbsp 자</label>
		<input type='text' class='r' name='ceo' id='ceo' maxlength='10'>
		</td>
		<td>
		<label id='pointer'>담 &nbsp 당 &nbsp 자</label>
		<input type='text' class='l' name='charge_person' id='charge_person' maxlength='10'>
		</td>
	</tr>
	<tr>
		<td>
		<label id='pointer'>업 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 태</label>
		<input type='text' class='r' name='busi_condition' id='busi_condition' maxlength='10'>
		</td>
		<td>
		<label id='pointer'>종 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 목</label>
		<input type='text' class='l' name='item' id='item' maxlength='10'>
		</td>
	</tr>
	<tr>
		<td>
		<label id='pointer'>우 &nbsp 편 &nbsp 번 &nbsp 호</label>
		<input type='text' class='r' name='post_num' id='post_num' maxlength='10'>
		<button id='post_search'>검색</button><br/>
		</td>
		<td>
		<label id='pointer'>주 &nbsp&nbsp 소 &nbsp&nbsp 1</label>
		<input type='text' class='l' name='addr1' id='addr1' maxlength='80' style='width:200px;'>
		</td>
	</tr>
	<tr>
		<td colspan='2'>
		<label id='pointer'>주 &nbsp&nbsp 소 &nbsp&nbsp 2</label>
		<input type='text' class='r' name='addr2' id='addr2' maxlength='80'style='width:440px;'><br/>
		</td>
	</tr>
	<tr>
		<td>
		<label id='pointer'>전 &nbsp 화 &nbsp 번 &nbsp 호</label>
		<input type='text' class='r' name='tel' id='tel' maxlength='13'>
		</td>
		<td>
		<label id='pointer'>팩 &nbsp 스 &nbsp 번 &nbsp 호</label>
		<input type='text' class='l' name='fax' id='fax' maxlength='13'><br/>
		</td>
	</tr>
	<tr>
		<td colspan='2'>
		<label id='pointer'>홈 &nbsp 페 &nbsp 이 &nbsp 지</label>
		<input type='text' class='r' name='homepage' id='homepage' maxlength='20'>
		</td>
	</tr>
	<tr>
		<td>
		<label id='pointer'>법 &nbsp 인  &nbsp 여 &nbsp 부</label>
			<div class='field'>
			<input type="radio" name="pub" id='co_yn' value="y">법인
			<input type="radio" name="pub" id='co_yn' value="n">개인
			</div>
		</td>
		<td>
		<label id='pointer'>해 &nbsp 외 &nbsp 여 &nbsp 부</label>
			<div class='field'>
			<input type="radio" name="foreign" id='foreign_yn' value="i">국내
			<input type="radio" name="foreign" id='foreign_yn' value="o">해외
			</div>
		</td>
</tr>
<tr>
	<td>
	<label id='pointer'>과 &nbsp 세 &nbsp 구 &nbsp 분</label>
		<select class='r' name="tax_yn" id='tax_yn'>
    		<option value="">과세/면세</option selected>
    		<option value="y">과세</option>
    		<option value="n">면세</option>
    </select>
    </td>
    <td>
	<label id='pointer'>국 &nbsp 가</label>
		<input type='text' name='country_eng' id='country_eng' maxlength='3' style='width:32px;'>
		<input type='text' name='country_kor' id='country_kor' maxlength='10' rows='6'>
		<button id='country_search'>검색</button><br/>
	</td>
</tr>
<tr>
	<td>
	<label id='pointer'>특수관계자</label>
	<input type='checkbox' class='r' name='special_relation' id='special_relation' value='n'>
	</td>
	<td>
	<label id='pointer'>거래중지</label>
	<input type='checkbox' name='trade_stop' id='trade_stop' value='n'>
	</td>
<tr>
	<td>
	<label id='pointer'>계 &nbsp 약 &nbsp 기 &nbsp 간</label>
	<input type='text' name='contract_period_s' id="contract_period_s" >
	  ~
	</td>
	<td>
	<input type='text' name='contract_period_e' id="contract_period_e" value='${vo.contract_period_e}'>
	</td>
</tr>
<tr>
	<td>
	<!-- 데이터베이스 시간 중심 -->
	<label id='pointer'>등 &nbsp 록  &nbsp 정 &nbsp 보</label>
	<input type='text' name='regi_info_man' id='regi_info_man' title='등록한 사람' maxlength='10' style='width:40px;'>
	
	<!-- 저장된 정보를 불러올 경우 나타남 -->
	<input type='text' class='load' name='regi_info_date' id='regi_info_date'  readonly>		
	</td>
	<td>
	<label class='load'>변 &nbsp 경 &nbsp 정 &nbsp 보</label>
	<input type='text' class='load' name='modi_info_man' id='modi_info_man' title='변경한 사람' value='변경이력 없음' maxlength='10'>
	<input type='text' class='modified_date' name='modi_info_date' id='modi_info_date' title='변경된날짜' value='변경이력 없음' readonly>
	</td>
</tr>
</table>

 							<!-- 거래처 계좌정보 -->	
	(거래처 계좌정보)
	<table border=1>
	<tr>
		<td>사무소</td><td>은행</td><td colspan='2'>계좌정보</td>
	</tr>
	<tr>
		<td>
		<input type='text' name='factory' id='factory' title='변경한 사람'  maxlength='20'>
		</td>
		<td>
		<input type='text' name='trade_bank' id='trade_bank' title='변경한 사람'  maxlength='20'>
		</td>
		<td>
		<input type='text' name='account_num' id='account_num' title='변경한 사람' maxlength='20'>
		</td>
		<td>
		<button id='account_save'>저장하기</button><button id='account_delete'>삭제하기</button>
		</td>
	</tr>
	</table>
	<div id='account'>입력된 정보가 아직 없습니다.</div>
	<!-- 목록이 출력된다 -->
	
</div>




	<!-- 우편번호와 주소 -->
<div id='post_select' border=1>	
	<a>주소를 입력하세요</a><br/>
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
<table border=1 id='left_list' class='table_list'>
	<tr>
		<td>사업자 번호</td><td>거래처명</td>
	</tr>
{{#each .}}	
	<tr class='left-data'>
		<td>{{busi_num}}</td><td>{{custom}}</td>
	</tr>
{{/each}}
	</table>
</script>

<script id="post-template" type="text/x-handlebars-template">
<table id='post-table' border=1 class='table_list'>
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
<table id='country-table' border=1 class='table_list'>
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

<script id="account-template" type="text/x-handlebars-template">
<table id='account-table' border=1 class='table_list'>
	<tr>
		<tr><td>사무소</td><td>은행</td><td>계좌번호</td></tr>
	</tr>
{{#each .}}
	<tr class='account-data'>
		<td>{{factory}}</td><td>{{trade_bank}}</td><td>{{account_num}}</td>
	</tr>
{{/each}}
</table>
</script>

<script>



var HTMLData = function(replyArr, target, templateObject, removeObject) {

	var template = Handlebars.compile(templateObject.html());

	var html = template(replyArr);
	$(removeObject).remove();
	target.html(html);

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
	alert("pub"+pub);
	//해외여부 in/out
	var foreign = $("input[type='radio'][name=foreign]:checked").val();
	alert("foreign"+foreign);
	//과세구분 
	var tax = $("#tax_yn option:selected").val();
	alert("tax"+tax);
	// true, false 값 반환한다.
	var trade = $("input:checkbox[id='trade_stop']").is(":checked");
		 alert("trade "+trade);		 	
		 
		 self.location='/c/left-get/?busi_num='+busi_num;
}
function go2(){
	
	// true, false 값 반환한다.
	var url = "http://stackoverflow.com";    
	document.location='/3';
		 
}

//왼쪽의 조회버튼을 눌렀을 때 왼쪽의 하단에 나오는 목록들
function left_search_data(){
	 
	 var left_busi_num = $("#left_busi_num").val();
	 var left_custom = $("#left_custom").val();
	
	 $.ajax({
			type:'post',
			url:'/c/json/left',
			headers: { 
			      "Content-Type": "application/json",
			      "X-HTTP-Method-Override": "POST" },
			dataType:'JSON',
			data: JSON.stringify({busi_num:left_busi_num, custom:left_custom}),
			success:function(data){
				alert("get"+data);
				//템플릿형태로 보여준다
				HTMLData(data, $("#left_down"), $('#template'),'#left_list');	
				
			},
			error:function(data){
				$("#left_down").remove();
				$("#left_down").html('error '+data);
			}
	 }); 

}

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
 
 //왼쪽의 화면에서 나온 목록 일부를 더블클릭하면 오른쪽에 관련된 내용을 보여준다.
$(document).on("dblclick", ".left-data", function() {
	  var Id1 = $(this).children('td:eq(0)').text();
	    var Id2 = $(this).children('td:eq(1)').text();
	    
	    alert(Id1+"=Id1 : Id2="+Id2);

		 $.ajax({
				type:'post',
				url:'/c/json/right',
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "POST" },
				dataType:'JSON',
				async: false,
				data: JSON.stringify({busi_num: Id1, custom:Id2}),
				success:function(o){
					
					//템플릿형태로 보여준다					
					  var list = JSON.stringify(o);
					alert(o);
					var str = "";

					for(var key in o){

					str += key + " : " + o[key] + "\n";
					// date
					if(key == 'contract_period_s' || key == 'contract_period_e')
						$('#'+key).val(o[key].substr(0,10));
					//radio button
					else if( key == 'co_yn' ||  key == 'foreign_yn'){
						$('input:radio[id="'+key+'"]').removeAttr('checked');		//일단 속성삭제						
						 $("input:radio[id="+key+"]:input[value='"+o[key]+"']").prop("checked", true) ;
					}
					//checkbox
					else if( key == 'special_relation' || key == 'trade_stop'){
						if(o[key] == 't'){
						$("input:checkbox[id='"+key+"']").prop("checked", true);
						}
						else{
							$("input:checkbox[id='"+key+"']").prop("checked", false);
						}
						$("input:checkbox[id='"+key+"']").val(o[key]);
					}
					else
						$('#'+key).val(o[key]);		
					}

					alert(str);
					$('.load').show(); //등록정보와 변경정보 숨김항목을 보여줌
					if(o['modified'] == 1)
						$('.modified_date').show();
					else
						$('.modified_date').hide();
					
					account(Id1);
				},
				error:function(data){
					$("#left_down").html('error '+data);
				}
		 }); 
});

function account(busi_number){
	alert(busi_number);
	$('#account-table').empty();
	$('#account-table').text('등록된 정보가 없음');
	 $.ajax({
			type:'get',
			url:'/c/json/right/'+busi_number,
			headers: { 
			      "Content-Type": "application/json",
			      "X-HTTP-Method-Override": "GET" },
			async: false,
			dataType:'JSON',			
			success:function(o){
				
				//템플릿형태로 보여준다			
				var str='';
			  var list = JSON.stringify(o);
			  for(var key in o[0])
					str += key + " : " + o[0][key] + "\n";
			  alert("o "+ o+"str "+str+"첫번째 배열의 첫째 키값:"+o[0]['busi_num']+"첫번째 배열의 둘째 키값:"+o[0]['factory']);
			  
				HTMLData(o, $("#account"), $('#account-template'),"#account-table");
			},
			error:function(data){
				$("#left_down").html('error '+data);
				HTMLData(data, $("#account"), $('#account-template'),"#account-table");
			}
	 }); 
}

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

 $('#post_search').click(function(){
	
	alert('w');
	$('#post_select').show();
	$( "#addr1_search" ).focus();
});

$('#country_search').click(function(){
	
	alert('w');
	$('#country_select').show();
	$('#country_kor_search' ).focus();
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
	winObject = window.open("/c/resources/html/child.html", "addr", settings);
}



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

function list_go(whereWeGo){
	var isUpdate = false; // update 메시지가 나오기 위한 변수 선언
	var data="";
	
	if($("#busi_num").val().length <=0 || $("#custom").val().length <=0){
		alert("사업자번호나 거래처명은 꼭 기입하셔야 합니다");
		return;
	}
			
	
	$.ajax({
		type:'post',
		url:'/c/json/input',
		headers: { 
			  "Content-Type": "application/json",
		      "X-HTTP-Method-Override": "POST" },
		dataType:'text', //데이터를 받는 경우 형태
		asyn: false, //false is sync	
		data: JSON.stringify({
			busi_num: $("#busi_num").val(),
			custom: $("input[name='right_custom']").val()
			}),
			success:function(data){
				alert("get data "+data+$("input[name='right_custom']").val());
				if(data == "true"){
					isUpdate = true;
					if(whereWeGo == 1)
						Update(isUpdate);
					else if(whereWeGo == 2)
						del();
				}
				else{
					isUpdate= false;
					if(whereWeGo == 1)
						list_go2("PUT");
					else if(whereWeGo == 2)
						del();
				}
			},
			error:function(errorThrown ){
				alert("서버에 장애가 있음 "+errorThrown);
				return;
			}
 });
}

function Update(isUpdate){
	 
	alert( isUpdate);
	 if(isUpdate == true){
			var conf = confirm("이미 자료가 저장되어 있습니다. 수정하시겠습니까??");
		 
			if( conf == false)
		 		return;
			else{
				whatType = "PATCH";
			list_go2(whatType);
			}
		 }
}


function list_go2(whatType){
	
	
	var secDate = $("#contract_period_s").val();
	var year = secDate.substr(0,4);
	var month = secDate.substr(5,2)-1; //한달이 추가되므로....
	var day = secDate.substr(8,2);
	var date = new Date(year, month, day);  

	
	 var left_busi_num = $("#busi_num");
	 var left_custom = $("#left_custom");
	 var country_kor = $("#country_kor").val();
	 var addr1 = $("#addr1");
	 var busi_num = left_busi_num.val();
	 var custom = left_custom.val();
	 var modi_infoMan;
	 var modi_infoDate;
	 
	 if($('#modi_info_man').val != '변경이력 없음')
		 modi_infoMan = $('#modi_info_man').val();
	 if($('#modi_info_date').val != '변경이력 없음')
		 modi_infoDate = $('#modi_info_date').val();
	
	 var special_relation = ($("input:checkbox[id='special_relation']").is(":checked")== true)? 't' : 'f';
	 var trade_stop = ($("input:checkbox[id='trade_stop']").is(":checked")==true)? 't' : 'f';
	/*  if(busi_num.length<=0)
		 busi_num =null;
	 if(custom.length<=0)
		 custom =null;*/
		alert("type "+whatType+";"+date+"==="+secDate);
		
		  
	//	 setTimeout(time(), 3000);
		
		
		alert( $("input[name='right_busi_num']").val()+"-"+
			 $("input[name='right_custom']").val()+"-"+
			 $('#abbreviation').val()+"-"+
				 $('#ceo').val()+"-"+
				 $('#charge_person').val()+"-"+
			 $('#busi_condition').val()+"-"+
			 $('#item').val()+"-"+
		 $('#post_num').val()+"-"+
			 $('#addr1').val()+"-"+
		 $('#addr2').val()+"-"+
			 $('#tel').val()+"-"+
		 $('#fax').val()+"-"+
		 $('#homepage').val()+"-"+
				 $("input[type='radio'][name=pub]:checked").val()+"-"+
				 $("input[type='radio'][name=foreign]:checked").val()+"-"+
				$("#tax_yn option:selected").val()+"-"+
				 $('#country_eng').val()+"-"+
				 $('#country_kor').val()+"-"+				
				 special_relation+"-"+
				 trade_stop+"-"+			
				 $("#contract_period_s").val()+"-"+
				 $("#contract_period_e").val()+"-"+
				 $('#regi_info_man').val()+"-"+
				 $('#regi_info_date').val()+"-"+
				 modi_infoMan+"="+
				 modi_infoDate);
	  $.ajax({
			type: whatType,
			url:'/c/json/input',
			headers: { 
				  "Content-Type": "application/json",
			      "X-HTTP-Method-Override": whatType },
			      //서버가 get,post만 지원하는 경우
			      //헤더에만 put,delete,patch를 쓰고 type은 get,post를 
			      //쓰면 된다.		      
			dataType:'text', //데이터를 받는 경우 형태
			asyn: false, //false is sync	
			data: JSON.stringify({
				busi_num:$("input[name='right_busi_num']").val(),
				custom: $("input[name='right_custom']").val(),
				abbreviation: $('#abbreviation').val(),
				ceo: $('#ceo').val(),
				charge_person: $('#charge_person').val(),
				busi_condition: $('#busi_condition').val(),
				item: $('#item').val(),
				post_num: $('#post_num').val(),
				addr1: $('#addr1').val(),
				addr2: $('#addr2').val(),
				tel: $('#tel').val(),
				fax: $('#fax').val(),
				homepage: $('#homepage').val(),
				co_yn: $("input[type='radio'][name=pub]:checked").val(),
				foreign_yn: $("input[type='radio'][name=foreign]:checked").val(),
				tax_yn:$("#tax_yn option:selected").val(),
				country_eng: $('#country_eng').val(),
				country_kor: $('#country_kor').val(),				
				special_relation: special_relation,
				trade_stop: trade_stop,			
				contract_period_s:  $("#contract_period_s").val(),
				contract_period_e:  $("#contract_period_e").val(),
				regi_info_man: $('#regi_info_man').val(),
				modi_info_man: $('#modi_info_man').val(),
				}),
				success:function(data){
					alert("get"+data);
					//템플릿형태로 보여준다
					$("#tester").html('s '+data);
					
					
				},
				error:function(errorThrown ){
					alert("서버 에러--"+errorThrown);
				}
	 });  
}

$('#delete').click(function(){
	if($('#busi_num').val().length <=0){
		alert('삭제할 데이터를 먼저 찾으십시오');
		return;
	}
	list_go(2);
});

function del(){
	$.ajax({
		type:'delete',
		url:'/c/json/right/'+$('#busi_num').val(),
		headers: { 
			  "Content-Type": "application/json",
		      "X-HTTP-Method-Override": "DELETE" },
		dataType:'text', //데이터를 받는 경우 형태
		async: false, //false is sync	
			success:function(data){
				alert("삭제되었습니다.");			
				self.location='/c/';
			},
			error:function(errorThrown ){
				alert("서버에 장애가 있음 "+errorThrown);
				return;
			}
 });
}

$('#account_save').click(function(){
	//계좌번호를 가져와서 삭제할 것인지 판단한다.	  
	  var factory = $(this).parent().parent().children('td:nth-child(1) ').find("input").val();
	  var trade_bank = $(this).parent().parent().children('td:nth-child(2) ').find("input").val();
	  var account_num  = $(this).parent().parent().children('td:nth-child(3) ').find("input").val();
	  var existed = 0; //1 is already , 0 is none
	    alert('factory'+factory+"trade_bank"+trade_bank+"account_num:"+account_num);
	    
	    //일단 자료가 있는지 확인하여 있으면 수정메시지를 보내도록 한다.
		//existed = account_save_del("POST", factory, trade_bank, account_num);
	    account_save_del("POST", factory, trade_bank, account_num);
	    
		
});

function accountIsUpdate(existed){
	 if(existed == 0){
		    var ok = confirm('저장하시겠습니까?');
		    if(ok == true)	    	
		    	//저장은 PUt으로 한다.
		   		account_save_del("PUT", factory, trade_bank, account_num);
		    else
		    	return;	   
		    }
		    else if(existed == 1){
		    	var ok = confirm('수정하시겠습니까?');
			    if(ok == true)	    	
			    	//저장은 PUt으로 한다.
			   		account_save_del("PATCH", factory, trade_bank, account_num);
			    else
			    	return;
		    }
}

$('#account_delete').click(function(){
	//계좌번호를 가져와서 삭제할 것인지 판단한다.
	  	  var account_num  = $(this).parent().parent().children('td:nth-child(3) ').find("input").val();
		 		    	    
	    alert(account_num + "<=account_num : ");
	    var ok = confirm('삭제하시겠습니까?');
	    if(ok == true)
	   		account_save_del("DELETE", null, null, account_num);
	    else
	    	return;	   
});

// 저장할 때 반환값이 1이면 수정, 0이면 저장하는 경우이다.
function  account_save_del(doing, factoryInput, trade_bankInput, account_numInput){
	var chk=0;
	$.ajax({
		type:doing,
		url:'/c/json/account/',
		headers: { 
			  "Content-Type": "application/json",
		      "X-HTTP-Method-Override": doing },
				dataType:'text',
				async: false, //false is sync	
				data: JSON.stringify({busi_num: $("input[name='right_busi_num']").val(),
					//오른쪽 상단에서 사업자번호를 갖다 쓴다.				
					factory: factoryInput,
					trade_bank: trade_bankInput,
					account_num: account_numInput}),
			success:function(data){
				alert(data);
				//만약 저장ㅇ할 때 post조건에서 데이터가 있다면....
				if(data == 'aleady'){
					
					alert(data);
					accountIsUpdate(1);
				}
					else if(data == 'none'){
					
						alert(data);
					accountIsUpdate(0);		
					}
				//저장시 조건 끝
				
				if(doing == 'DELETE')
					alert("삭제되었습니다.");
				else if(doing == 'PUT')
					alert("저장되었습니다.");
				else if(doing == 'PATCH')
					alert("변경되었습니다.");
							
			},
			error:function(errorThrown ){
				alert("서버에 장애가 있음 "+errorThrown);
				return;
			}
 });
	alert("chk"+chk);
	
}
</script>
</body>
</html>
