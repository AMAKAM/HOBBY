<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link REL="stylesheet" href="content.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HOBBIES</title>
<script type ="text/javascript">
function dateload()
{
	var month = document.getElementById('month');
	var dat = document.getElementById('date');
	var temp_str="";
	for(var i=0;i<month.options.length;i++)
		{if(month.options[i].selected)
			temp_str=month.options[i].value;}
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
    	var year = document.getElementById('year').value;
    	if(year%4==0)
    		{   
				number_of_days= 29;		    
	  			if(year%100==0)
    				number_of_days= 28;
    			else if(year%400==0)
    				number_of_days= 29;  	    				
  
    		}
   		else    			
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



function usercheck(id,label_name)
{
	if(labelchange_length(id,label_name))
		{
			return false;
		}
	else if(labelchange_char(id,label_name))
		{
			return false;
		}
	else
		{
		
			var element = document.getElementById(label_name);
			var element_text = document.getElementById(id);
			element.innerHTML="VALID";
			element.style.color="green";		
			return true;
		}
}

function  labelchange_length(id,label_name)
{
	var element = document.getElementById(label_name);
	var element_text = document.getElementById(id);
	var string_element = new String(element_text.value);	
	if(string_element.length<5 )
	{
		element.innerHTML="less than 5 characters";
		element.style.color="red";
		return true;
	}
	else
	{
		return false;
	}
}

function labelchange_char(id,label_name)
{
	var element = document.getElementById(label_name);
	var element_text = document.getElementById(id);
	
	var element_label =document.getElementById(label_name);
	var element_text=document.getElementById(id);
	var letterNumber = /^[0-9a-zA-Z@#!$%]+$/;  
	
	if((element_text.value.match(letterNumber)))   
	  {
			return false;		
	  }  
	else  
	  {   
		   alert('only allowed special characters are @ # ! $ % ');
		   element_label.innerHTML="CHECK SPECIAL CHARACTERS";
		   element_label.style.color="RED";
		   return true;
	  }
}
function form1_validate()
{
	if(usercheck('user_name','username_label_login'))
		{		
			if(usercheck('pass_word','password_label_login'))
			{
				return true;
			}
		else{
				alert('check password');
				return false;
			}
		}
	else
		{
				
			alert('check username');
			return false;
		}
	
}

function checkit()
{
	
	var x = document.getElementById('date').value;
	if(x == "")
		alert('YEP');
	else
		alert('DAMN');
}

function check_for_name	(id,label_name)
{
	    var check1;
		var element = document.getElementById(label_name);
		var element_text = document.getElementById(id);
		var string_element = new String(element_text.value);	
		if(string_element.length<1 )
			{
				element.innerHTML="ENTER NAME";
				element.style.color="red";
				check1 =false;
			}
			else
			{
				check1 =true;
			}
		if(check1)
			{
			var element = document.getElementById(label_name);
			var element_text = document.getElementById(id);
			
			var element_label =document.getElementById(label_name);
			var element_text=document.getElementById(id);
			var letterNumber = /^[a-zA-Z]+$/;  
			
			if((element_text.value.match(letterNumber)))   
			  {
					check2=true;	
			  }  
			else  
			  {  
				   element_label.innerHTML="ONLY ALPHABETS";
				   element_label.style.color="RED";
				   check2 =false;			
			  }
			}
		if(check1)
			if(check2)
				{
					element.innerHTML="VALID";
					element.style.color="green";
					return true;
				}		
}

function password_check(x,y,label_name)
{
	var element1 = document.getElementById(x);
	var element2 = document.getElementById(y);
	var element = document.getElementById(label_name);
	
	if(element1.value==element2.value)
		{
			element.innerHTML="passwords match";
			element.style.color="green";
			return true;
		}
	else
		{
			element.innerHTML="passwords do not match";
			element.style.color="green";
			return false;	
		}
}

function form2_validate()
{

	if(usercheck('new_user','username_label'))
	{
		if(usercheck('new-pass_word','new-password_label'))
		{
			if(password_check('new-pass_word','pass_word_duplicate','re_enter_password_label'))
			{
				if(check_for_name('name','name_label'))
				{
					if(document.getElementById('year').value=== undefined)
						alert('undefined');
						else
						alert(document.getElementById('year').value);	
				}
				else
					return alert_message('name');
			}
			else
				return alert_message('passwords,They do not match');
		}
		else
			return alert_message('password');
	}
	else
		return alert_message('user name');

     


}
function alert_message(x)
{
	alert('Check '+x);
	return false;
}	
</script>
</head>
<body onload="dateload()">
<div id ="form_1">
<img src="images/hobbies_image.gif" width="100" height="100">
<img src="images/691px-Ultraviolet_image_of_the_Cygnus_Loop_Nebula_crop.jpg" width="100" height="100">
<form name="form1" method="POST" action="NewClass" onsubmit="return form1_validate()">
USERNAME
	<input type ="text" name="user_name" id = "user_name" onblur="usercheck('user_name','username_label_login')">
	<label id="username_label_login"></label>
	<br>
PASSWORD
	<input type ="password" name="pass_word" id ="pass_word" onblur="usercheck('pass_word','password_label_login')">
	<label id="password_label_login"></label>		
	<br>	
<input type ="submit" name ="form1_submit" value="SUBMIT" >
</form>
</div>

<div id ="form_2">
IF you do not have a login already please fill up this form to sign up
<form method="POST" name="form2" action="NewClass2" onsubmit="return form2_validate()">
USERNAME
	<input type ="text" name="new_user" id = "new_user"  onblur="usercheck('new_user','username_label')" />
	<label id="username_label"></label>
	<br>
PASSWORD
	<input type ="password" name="new-pass_word" id ="new-pass_word" onblur="usercheck('new-pass_word','new-password_label')" />
	<label id="new-password_label"></label>
	<br>	
ReEnter PASSWORD
	<input type ="password" name="pass_word_duplicate" id ="pass_word_duplicate" onblur="password_check('new-pass_word','pass_word_duplicate','re_enter_password_label')" />	
	<label id="re_enter_password_label"></label>
	<br>
NAME
	<input type ="text" name="name" id = "name" onblur="check_for_name('name','name_label')">
	<label id="name_label"></label>	
	<br>
DOB
   YEAR
   	<select name="year" id="year" onchange="dateload()" required  />
	<script type ="text/javascript">
		for(var i=1930;i<2014;i++)	
			{
  				document.write("<option value=\""+i+"\">"+i+"</option>");	
  			}
	</script>
	</select>
	
	MONTH
 	<select name="month" id="month" onchange="dateload();" required>
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
 	<select name="date" id="date" onchange="dateload();" required>
 	
 	</select>
   	<br>
GENDER
	MALE<input type ="radio" name = "gender"  value="male" checked />
	FEMALE<input type ="radio" name = "gender"  value="female"  />
	<br>
HOBBIES
	<br>
FISHING
	<input type ="checkbox" name = "FISHING" checked />
	<br>
SWIMMING
	<input type ="checkbox" name = "SWIMMING" />
	<br>
OTHERS
	<input type ="checkbox" name = "OTHERS" />
	<br>
<input type ="submit" value="SIGN UP">
</form>
</div>
</body>
</html>