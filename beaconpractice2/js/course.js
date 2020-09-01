//顯示登入帳號開設課程清單
function listCourse() {
	var oid = storage.getItem('uid');

	//呼叫PHP執行資料庫Insert
	$.ajax({
		type: "POST",
		url: phpIP+"courseList.php",
		data: {	uid: oid},
		dataType:"json",
		success: function(data){
			if(jQuery.isEmptyObject(data)) {
				alert("此帳號尚未有開設課程.");
			} else {
				var course="<ul id='listviewCourse' data-role='listview' data-theme='c'>";
				for(i=0;i<data.length;i++) {
					course += "<li><a href='#' onClick='nameList(\"" + data[i].cNO + "\");'>" + data[i].cName + "</a></li>";
					console.log(course);
				}
				course += "</ul>";
				$("#courseList").html(course);

				$('#listviewCourse').listview();
			}
		},
		error: function(data){
			alert("開設課程清單PHP程式執行發生錯誤");
		}
	});
}

function nameList(courseNo) {
	alert(courseNo);
}
