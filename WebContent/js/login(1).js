
$(document).ready(function(){
	$("#username").val("");
	$("#password").val("");
	//重置
	$("#secutityCodeBut").click(function(){
		$("#username").val("");
		$("#password").val("");
	});
});
//登录验证
function loginSubmit(){
	if($("#username").val()==''){
		alert("账号不可为空！");
		$("#username").focus();
		return false;
	}
	if($("#password").val()==''){
		alert("密码不可为空！");
		$("#password").focus();
		return false;
	}
	return true;
}