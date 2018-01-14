<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<button onclick='document.location="/6"'>6</button>
<button onclick='document.location="/34"'>62</button>

<c:forEach items="${vo}" var='vo'>
${vo}
</c:forEach>
${serverTime}