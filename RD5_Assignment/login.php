<?php
require_once("connDB.php");
session_start();
if (isset($_GET["logout"])) {

  $_SESSION["maccount"] = $maccount;
  unset($_SESSION["logout"]);

  header("Location: index.php");
  exit();
}
if (isset($_POST["btnHome"])) {
  header("Location: index.php");
  exit();
}

if (isset($_POST["btnOK"])) {
  $maccount = $_POST["txtUserName"];
  $mpassword = $_POST["txtPassword"];
  $sql = "select maccount, mpassword from member where maccount='$maccount' and mpassword='$mpassword' ";

  $result = mysqli_query($link, $sql);
  $row = mysqli_fetch_assoc($result);
  if ($maccount != null  &&  $mpassword != null && $row['maccount'] == $maccount && $row['mpassword'] == $mpassword) {
    // echo "ok";


    if (trim($maccount) != "") {

      $_SESSION["maccount"] = $maccount;
      unset($_SESSION["lastPage"]);

      if (isset($_SESSION["lastPage"]))
        header(sprintf("Location: %s", $_SESSION["lastPage"]));

      else
        header("Location: index.php");
      exit();
    }
    else echo "nok";
    
  }


}
?>

<html>

<head>
  <style>
    body {
      background-color: lightblue;
    }
  </style>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title>Lab - Login</title>
</head>

<body>
  <h1 align="center">線上網銀系統</h1>

  <form id="form1" name="form1" method="post" action="login.php" border="0" align="center" cellpadding="5" cellspacing="0" bgcolor="#F2F2F2">
    <div align="center" bgcolor="#CCCCCC" style="background-color:SlateBlue;">
      <font color="#FFFFFF">會員系統 - 登入</font>
    </div>
    <div style="width:50%;height:600px;text-align:center;margin:0 auto;">
      <br>
      <br>
      <br>
      <br>
      <div>
        <label>
          <font color="#000000">帳號 :
        </label>
        <input type="text" name="txtUserName" id="txtUserName" pattern="\w{1,14}" required />
      </div>
      <br>
      <br>
      <div>
        <label>
          <font color="#000000">密碼 :
        </label>
        <input type="password" name="txtPassword" id="txtPassword" pattern="\w{1,14}" required />
      </div>
      <br>
      <br>
      <br>
      <div>
        <input type="submit" name="btnOK" id="btnOK" value="登入" />
        <input type="reset" name="btnReset" id="btnReset" value="重設" />
        <input type="submit" name="btnHome" id="btnHome" value="回首頁" />
      </div>
    </div>
    <div style="background-color:SlateBlue;">
      <font color="#FFFFFF">歡迎加入網銀大家庭</font>
    </div>
    </div>
  </form>
</body>
<!-- <table width="100%" height="200" border="0" align="center" cellpadding="5" cellspacing="0" bgcolor="#F2F2F2" style="background-color:Violet;">
      <tr>
      <td colspan="2" align="center" bgcolor="#CCCCCC" style="background-color:SlateBlue;"><font color="#FFFFFF">會員系統 - 登入</font></td>
    </tr>
      <tr>
        <td width="80" align="center">
          <font color="#FFFFFF">帳號 :
        </td>
        <td><input type="text" name="txtUserName" id="txtUserName" pattern="\w{7,14}" required /></td>
      </tr>
      <tr>
        <td width="80" align="center" valign="baseline">
          <font color="#FFFFFF">密碼 :
        </td>
        <td valign="baseline"><input type="password" name="txtPassword" id="txtPassword" pattern="\w{7,14}" required /></td>
      </tr>
      <tr>
        <td colspan="2" align="center" bgcolor="#CCCCCC" style="background-color:SlateBlue;">
          <font color="#FFFFFF">
            <input type="submit" name="btnOK" id="btnOK" value="登入" />
            <input type="reset" name="btnReset" id="btnReset" value="重設" />
            <input type="submit" name="btnHome" id="btnHome" value="回首頁" />
        </td>
      </tr>
    </table> -->

</html>