//顯示登入帳號顯示帳戶資訊
function userdata1() {
 	var oidname = storage.getItem('uidname');
	var ouid=storage.getItem('uid');
	
	//呼叫PHP執行資料庫Insert
	$.ajax({
		type: "POST",
		url: phpIP + "userdata.php",
		data: {	uidname: oidname,
				userID:ouid
			  },
		dataType:"json",
		success: function(data){

				if(jQuery.isEmptyObject(data)) {
				alert("此帳號沒有帳戶資訊."+ data.sql);
			} else {

				var userdata="<ul id='userdata' data-role='listview' data-theme='c'>";
				for(i=0;i<data.length;i++) {
					

				
					"<form id='newUserdata'>"

						"<fieldset>"
							userdata +=
							   "<h1>會員帳號:<INPUT TYPE='text' id='ouid1'  value="+data[i].userID+" readonly><h1>"+// readonly 属性可以防止用户对值进行修改
					           "<h1>姓　　名:<INPUT TYPE='text' id='uName' value=" + data[i].username + "><h1>" +
					           "<h1>密　　碼:<INPUT TYPE='password' id='upassword1' value="+data[i].password+" ><h1>" +
					           "<h1>確認密碼:<INPUT TYPE='password' id='upassword2' value="+data[i].password+" ><h1>" +
					           "<h1>性　　別:<INPUT TYPE='text' id='usex' value="+data[i].usersex+" ><h1>"+
					           "<h1>職　　稱:"+data[i].usertitile+"<h1>" +
					           "<h1>部門ＩＤ:"+data[i].depID+"<h1>"+
							   "<h1>電子信箱:<INPUT TYPE='text' id='uemail' value="+data[i].usermail+"><h1>"+
							   "<h1>手機號碼:<INPUT TYPE='text' id='umobile' value="+data[i].usermobile+"><h1>"+



						"</fieldset>"
						"<button TYPE='button' onClick='updatauser();'>保存修改 </button>"
					"</form>"


				}


				userdata += "</ul>";

				console.log(userdata);

				$("#Documentation14").html(userdata);

				$('#userdata').listview();
				//javascript:window.location.reload();  //Javascript刷新頁面
				
			}
		},
		error: function(data){
			console.write(data);
			alert("會議清單PHP程式執行發生錯誤"+data.sql);
		}
	});
}

