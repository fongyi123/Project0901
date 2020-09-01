<?php
	require_once("phpsetting.php");

	$conn = new mysqli($dbServer,$dbLogin,$dbPwd,$dbUse);

	if($conn->connect_error) {
		die("<H2>資料庫連線失敗: " . $conn->connect_error . "</H2>");
	}
	mysqli_set_charset($conn,"utf8");	//處理PHP讀取mySql資料庫中文亂碼問題

	/*
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
	*/


	$sql ="INSERT INTO meeting_system.meet (select_meet, meetdate1, meetdate2, meettheme, meetlocation, meettowner, meetfile, create1) VALUES (".
	"'" . $_POST['select_meet'] . "',". 
	"'" . $_POST['meetdate1'] . "',".
	"'" . $_POST['meetdate2'] . "',".
	"'" . $_POST['meettheme'] . "',".
	"'" . $_POST['meetlocation'] . "',".
	"'" . $_POST['meettowner'] . "',".
	"'" . $_POST['meetfile'] . "',".
	"'" . $_POST['create1'] . "')" ;



	//echo $sql;

	if ($conn->query($sql) == TRUE) {
		$result = array("meetdataOK" => "True", "sql" => $sql);
	}else{
		$result = array("meetdataOK" => "False", "sql" => $conn->connect_error);
	}
	
	$conn->close();
	echo json_encode($result);
	
//INSERT INTO `meeting_system`.`meet` (`select_meet`, `meetdate1`, `meetdate2`, `meettheme`, `meetlocation`, `meettowner`, `meetfile`, `create`, `id`) VALUES ('4', '2016-09-01', '2016-09-02', '4', '4', '4', '4', '', NULL);
//INSERT INTO `meeting_system`.`meet` (`select_meet`, `meetdate1`, `meetdate2`, `meettheme`, `meetlocation`, `meettowner`, `meetfile`, `create`, `id`) VALUES ('4', '', '', '', '', '', '', '', NULL)
?>