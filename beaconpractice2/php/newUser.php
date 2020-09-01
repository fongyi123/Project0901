<?php
	require_once("phpsetting.php");

	$conn = new mysqli($dbServer,$dbLogin,$dbPwd,$dbUse);

	if($conn->connect_error) {
		die("<H2>資料庫連線失敗: " . $conn->connect_error . "</H2>");
	}
	mysqli_set_charset($conn,"utf8");	//處理PHP讀取mySql資料庫中文亂碼問題

		$sql = "INSERT INTO users (userID, username, password, usersex, usertitile, usercompetence, depID, usermail, usermobile) VALUES (" .
	"'" . $_POST['uidname'] . "',".
	"'" . $_POST['uName'] . "',".
	"'" . $_POST['uPwd'] . "',".
	"'" . "" . "',".
	"'" . "" . "',".
	"'" . "" . "',".
	"'" . "dep01". "',".
	"'" . $_POST['uEmail'] . "',".
	"'" . $_POST['uMobile'] . "')" ;

	if ($conn->query($sql) == TRUE) {
		$result = array("newUserOK" => "True", "sql" => $sql);
	}else{
		$result = array("newUserOK" => "False", "sql" => $conn->connect_error);
	}
	
	$conn->close();
	echo json_encode($result);
//INSERT INTO `users` (`userID`, `username`, `password`, `usersex`, `usertitile`, `usercompetence`, `depID`, `usermail`, `usermobile`) VALUES ('us0023', '羅佩怡', 'qwe123', 'rtet', 'retert', 'ee', 'dep01', '4444', '11111')
?>

