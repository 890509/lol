<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>



<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<script>
	function send(){
		var url = "sendMail.mail";
		document.mail.action = url;
		document.mail.method = "post";
		document.mail.submit();
	}
	
	function chkMail() {
		var flag = false;
		var name = $("#email_name").val();
		var content = $("#email_content").val();
		var rawEmail = $("#email_id").val();
		var validEmail = checkEmailAddress($.trim(rawEmail));
		
		
		
		$("#errorMessage").text("");
		
		if(($.trim(name).length) > 0) {
			if(validEmail) {
				if(($.trim(content).length) >0) {
					flag = true;
				} else {
					$("#errorMessage").append("NO CONTENT");
				}
			} else {
				$("#errorMessage").append("CHECK YOUR EMIAL");
			}
		} else {
			$("#errorMessage").append("CHECK YOUR NAME");
		}
		
		if (flag == true) {
			var result = confirm("SEND?");
			if(result){
				send();
			}
		}
	}	

	
	function checkEmailAddress(str){
		return /^[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+)*@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/.test(str);
	}
	



</script>



<title>SendEmailTest_lands</title>
</head>
<body>
		<form name="mail" action="">
			<div>
				<input type="text" id="email_name" name="email_name" placeholder="name"/>
				<input type="email" id="email_id" name="email_id" placeholder="id"/>
			</div>
			<div>
				<textarea id="email_content"name="email_content" placeholder="content here"></textarea>
				<input type="button" value="send" onclick="chkMail()"/>
			</div>
			<div id="errorMessage">
				&nbsp;
			</div>
		</form>
</body>
</html>