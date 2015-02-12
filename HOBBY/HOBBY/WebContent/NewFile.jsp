<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type ="text/javascript">
function submitted()
{
	var element =document.getElementById('text-area');
	var element_label=document.getElementById('label');
	var letterNumber = /^[0-9a-zA-Z@#!$%]+$/;  
	 if((element.value.match(letterNumber)))   
	  {  
		   element_label.innerHTML="TRUE";
		   element_label.style.color="GREEN";
	  }  
	else  
	  {   
		   element_label.innerHTML="FALSE";
		   element_label.style.color="RED";
	  }
}
</script>
</head>
<body>
<form >
<input type = "text" id="text-area" onblur="submitted()" />
<label id="label"></label>
<br>
<input type = "text" id="t"  />
<label id="label"></label>
<br>
<input type = "submit" />
</form>
</body>
</html>