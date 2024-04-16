<?php 
$to = "palorrimore@outlook.com"; // this is your Email address
$from = $_POST['email']; // this is the sender's Email address
$first_name = $_POST['first_name'];
$last_name = $_POST['last_name'];
$subject = "Answers to Wedding Questions";
$subject2 = "Copy of your answers to Penny and Mats Wedding Questions";
$message = $first_name . " " . $last_name . " wrote the following:" . "\n\n" . "Attendance: " . $_POST['attendance'] . "\n\n" . "Dietary Requirements: " . $_POST['diet'] . "\n\n" . "Accessibility Requirements: " . $_POST['access'] . "\n\n" . "Song request: " . $_POST['song'] . "\n\n" . "Your Advice: " . $_POST['advice'] . "\n\n" . "Your other comments: " . $_POST['other'];
$message2 = "Here is a copy of your answers: " . $first_name . "\n\n" . "Attendance: " . $_POST['attendance'] . "\n\n" . "Dietary Requirements: " . $_POST['diet'] . "\n\n" . "Accessibility Requirements: " . $_POST['access'] . "\n\n" . "Song request: " . $_POST['song'] . "\n\n" . "Your Advice: " . $_POST['advice'] . "\n\n" . "Your other comments: " . $_POST['other'];

$headers = "From:" . $from;
$headers2 = "From:" . $to;
mail($to,$subject,$message,$headers);
mail($from,$subject2,$message2,$headers2); // sends a copy of the message to the sender
echo "Answers Submitted. Thank you " . $first_name ;
// You can also use header('Location: thank_you.php'); to redirect to another page.
header('Location: thank-you.html')
?>