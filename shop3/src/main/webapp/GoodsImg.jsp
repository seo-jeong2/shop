<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <form    action="<%=request.getContextPath()%>/admin/addGoodsAction.jsp"
         method="post"
         enctype="multipart/form-data">
      
      <input type="text">
      <input type = "file">
      
      
   </form>
</body>
</html>