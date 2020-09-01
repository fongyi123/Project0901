//帳密登入檢查
function login() {
	var oid = $("#lidname").val();
	var opwd = $("#lpassword").val();   //這邊是要取得XX值才宣告變數
	
	//呼叫PHP執行資料庫Insert
	$.ajax({
		type: "POST",
		url: phpIP + "login.php",
		data: {	uid: oid,   //data有的資料是要往後傳PHP
				uPwd :opwd},
		dataType: "json",
		success: function(data){
			if (data.loginOK == "True") {
				storage.setItem('didLogin','True');   //local storag存儲 想要的值
				storage.setItem('uid',oid);
				storage.setItem('uidname',data.uidname);
				$("#uname").html = data.uidname;
				console.log(data.uid);
				alert("歡迎 " + data.uidname +" 登入使用本系統!" +data.loginOK);
				location.href = "#pagemain";
				javascript:window.location.reload();  //Javascript刷新頁面
			}else{
				alert("帳號密碼錯誤...("+data.sql+")");
			}
		},
		error: function(data){
			alert("帳號登入PHP程式執行錯誤");
		}
	});
}

//執行登出作業
	function logout() {
		//登出將登入狀態改為False
		if (confirm("確定登出嗎?") == true) {
			storage.setItem('didLogin','False');
			storage.setItem('uidname','未登入');
			location.href = "#pageone";
		}
	}

//新帳號註冊
function newUser() {
	//密碼檢查
	var opwd1 = $("#npassword1").val();
	var opwd2 = $("#npassword2").val();

	if(opwd1.trim() != opwd2.trim()) {
		alert("密碼不一致");
	} else {
		var oidname = $("#nidname").val();
		var oname = $("#nName").val();
		var oemail = $("#nemail").val();
		var omobile = $("#nmobile").val();
		//呼叫PHP執行資料庫Insert
		$.ajax({
			type: "POST",
			url: phpIP + "newUser.php",
			data: {
				uidname: oidname,
				uName: oname,
				uPwd :opwd1,
				uEmail :oemail,
				uMobile :omobile},
			dataType:"json",
			success: function(data){
				if (data.newUserOK == "True") {
					alert("帳號註冊成功");
					location.href = "#pagemain";
					storage.setItem('didLogin','True');
					storage.setItem('uidname',oname);
					javascript:window.location.reload();  //Javascript刷新頁面
					alert("請重新登出再登入已確認帳號成功啟用");
				}else{
					alert("帳號註冊失敗" + data.sql);
					console.log(data);
				}
			},
			error: function(data){
				alert("帳號註冊PHP程式執行錯誤");
			}

		});
	}
}			
 
//帳號修改  帳號資料修改
function updatauser() {
	var ouid=storage.getItem('userID');
	//密碼檢查
	var opwd1 = $("#upassword1").val();
	var opwd2 = $("#upassword2").val();
alert(opwd1);
	if(opwd1.trim() != opwd2.trim()) {
		alert("密碼不一致");
	} else {
		//var oidname = $("#nidname").val();
		var oname = $("#uName").val();
		var oemail = $("#uemail").val();
		var omobile = $("#umobile").val();
		var osex=$("#usex").val();
		var ouid1=$("#ouid1").val();
		//呼叫PHP執行資料庫Insert
		$.ajax({
			type: "POST",
			url: phpIP + "updatauser.php",
			data: {
				userID:ouid1,
				uName: oname,
				uPwd :opwd1,
				uEmail :oemail,
				uMobile :omobile,
				usex :osex
					},
			dataType:"json",
			success: function(data){
				if (data.newUserOK == "True") {
					alert("帳戶修改成功"+data.sql);
					location.href = "#Documentation3";
					storage.setItem('didLogin','True');
				}else{
					alert("帳戶修改失敗" + data.qsl);
				}
			},
			error: function(data){
				alert("帳號註冊PHP程式執行錯誤");
			}

		});
	}
}			

// <!--===============================    帳號資料修改     ======================================-->
// 		<div data-role="page" id="updatauser" style="background:url(img/p16.jpg) no-repeat; background-size: 100% 100%">
// 			<div data-theme="b" data-role="header">
// 				<h2>帳號資料修改</h2>
// 				<a href="#" class="ui-btn ui-corner-all ui-icon-carat-l ui-btn-icon-notext" data-rel="back">back</a>
// 			</div>	<!-- /header -->
			
// 			<div data-role="main" class="ui-content">
// 				<form id='newUserdata'>
// 					<fieldset>
						
// 						<INPUT TYPE='text' id='uName'  placeholder="使用者名稱..">
// 						<INPUT TYPE='password' id='upassword1' placeholder="密碼..">
// 						<INPUT TYPE='password' id='upassword2' placeholder="密碼確認..">
// 						<INPUT TYPE='text' id='usex' placeholder="性別..">
// 						<INPUT TYPE='text' id='uemail' placeholder="電子郵件..">
// 						<INPUT TYPE='text' id='umobile' placeholder="行動電話..">

// 					</fieldset>
// 					<button TYPE='button' onClick='updatauser();'>保存修改</button>
// 				</form>
// 			</div>	 <!-- /div main -->

// 		</div> <!-- /pageNewuser -->