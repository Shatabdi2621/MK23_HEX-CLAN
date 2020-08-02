<?php
 
$HostName = "";
 
$DatabaseName = "junior_official";
 
$HostUser = "";
 
$HostPass = ""; 
 
$con = mysqli_connect($HostName,$HostUser,$HostPass,$DatabaseName);
 
$json = file_get_contents('php://input');
 
$obj = json_decode($json,true);
 
$userid = $obj['userid'];

$heading = $obj['heading'];
 
$body = $obj['body'];

$short = $obj['short'];

	 $Sql_Query = "insert into $userid (heading,body,short) values ('$heading','$body','$short')";
	 
	 
	 if(mysqli_query($con,$Sql_Query)){
		$MSG = 'Circular Saved';
		$json = json_encode($MSG);
		echo $json;
	 }
	 else{
		echo 'Try Again';
	 }
 mysqli_close($con);
?>