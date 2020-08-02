<?php

 $HostName = "database-1.caf6lw71z7rh.ap-south-1.rds.amazonaws.com";
 
 $DatabaseName = "junior_official";
 
 $HostUser = "admin";
 
 $HostPass = "ag_db110"; 
 
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