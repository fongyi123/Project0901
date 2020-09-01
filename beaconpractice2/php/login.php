<?php
	require_once("phpsetting.php");

	$conn = new mysqli($dbServer,$dbLogin,$dbPwd,$dbUse);

	if($conn->connect_error) {
		die("<H2>資料庫連線失敗: " . $conn->connect_error . "</H2>");
	}
		mysqli_set_charset($conn,"utf8");	//處理PHP讀取mySql資料庫中文亂碼問題
	$sql = "SELECT * FROM users WHERE " . "userID='" . $_POST['uid'] . "' AND password='" . $_POST['uPwd'] . "'";
		
	$result = $conn->query($sql);
	if( $result->num_rows > 0) {
		$row = $result->fetch_assoc();  //宣告row 語法取的所有想要欄位的值
		
		$checkResult = array("loginOK" => "True", "uidname" => $row['username']);
		//$checkResult = array("loginOK1" => "True", "sql" => $sql);
	} else {
		$checkResult = array("loginOK" => "False", "sql" => $conn->connect_error);
	}
	
	$conn->close();

	echo json_encode($checkResult);
//SELECT * FROM `users` WHERE `username`="吳鴻智" AND `password`="1"
	//SELECT * FROM `users` WHERE `userID`="us0001" AND `password`="1"
?>


