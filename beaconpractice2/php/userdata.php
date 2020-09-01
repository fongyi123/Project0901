
<?php
	require_once("phpsetting.php");

	$conn = new mysqli($dbServer,$dbLogin,$dbPwd,$dbUse);

	if($conn->connect_error) {
		die("<H2>資料庫連線失敗: " . $conn->connect_error . "</H2>");
	}
	
	mysqli_set_charset($conn,"utf8");	//處理PHP讀取mySql資料庫中文亂碼問題

	

	//資料搜尋成功
	$sql = "SELECT * FROM users WHERE " . "username='" . $_POST['uidname'] . "'" ;

    

	$result = $conn->query($sql);

	$meetinglist = array();
		if ($result->num_rows > 0) {
		    while($row = $result->fetch_assoc()) {
		        $meetinglist[] = $row;
		    }
		} 

	
	$conn->close();

	echo json_encode($meetinglist);

	//SELECT * FROM `users` WHERE `username`="ben" AND `password`="1"
?>