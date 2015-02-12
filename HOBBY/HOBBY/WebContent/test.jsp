<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Insert title here</title>
<script type="text/javascript">
function fun(y,x)
{
	var element = document.getElementById(x);
	var element_text = document.getElementById(y);
	var string_element = new String(element_text.value);
	if(string_element.length>5)
	{
		
		element.innerHTML="validuser";
		element.style.color="green";
	}
	else
	{
		element.color="red";
		element.innerHTML="NONVALIDuser";
	}

}
function fun1()
{
	var element = document.getElementById('text');
	element.disabled= false;		
}

function dateload()
{
	var element = document.getElementById('tick');
	element.color="green";
	element.innerHTML="&#10004";
	var month = document.getElementById('month');
	var dat = document.getElementById('date');
	var temp_str="";
	for(var i=0;i<month.options.length;i++)
		if(month.options[i].selected)
			temp_str=month.options[i].value;
    var number_of_days=0;
	switch(temp_str)
    {
    case 'JANUARY' 	:
    case 'MARCH'	:
    case 'MAY'		:
    case 'JULY'		: 
    case 'AUGUST'	:
    case 'OCTOBER'	:
    case 'DECEMBER'	:
    	number_of_days= 31 ;
    	break;
    case 'APRIL':
    case 'JUNE':
    case 'SEPTEMBER':
    case 'NOVEMBER':
 		number_of_days= 30 ;
   		 break;
    case 'FEBURARY':
 		number_of_days= 28 ;
    	break;    
    }
	if(dat.options.length>0)
	{
	for(var i=dat.options.length-1;i>=0;i--)
		{dat.removeChild(dat.options[i]);}
	}
	for(var i=1;i<=number_of_days;i++)
		{
		 opt = document.createElement('option');
		 opt.value=i;
		 opt.innerHTML=i;
		 dat.appendChild(opt);
		}
}

</script>
</head>
<body>
<form name ="form1" onsubmit="func();">
    TEXT INPUT<input type="text" id="text" onblur="fun('text','labeltext')"  disabled/>   
    <label id="labeltext"></label>
 	<br>
 	new text input <input type="text" id="newtext" onblur="fun1()" />
 	<br>
 	MONTH
 	<select id="month" onchange="dateload();">
 	<option value="JANUARY">JANUARY</option>
 	<option value="FEBURARY">FEBURARY</option>
 	<option value="MARCH">MARCH</option>
 	<option value="APRIL">APRIL</option>
 	<option value="MAY">MAY</option>
 	<option value="JUNE">JUNE</option>
 	<option value="JULY">JULY</option>
 	<option value="AUGUST">AUGUST</option>
 	<option value="SEPTEMBER">SEPTEMBER</option>
 	<option value="OCTOBER">OCTOBER</option>
 	<option value="NOVEMBER">NOVEMBER</option>
 	<option value="DECEMBER">DECEMBER</option>
 	</select>
 	DATE
 	<select id="date">
 	
 	</select>
 	<label id="datetext"></label>
	
 	<br>	 
	HELLO<input type="submit" value="st" id="submit-button" />
	<br>
 	<label id="tick"></label>	
</form>
</body>
</html>