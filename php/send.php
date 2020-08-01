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

$sector = $obj['sector'];

$choice = $obj['choice'];

	 $Sql_Query = "insert into circulars (userid,heading,body,short,sector,post) values ('$userid','$heading','$body','$short','$sector','$choice')";
	 
	 
	 if(mysqli_query($con,$Sql_Query)){
		$MSG = 'Circular Sent';
		$json = json_encode($MSG);
		echo $json;
	 }
	 else{
		echo 'Try Again';
	 }
 mysqli_close($con);
?>