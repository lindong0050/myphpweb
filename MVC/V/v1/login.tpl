<script>
	function login()
	{
		var remWeek=0;//默认 不记住登录状态
		if($("#remWeek").prop("checked"))
		{
			remWeek=1; //记住登录状态一周
		}
		$.post("/index/loginAction/",
		{
			"username":$("#inputUserName").val(),
			"userpass":$("#inputPass").val(),
			"rem":remWeek
		},function(result){
			 if(result=="1")
			 {
			 	alert("登录成功");
			 	url="http://mytest.com:8010/index/getindex/"
			 	window.setTimeout("self.location='"+url+"';",2000);;
			 }
			 else
			 {
			 	alert(result);
			 }
		})
	}
</script>
<div class="row">
    <div class="col-xs-12 col-sm-6 col-md-8">
      	<form class="form-horizontal" role="form">
	        <div class="form-group">
	           	<label for="inputUserName" class="col-xs-12 col-sm-4 col-md-4 control-label">用户名：</label>
	          	<div class="col-xs-12 col-sm-4 col-md-5">
	            	<input class="form-control" id="inputUserName" type="email" placeholder="请输入用户名" />
	          	</div>
	        </div>
	        <div class="form-group">
	           	<label for="inputPass" class="col-xs-12 col-sm-4 col-md-4 control-label">密码：</label>
	          	<div class="col-xs-12 col-sm-4 col-md-5">
	            	<input class="form-control" id="inputPass" type="password" placeholder="请输入密码"/>
	          	</div>
	        </div>
	        <div class="form-group">
	            <div class="col-sm-offset-4 col-xs-12 col-sm-8 col-md-8 checkbox">
	               <label><input id="remWeek"  type="checkbox" /> 一周内免登录</label>
	            </div>
	        </div>
	        <div class="form-group">
	          	<div class="col-sm-offset-4 col-xs-12 col-sm-8 col-md-8">
	             	<button type="button" class="btn btn-info" onclick="login()"  >登录</button>
	          	</div>
	        </div>
      	</form>
    </div>
  </div>
</div>