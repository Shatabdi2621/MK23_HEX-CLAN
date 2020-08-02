<?php
require 'PHPMailerAutoload.php';
 
		$mysql_hostname = '';
		$mysql_username = '';
		$mysql_password = '';
		$mysql_dbname = 'junior_official';
		
		$dbh = new PDO("mysql:host=$mysql_hostname;dbname=$mysql_dbname", $mysql_username, $mysql_password);
        $json = file_get_contents('php://input');
        $obj = json_decode($json,true);
		$body = $obj['body'];
		$heading = $obj['heading'];
		$short = $obj['short'];
		$choice = $obj['choice'];
		$sector = $obj['sector'];
        $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
         $stmt = $dbh->prepare("SELECT email FROM $choice");
        $stmt->execute();
        while($row = $stmt->fetch()) {
			$email = $row['email'];
			sendEmail($email);
        }
		 
	function sendEmail($email){
        global $body, $heading, $short, $choice, $sector;
		$mail = new PHPMailer;
 
		$htmlversion="<p> You have a new message. Please open your app to view it. </p>";
		$textVersion="Hi abc,.\r\n This is your promo code:  1234 text Version";
		$mail->isSMTP();                                     		 
		$mail->Host = 'smtp.gmail.com';  							
		$mail->SMTPAuth = true;                            
		$mail->Username = 'Email Id';         		
		$mail->Password = '';                    
		$mail->SMTPSecure = 'tls';        
    	$mail->Port = 587;                          
		$mail->setFrom('Email Id', 'Test Email');
		$mail->addAddress($email);            
		$mail->isHTML(true);                             
		$mail->Subject = 'Test Email Subject';
		$mail->Body    = $htmlversion;
		$mail->AltBody = 'You have a new messaage. Please open your app to view it.';
 
	if(!$mail->send()) {
			echo 'Message could not be sent.';
			echo 'Mailer Error: ' . $mail->ErrorInfo;
	} else {
		echo 'Message has been sent to User name : abc Email:  '.$email.'<br><br>';
	}
}
?>