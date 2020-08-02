<?php

 $HostName = "";
 
 $DatabaseName = "junior_official";
 
 $HostUser = "";
 
 $HostPass = ""; 
 
 $con = mysqli_connect($HostName,$HostUser,$HostPass,$DatabaseName);
 
 $json = file_get_contents('php://input');
 
 $obj = json_decode($json,true);
 
 $userid = $obj['userid'];
 
 $password = $obj['password'];
 
 $loginQuery = "select * from Banking where userid = '$userid' and password = '$password' ";
 
 $check = mysqli_fetch_array(mysqli_query($con,$loginQuery));
 
	if(isset($check)){
		 $onLoginSuccess = 'Login Matched';
		 $SuccessMSG = json_encode($onLoginSuccess);
		 echo $SuccessMSG;
	 }
	 else{
		$InvalidMSG = 'Invalid Username or Password Please Try Again';
		$InvalidMSGJSon = json_encode($InvalidMSG);
		echo $InvalidMSGJSon;
	 }
 mysqli_close($con);
?>