<?php
	require_once("setting.php");

	$conn = new mysqli($dbServer,$dbLogin,$dbPwd,$dbUse);

	if($conn->connect_error) {
		die("<H2>資料庫連線失敗: " . $conn->connect_error . "</H2>");
	}

	mysqli_set_charset($conn,"utf8");	//處理PHP讀取mySql資料庫中文亂碼問題
	$sql = "SELECT * FROM course WHERE uid='" . $_POST['uid'] . "'";

	$result = $conn->query($sql);

	$courseList = array();
	if($result->num_rows > 0) {
    	while($row = $result->fetch_assoc()) {
        	$courseList[] = $row;
    	}
	}
	
	$conn->close();

	echo json_encode($courseList);
?>