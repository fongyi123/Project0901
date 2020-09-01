//顯示登入帳號顯示會議清單
function meetinglist() {
	var oidname = storage.getItem('uidname');
	var ouid=storage.getItem('uid');
	
	//呼叫PHP執行資料庫Insert
	$.ajax({
		type: "POST",
		url: phpIP + "meetinglist.php",
		data: {	uidname: oidname,
				userID:ouid
			  },
		dataType:"json",
		success: function(data){

			if(jQuery.isEmptyObject(data)) {
				alert("此帳號尚未有會議."+ data.sql);
			} else {

				var meeting="<ul id='listviewMeetings' data-role='listview' data-theme='c'>";
				for(i=0;i<data.length;i++) {
					meeting += "<li><a href='#DocumentationPage1' onClick='nameList(\"" + data[i].meetingID + "\");'>" + data[i].meetingname+"</br>"+ data[i].date+"</a></li>";
				}
				meeting += "</ul>";

				console.log(meeting);

				$("#Documentation12").html(meeting);

				$('#listviewMeetings').listview();
			}
		},
		error: function(data){
			console.write(data);
			alert("會議清單PHP程式執行發生錯誤"+data.sql);
		}
	});
}



//顯示登入帳號會議清單日期排序
function meetinglistdate() {
	var oidname = storage.getItem('uidname');
	var ouid=storage.getItem('uid');
	
	//呼叫PHP執行資料庫Insert
	$.ajax({
		type: "POST",
		url: phpIP + "meetinglistdate.php",
		data: {	uidname: oidname,
				userID:ouid
			  },
		dataType:"json",
		success: function(data){

			if(jQuery.isEmptyObject(data)) {
				alert("此帳號尚未有會議."+ data.sql);
			} else {

				var meeting="<ul id='listviewMeetings' data-role='listview' data-theme='c'>";
				for(i=0;i<data.length;i++) {
					meeting += "<li><a href='#DocumentationPage1' onClick='nameList(\"" + data[i].meetingID + "\");'>" + data[i].meetingname +"</br>"+ data[i].date+ "</a></li>";
				}
				meeting += "</ul>";

				console.log(meeting);


				$("#Documentation12").html(meeting);

				$('#listviewMeetings').listview();
			}
		},
		error: function(data){
			console.write(data);
			alert("會議清單PHP程式執行發生錯誤"+data.sql);
		}
	});
}

//顯示登入帳號會議清單部門排序
function meetinglistdepID() {
	var oidname = storage.getItem('uidname');
	var ouid=storage.getItem('uid');
	
	//呼叫PHP執行資料庫Insert
	$.ajax({
		type: "POST",
		url: phpIP + "meetinglistdepID.php",
		data: {	uidname: oidname,
				userID:ouid
			  },
		dataType:"json",
		success: function(data){

			if(jQuery.isEmptyObject(data)) {
				alert("此帳號尚未有會議."+ data.sql);
			} else {

				var meeting="<ul id='listviewMeetings' data-role='listview' data-theme='c'>";
				for(i=0;i<data.length;i++) {
					meeting += "<li><a href='#DocumentationPage1' onClick='nameList(\"" + data[i].meetingID + "\");'>" + data[i].meetingname +"</br>"+ data[i].depID+ "</a></li>";
				}
				meeting += "</ul>";

				console.log(meeting);


				$("#Documentation12").html(meeting);

				$('#listviewMeetings').listview();
			}
		},
		error: function(data){
			console.write(data);
			alert("會議清單PHP程式執行發生錯誤"+data.sql);
		}
	});
}

