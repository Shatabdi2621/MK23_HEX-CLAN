<?php
 
$HostName = "";
 
$DatabaseName = "senior_official";
 
$HostUser = "";
 
$HostPass = ""; 
 
$con = mysqli_connect($HostName,$HostUser,$HostPass,$DatabaseName);
 
$json = file_get_contents('php://input');
 
$obj = json_decode($json,true);
 
$userid = $obj['userid'];

$useridSeniorOfficial = $obj['useridSeniorOfficial'];

$heading = $obj['heading'];

$short = $obj['short'];
 
$body = $obj['body'];

$sector = $obj['sector'];

$question = $obj['question'];

$random_number = rand(1, 1000000);

	 $Sql_Query = "insert into queries (junior_official_user_id,senior_official_user_id,heading,short,question,body,sector, random_number) values ('$userid','$useridSeniorOfficial','$heading','$short','$question','$body','$sector','$random_number')";
	 
	 
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