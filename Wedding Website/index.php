<?php 
session_start(); 
// Check if the user is logged in 
if (!isset($_SESSION['loggedin'])) {
  header('Location: login.php'); 
  exit; 
} 
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>The Wedding of Mat and Penny</title>
	<link rel="stylesheet" type="text/css" href="style.css">
  <link rel="stylesheet" type="text/css" href="couplePics.css">
	<link rel="stylesheet" href="https://fonts.cdnfonts.com/css/tolkien">
	<link rel="icon" type="image/x-icon" href="Pics/LOTR/ring.png">
</head>
<body>
	<nav class="light-green sticky">
    <ul class="main-nav">
      <li><a href="about.html">About</a></li>
      <li><a href="questions.html">RSVP</a></li>
      <li><a href="us.html">Us</a></li>
    </ul>
  </nav>
  <div class="main">
    <div class="pics-container">
      <div class="couple-pics">
        <img src="Pics/22mar.jpg" class="img" loading="lazy" alt="Penny and Mat sat at the dining table with dog Elfie across their laps">
        <img src="Pics/22mar2.jpg" class="img" loading="lazy" alt="Selfie of Penny and Mat">
        <img src="Pics/22apr.jpg" class="img" loading="lazy" alt="Selfie of Penny and Mat wrapped up in winter coats">
        <img src="Pics/22apr1.jpg" class="img" loading="lazy" alt="Selfie of Penny and Mat in a car">
        <img src="Pics/22apr2.jpg" class="img" loading="lazy" alt="Penny is laughing at Mat pulling a funny face">
        <img src="Pics/22apr3.jpg" class="img" loading="lazy" alt="Penny and Mat stood infront of globe at Durlston Castle">
        <img src="Pics/22apr4.jpg" class="img" loading="lazy" alt="Selfie of Penny and Mat in sunglasses">
        <img src="Pics/22apr5.jpg" class="img" loading="lazy" alt="Penny and Mat sat in a train carriage">
        <img src="Pics/22apr6.jpg" class="img" loading="lazy" alt="Penny and Mat frightened of Death Eater in Harry Potter Train Carriage">
        <img src="Pics/22apr7.jpg" class="img" loading="lazy" alt="Penny and Mat pulling faces in selfie with model of Hogwarts great hall">
        <img src="Pics/22apr8.jpg" class="img" loading="lazy" alt="Penny and Mat with the Hogwarts express">
        <img src="Pics/22apr9.jpg" class="img" loading="lazy" alt="Penny and Mat on Hagrids Bike and Sidecar">
        <img src="Pics/22apr10.jpg" class="img" loading="lazy" alt="Penny kissing Mats cheek">
        <img src="Pics/22apr11.jpg" class="img" loading="lazy" alt="Penny and Mat holding the sword to get Hufflepuff goblet">
        <img src="Pics/22apr12.jpg" class="img" loading="lazy" alt="Penny and Mat with Hogwarts model">
        <img src="Pics/22apr13.jpg" class="img" loading="lazy" alt="Penny and Mat stood under dragon">
        <img src="Pics/22may.jpg" class="img" loading="lazy" alt="Penny and Mat at the theatre">
        <img src="Pics/22aug.jpg" class="img" loading="lazy" alt="Penny and Mat with kitten Lupin">
        <img src="Pics/22sep.jpg" class="img" loading="lazy" alt="Penny and Mat infront of posh house">
        <img src="Pics/22oct1.jpg" class="img" loading="lazy" alt="Penny and Mat at Harry Potter Forest Sign">
        <img src="Pics/22oct2.jpg" class="img" loading="lazy" alt="Selfie at Oktoberfest">
        <img src="Pics/22nov.jpg" class="img" loading="lazy" alt="Picture infront of Alice in Wonderland light trail heart">
        <img src="Pics/23feb.jpg" class="img" loading="lazy" alt="Penny and Mat with puppy Floki first day home">
        <img src="Pics/23feb1.jpg" class="img" loading="lazy" alt="Penny and Mat looking at puppy Floki first visit">
        <img src="Pics/23feb2.jpg" class="img" loading="lazy" alt="Penny and Mat holding puppy's Floki and Daisy first visit">
        <img src="Pics/23feb3.jpg" class="img" loading="lazy" alt="Penny and Mat at theatre selfie">
        <img src="Pics/23apr1.jpg" class="img" loading="lazy" alt="Penny and Mat in the wind, Penny's face is covered with her hair">
        <img src="Pics/23apr2.jpg" class="img" loading="lazy" alt="Penny and Mat infornt of Berlin archway">
        <img src="Pics/23apr3.jpg" class="img" loading="lazy" alt="Penny and Mat at Checkpoint Charlie">
        <img src="Pics/23aug1.jpg" class="img" loading="lazy" alt="Penny and Mat posing with a cow">
        <img src="Pics/23aug2.jpg" class="img" loading="lazy" alt="Penny and Mat selfie with the parthenon">
        <img src="Pics/23aug3.jpg" class="img" loading="lazy" alt="Penny and Mat selfie at waterpark infront of greenery">
        <img src="Pics/23aug4.jpg" class="img" loading="lazy" alt="Penny and Mat selfie at waterpark on sunloungers">
        <img src="Pics/23aug5.jpg" class="img" loading="lazy" alt="Penny and Mat selfie over cruiseship">
        <img src="Pics/23aug6.jpg" class="img" loading="lazy" alt="Penny and Mat selfie with castle background">
        <img src="Pics/23aug7.jpg" class="img" loading="lazy" alt="Penny and Mat dressed up">
        <img src="Pics/23nov.jpg" class="img" loading="lazy" alt="Penny and Mat hugging in Christmas frame at Nottingham castle winter fair">
        <img src="Pics/23dec7.jpeg" class="img" loading="lazy" alt="Mat on Penny's shoulders with dog Floki on Penny's lap">
        <img src="Pics/23dec1.jpg" class="img" loading="lazy" alt="Penny and Mat in winter at star light from Waddesdon light show">
        <img src="Pics/23dec2.jpg" class="img" loading="lazy" alt="Penny and Mat in winter at reindeer light from Waddesdon light show">
        <img src="Pics/24jan.jpg" class="img" loading="lazy" alt="Mat and Penny at graduation under inflatable sign">
        <img src="Pics/24feb2.jpg" class="img" loading="lazy" alt="Penny and Mat showing off their beer's on Valentine's day.">
        <img src="Pics/24feb3.jpeg" class="img" loading="lazy" alt="Penny and Mat with christmas cracker crowns on">
        <img src="Pics/24feb4.jpeg" class="img" loading="lazy" alt="Penny and Mat at bonfire at Bob and Cassies">
        <img src="Pics/24feb5.jpeg" class="img" loading="lazy" alt="Penny and Mat at Cadbury's world afternoon tea">
        <img src="Pics/feb24.jpg" class="img" loading="lazy" alt="Penny and Mat in black and white having just got engaged">
      </div>
	  </div>
		<h1 class="bilbo-regular">Penny and Mat's Wedding</h1>
		<p>
			So, you have the fortune (or misfortune?) to be invited to our wedding and we are so excited to have you. Please say that you can come? 
		</p>
		<div class="map-container">
			<div>
				<p>
					You can RSVP on our website in the <strong><a href="questions.html" class="link">RSVP</a></strong> page. Please fill in this page so that we know your dietrary needs and other important wedding bits that we need to know. 
				</p>
				<p>
					You will find information <strong><a href="about.html" class="link">About</a></strong> the wedding in the about tab. 
				</p>
				<p>Finally if you are curious to know more about us and who our wedding party is, you will find this information in the <strong><a href="us.html" class="link">Us</a></strong> tab.
				</p>
			</div>
			<div class="lotr-map">
				<img src="Pics/LOTR/letters.png" loading="lazy" alt="Elvish writing in a circle">
			</div>
		</div>
		<div class="spell-container">
			<div class="hand">
				<img src="Pics/LOTR/hand.png" loading="lazy" alt="A hand holding the one ring">
			</div>
			<div class="spelling">
				<p><small><i>Please note: <strong>MAT</strong> is spelt with <strong>1 T</strong></i></small></p>
			</div>
		</div>
	</div>
  <footer>
		<div class="bottom">
			<img src="Pics/weddingPartysilhouette.tiff" loading="lazy" alt="Lord of the rings inspired picture of the wedding party walking.">
		</div>
	</footer>
</body>
</html>