<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>基于MVC的高校毕业设计选题系统</title>
</head>
<body>
<script type="text/javascript">
window.onload =function() { 
	var fType="${fType}";
	alert("上传成功！");
	if(fType=='需求分析'){
		location.href = "${pageContext.request.contextPath }/student/projBooklist.action" ;
	}else if(fType=='开题报告'){
		location.href = "${pageContext.request.contextPath }/student/openReportlist.action" ;
	}
	else if(fType=='中期检查'){
		location.href = "${pageContext.request.contextPath }/student/midChecklist.action" ;
	}else if(fType=='论文'){
		location.href = "${pageContext.request.contextPath }/student/thesislist.action" ;
	}else if(fType=='附件'){
		location.href = "${pageContext.request.contextPath }/student/thesisAttachmentlist.action" ;
	}
};
</script>
</body>
</html>