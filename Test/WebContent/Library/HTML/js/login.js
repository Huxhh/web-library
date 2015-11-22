//输入框的改变
$(function(){
	$(".loginText input").bind("focus",
		function(){
			$(this).css({"backgroundColor":"#ddd","boxShadow":"0px 1px 1px blue"});
		}
	),
	$(".loginText input").bind("blur",
		function(){
			$(this).css({"backgroundColor":"#18191e","boxShadow":"0px 1px 1px #df4a32"});
		}
	)
})
// 多个action的设置
$(function(){
	// administrator
	$(".botton1").click(function(){
		if($(".login1").val()!="" && $(".login2").val()!=""){
			$(".loginText").attr("action","admlogin.jsp")//要修改的action的url
		} else {
			alert("用户名和密码必须填写")
		}
	})
	// student
	$(".botton2").click(function(){
		if($(".login1").val()!="" && $(".login2").val()!=""){
			$(".loginText").attr("action","./helpLogin")//要修改的action的url
		} else {
			alert("用户名和密码必须填写")
		}
	})
})