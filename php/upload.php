
<?php
 
 $HostName = "";
 
 $DatabaseName = "photos";
 
 $HostUser = "";
 
 $HostPass = ""; 
 
 $con = mysqli_connect($HostName,$HostUser,$HostPass,$DatabaseName);
 
 $json = file_get_contents('php://input');
 
 $obj = json_decode($json,true);
 
 $loginQuery = "select * from status_verify where status = 'verified'";
 
 $check = mysqli_fetch_array(mysqli_query($con,$loginQuery));
 
	if(isset($check)){
		 $onLoginSuccess = 'Login Matched';
		 $SuccessMSG = json_encode($onLoginSuccess);
		 echo $SuccessMSG ;
	 }
	 else{
		$InvalidMSG = 'Try Again' ;
		$InvalidMSGJSon = json_encode($InvalidMSG);
		 echo $InvalidMSGJSon ;
	 }
 mysqli_close($con);
?>