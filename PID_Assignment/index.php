<?php
require_once("connDB.php");

session_start();

if(isset($_SESSION["loginMenber"]) && ($_SESSION["loginMenber"]!="")){
    if ($_SESSION["memberLevel"]=="member"){
        header("location:member_center.php");
    }
    else{
        header("location: member_admin.php");
    }
}
if (isset($_POST["username"])&& isset($_POST["passwd"])){
    $query_RecLogin = "select musername, mpasswd, mlevel,from member where musername =?";
    $stmt=$db_link->prepare($query_RecLogin);
    $stmt->bind_param("s",$_POST["username"]);
    $stmt->exec();
    
}

?>