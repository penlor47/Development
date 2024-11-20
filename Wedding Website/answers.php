<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception; 

/*Class for handling exceptions and errors*/
require '/PHPMailer/src/Exception.php';
/*PHPMailer class*/
require '/PHPMailer/src/PHPMailer.php';
/*SMTP class needed to connect to an SMTP server*/.
require '/PHPMailer/src/SMTP.php';
/*When creating a PHPMailer object, pass the parameter ‘true’ to activate exceptions (messages in the event of an error)*/
try {
  // Try to create a new instance of PHPMailer class, where exceptions are enabled
  $mail = new PHPMailer (true);
  if ($debug) {
    // issue a detailed log
   $mail->SMTPDebug = SMTP::DEBUG_SERVER; 
  }
  // Authentication with SMTP
  $mail-> isSMTP();
  $mail->SMTPAuth = true;
  $to = "matpenwedding@gmail.com"; // this is your Email address
  $from = $_POST['email']; // this is the sender's Email address
  $first_name = $_POST['fname'];
  $last_name = $_POST['lname'];
  $subject = "Answers to Wedding Questions";
  $subject2 = "Copy of your answers to Penny and Mats Wedding Questions";

  $message = $first_name . " " . $last_name . " wrote the following:" . "\n\n" . "Attendance: " . $_POST['attendance'] . "\n\n" . "Dietary Requirements: " . $_POST['diet'] . "\n\n" . "Accessibility Requirements: " . $_POST['access'] . "\n\n" . "Song request: " . $_POST['song'] . "\n\n" . "Your Advice: " . $_POST['advice'] . "\n\n" . "Your other comments: " . $_POST['other'] . "\n\n" . "Breakfast attendance: " . $_POST['breakfast'];

  $message2 = $first_name . ", here is a copy of your answers for  Mat and Penny's wedding." .  "\n\n" . "Attendance: " . $_POST['attendance'] . "\n\n" . "Dietary Requirements: " . $_POST['diet'] . "\n\n" . "Accessibility Requirements: " . $_POST['access'] . "\n\n" . "Song request: " . $_POST['song'] . "\n\n" . "Your Advice: " . $_POST['advice'] . "\n\n" . "Your other comments: " . $_POST['other'] . "\n\n" . "Breakfast attendance: " . $_POST['breakfast'];

  $headers = "From:" . $from;
  $headers2 = "From:" . $to;

  // Login
  $mail->Host = "smtp.domain.com";
  $mail->Port = 587;
  $mail->Username = "name.surname@domain.com";
  $mail->Password = "testpassword4321";
  $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
  // Set up mail for rsvp
  $mail->setFrom($from, $first_name);
  $mail->addAddress($from, $first_name);
  $mail->CharSet = 'UTF-8';
  $mail->Encoding = 'base64';
  $mail->isHTML(true);
  $mail->Subject = $subject;
  $mail->Body = $message;
  $mail->send();

  // Set up 'here was your response email'

  echo "Answers Submitted. Thank you " . $first_name ;
  // You can also use header('Location: thank_you.php'); to redirect to another page.
  header('Location: thank-you.html');
  exit;

} catch (Exception $e) {
      echo "Message could not be sent. Mailer Error: : ".$e->getMessage();
}


?>
