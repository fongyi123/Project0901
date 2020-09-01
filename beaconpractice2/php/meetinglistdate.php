<?php
	require_once("phpsetting.php");

	$conn = new mysqli($dbServer,$dbLogin,$dbPwd,$dbUse);

	if($conn->connect_error) {
		die("<H2>資料庫連線失敗: " . $conn->connect_error . "</H2>");
	}
	
	mysqli_set_charset($conn,"utf8");	//處理PHP讀取mySql資料庫中文亂碼問題

	//$sql = "SELECT * FROM course WHERE uid='" . $_POST['uid'] .  "'";

	//測試用
	//$sql = "'"select * from "Meeting, Sign ,users" where "(users.username="'" .'$_POST['uidname'] '. '" and Sign.userID = 'us0001' and Meeting.meetingID=Sign.meetingID)";


	//資料搜尋失敗沒有會議	
	//$sql = "SELECT * FROM Meeting, Sign ,users WHERE Sign.userID = 'us0001' and Meeting.meetingID=Sign.meetingID and users.username=" . $_POST['uidname'] .  "'";


	//資料搜尋成功
	$sql = "SELECT * FROM Meeting, Sign ,users WHERE Sign.userID ='" .  $_POST['userID'] .  "' and Meeting.meetingID=Sign.meetingID and users.username='" . $_POST['uidname'] .  "' ORDER BY `meeting`.`date` DESC";

    //SQL搜尋
	//$sql = "select * from `meeting`, `sign`, `users` where (users.username='吳鴻智' and Sign.userID = 'us0001' and Meeting.meetingID=Sign.meetingID)";


	$result = $conn->query($sql);

	$meetinglist = array();
		if ($result->num_rows > 0) {
		    while($row = $result->fetch_assoc()) {
		        $meetinglist[] = $row;
		    }
		} 

	
	$conn->close();

	echo json_encode($meetinglist);


//select * from `meeting`, `sign`, `users` where (users.username='吳鴻智' and Sign.userID = 'us0001' and Meeting.meetingID=Sign.meetingID)
?>

