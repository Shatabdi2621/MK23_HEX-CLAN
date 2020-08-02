<?php
 
$HostName = "";

$DatabaseName = "junior_official";
 
$HostUser = "";
 
$HostPass = ""; 
 
$con = mysqli_connect($HostName,$HostUser,$HostPass,$DatabaseName);
 
$json = file_get_contents('php://input');
 
$obj = json_decode($json,true);
 
$name = $obj['name'];

$address = $obj['address'];

$number = $obj['number'];
 
$userid = $obj['userid'];
 
$password = $obj['password'];

$CheckSQL = "SELECT * FROM Banking WHERE userid ='$userid'";

$check = mysqli_fetch_array(mysqli_query($con,$CheckSQL));


if(isset($check)){

	 $emailExist = 'Email Already Exist, Please Try Again With New Email Address..!';
	 
	$existEmailJSON = json_encode($emailExist);
	 
	 echo $existEmailJSON ; 

  }
 else{
	 $Sql_Query = "insert into Banking (name,userid,password,address,number) values ('$name','$userid','$password','$address','$number')";
	 if(mysqli_query($con,$Sql_Query)){
		$MSG = 'User Registered Successfully';
		$json = json_encode($MSG);
		echo $json;
	 }
	 else{
		echo 'Try Again';
	 }
 }
 mysqli_close($con);
?>