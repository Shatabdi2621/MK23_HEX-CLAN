<?php
 
$HostName = "";
 
$DatabaseName = "senior_official";
 
$HostUser = "";
 
$HostPass = ""; 
 
$con = mysqli_connect($HostName,$HostUser,$HostPass,$DatabaseName);
 
$json = file_get_contents('php://input');
 
$obj = json_decode($json,true);
 
$answer = $obj['answer'];

$random_number = $obj['random_number'];

	 $Sql_Query = "UPDATE queries SET answer = '$answer' WHERE random_number = '$random_number';";
	 
	 
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