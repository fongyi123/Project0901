//新增會議資料
		// var meetdate;
		// var meetlocation;
		// var meettheme;
		// var meettime ;
		// var meetfile;
		var ucreate1 =[];
function meetdata() {

	


	
		 var uselect_meet=$("#select_meet").val();
		 var umeetdate1 = $("#meetdate1").val();
		 var umeetdate2 = $("#meetdate2").val();
		 var umeettheme = $("#meettheme").val();
		 var umeetlocation = $("#meetlocation").val();
		 var umeettowner = $("#meettowner").val();
		 var umeetfile = $("#meetfile").val();
		 //var times = document.getElementsByName("meettime[]");
		 //var things = document.getElementsByName("meetthing[]");
		  //抓到Documentation2的所有值 除了會議議程的值
		  console.log(uselect_meet+"---"+umeetdate1+"---"+umeetdate2+"---"+umeettheme+"---"+umeetlocation+"---"+umeettowner+"---"+umeetfile+"---"+ucreate1);
			
		  
			//呼叫PHP執行資料庫Insert
				$.ajax({
			type: "POST",
			url: phpIP + "meetdata.php",
			data: {
						select_meet:uselect_meet,
						meetdate1:umeetdate1,
						meetdate2:umeetdate2,
						meettheme:umeettheme,
						meetlocation:umeetlocation,
						meettowner:umeettowner,
						meetfile:umeetfile,
						create1:ucreate1
				},
			dataType:"json",
			success: function(data){
				if (data.meetdataOK == "True") {
					alert("會議創建成功");
					console.log(data.sql);
					
				}else{
					alert("帳會議創建失敗" + data.sql);
					console.log(data);
				}
				},
				error: function(data){
					alert("會議創建PHP程式執行錯誤");
			}

		});





		}		
function processFormData() {

	
	var times = document.getElementsByName("meettime[]");
	var things = document.getElementsByName("meetthing[]");;

	var meetdata="<ol id='listviewmeetdata' data-role='listview' data-theme='c'>";

	

	for (var i = 0; i < times.length; i++) {

		var t = new Object();
		t.times=times[i].value;
		t.things=things[i].value;
		ucreate1.push(t);
		console.log(times[i].value + " - " + things[i].value);

		meetdata += "<li>" +"時間:"+times[i].value+"----"+"行程:" +things[i].value+ "</li>";
		console.log(meetdata);
	}
		meetdata += "</ol>";
		$("#meetdataList").html(meetdata);



				
}

function processFormData2() {

	
	 var meetdata1="議程設定完畢";
		
	// 	$("#meetdataList").html(meetdata);

			location.href = "#Documentation2";
				$("#meetdatatable1").html(meetdata1);
}