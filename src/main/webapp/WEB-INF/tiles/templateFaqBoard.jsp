<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>공사중 - 질문과답변</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap-theme.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/resources/js/category/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/category.css"> -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/faq.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">

<!-- 
<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
 -->

<%-- <script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ckeditor/contents.css"> --%>

<%-- 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ckeditor5.css"> 
 --%>



</head>
<body>
	<tiles:insertAttribute name="header" />
	
		<div class="container-fluid" style="padding: 0; margin: 0;">
		<dic class="row">
		<div class="col-xs-12" style="padding: 0; margin: 0;">
			<div id="faqlist-top">
				<section>
					<div class="faqlist-bg"></div>
					<h1>고객문의</h1>
				</section>
			</div>
		</div>
		</dic>
	</div>
	
	
	<tiles:insertAttribute name="body" />
	<tiles:insertAttribute name="footer" />

</body>
</html>