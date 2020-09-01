//顯示會議內容
function nameList(omeetingId) {
	 var oidname = storage.getItem('uidname');
	 var ouid=storage.getItem('uid');
	 
	//呼叫PHP執行資料庫Insert
	$.ajax({
		type: "POST",
		url: phpIP + "omeetingId.php",
		data: {	uidname: oidname,
				userID:ouid,
				meetingID:omeetingId
			  },
		dataType:"json",
		success: function(data){

			if(jQuery.isEmptyObject(data)) {
				alert("此帳號尚未有會議資訊."+ data.sql);
			} else {

				var meeting="<ul id='listviewMeetings' data-role='listview' data-theme='c'>";
				for(i=0;i<data.length;i++) {
					//meeting += "<li><a href='' onClick='nameList(\"" + data[i].meetingID + "\");'>" + data[i].meetingname+"</br>"+ data[i].date+"</a></li>";
					// meeting += "<li><hr>"+data[i].meetingID +"</br>"
					//                  +data[i].meetingname +"</br>"
					//                  +data[i].content +"</br>"
					//                  +data[i].date +"</br>"
					//                  +data[i].loca +"</br>"
					//                  +data[i].word +  "<hr></li>";

					meeting += "<h1>會議代碼:"+data[i].meetingID+"<h1>" +
					           "<h1>會議名稱:"+data[i].meetingname+"<h1>" +
					           "<h1>會議內容:"+data[i].content+"<h1>" +
					           "<h1>會議日期:"+data[i].date+"<h1>"+
					           "<h1>會議地點:"+data[i].loca+"<h1>" +
					           "<h1>word:"+data[i].word+"<h1>";
				}
				meeting += "</ul>";

				console.log(meeting);

				$("#DocumentationPage11").html(meeting);

				$('#listviewMeetings').listview();
			}
		},
		error: function(data){
			console.write(data);
			alert("會議清單PHP程式執行發生錯誤"+data.sql);
		}
	});
}