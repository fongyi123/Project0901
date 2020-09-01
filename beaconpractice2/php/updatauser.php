<?php
	require_once("phpsetting.php");

	$conn = new mysqli($dbServer,$dbLogin,$dbPwd,$dbUse);

	if($conn->connect_error) {
		die("<H2>資料庫連線失敗: " . $conn->connect_error . "</H2>");
	}
	mysqli_set_charset($conn,"utf8");	//處理PHP讀取mySql資料庫中文亂碼問題

	// 	$sql = "INSERT INTO login (uid, uName, uPwd, email, mobile) VALUES (" .
	// "'" . $_POST['uidname'] . "',".
	// "'" . $_POST['uName'] . "',".
	// "'" . $_POST['uPwd'] . "',".
	// "'" . $_POST['uEmail'] . "',".
	// "'" . $_POST['uMobile'] . "')" ;

	// $sql ="UPDATE meeting_system.users SET 
	// 		username ='".  $_POST['uName'] .  "',
	// 		password='" .  $_POST['uPwd'] .  "',
	// 		usersex='" .  $_POST['usex'] .  "',
	// 		usermail = '" .  $_POST['uEmail'] .  "', 
	// 		usermobile = '" .  $_POST['uMobile'] .  "' 
	// 		WHERE users.userID = '" .  $_POST['userID'] .  "'";


	$sql ="UPDATE meeting_system.users SET username='" .  $_POST['uName'] .  "',password='" .  $_POST['uPwd'] .  "',usersex='" .  $_POST['usex'] .  "',usermail = '" .  $_POST['uEmail'] .  "', usermobile = '" .  $_POST['uMobile'] .  "' WHERE users.userID =  '" .  $_POST['userID'] . "' ";

	if ($conn->query($sql) == TRUE) {
		$result = array("newUserOK" => "True", "sql" => $sql);
	}else{
		$result = array("newUserOK" => "False", "sql" => $conn->connect_error);
	}
	
	$conn->close();
	echo json_encode($result);
//UPDATE `meeting_system`.`users` SET `username`='ben',`password`='2',`usersex`='女',`usermail` = 'QAQ', `usermobile` = '1' WHERE `users`.`userID` = 'us0001';
	//UPDATE meeting_system.users SET username='ben',password='2',usersex='女',usermail = 'QAQ', usermobile = '1' WHERE users.userID = 'us0001';
?>