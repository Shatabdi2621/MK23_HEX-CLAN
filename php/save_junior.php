<?php
 
$HostName = "database-1.caf6lw71z7rh.ap-south-1.rds.amazonaws.com";
 
$DatabaseName = "junior_official";
 
$HostUser = "admin";
 
$HostPass = "ag_db110"; 
 
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