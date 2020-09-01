//顯示登入帳號開設課程清單
function listCourse() {
	var oidname = storage.getItem('uidname');
	
	
	//呼叫PHP執行資料庫Insert
	$.ajax({
		type: "POST",
		url: phpIP + "meetinglist.php",
		data: {	uidname: oidname},
		dataType:"json",
		success: function(data){
			if(jQuery.isEmptyObject(data)) {
				alert("此帳號尚未有會議.");
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
			alert("會議清單PHP程式執行發生錯誤");
		}
	});
}



function nameList(courseNo) {
	alert(courseNo);
}