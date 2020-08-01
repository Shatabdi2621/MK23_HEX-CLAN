<?php
 
$HostName = "";

$DatabaseName = "admin";
 
$HostUser = "";
 
$HostPass = ""; 
 
$con = mysqli_connect($HostName,$HostUser,$HostPass,$DatabaseName);
 
$json = file_get_contents('php://input');
 
$obj = json_decode($json,true);
 
$name = $obj['name'];
 
$email = $obj['email'];
 
$password = $obj['password'];

$CheckSQL = "SELECT * FROM feedback WHERE email='$email'";

$check = mysqli_fetch_array(mysqli_query($con,$CheckSQL));


if(isset($check)){
	 $emailExist = 'Email Already Exist, Please Try Again With New Email Address!';
	$existEmailJSON = json_encode($emailExist);
	 echo $existEmailJSON ;
  }
 else{
	 $Sql_Query = "insert into feedback (name,email,password) values ('$name','$email','$password')";
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