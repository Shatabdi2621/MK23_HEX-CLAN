<?php
 
$HostName = "";
 
$DatabaseName = "admin";
 
$HostUser = "";
 
$HostPass = ""; 
 
$con = mysqli_connect($HostName,$HostUser,$HostPass,$DatabaseName);
 
$json = file_get_contents('php://input');
 
$obj = json_decode($json,true);
 
$userid = $obj['userid'];

$heading = $obj['heading'];

$short = $obj['short'];
 
$body = $obj['body'];

$post = $obj['post'];

$sector = $obj['sector'];

$question = $obj['question'];

	 $Sql_Query = "insert into queries (userid,heading,short,question,body,post,sector) values ('$userid','$heading','$short','$question','$body','$post','$sector')";
	 
	 
	 if(mysqli_query($con,$Sql_Query)){
		$MSG = 'Query Sent';
		$json = json_encode($MSG);
		 echo $json;
	 }
	 else{
		echo 'Try Again';
	 }
 mysqli_close($con);
?>