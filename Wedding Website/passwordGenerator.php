<?php
$usernames_file = 'usernames.txt';
$plaintext_passwords_file = 'secure/plaintext_passwords.txt';
$hashed_passwords_file = 'secure/hashed_passwords.txt';

// Function to hash a password
function hashPassword($password) {
    return password_hash($password, PASSWORD_BCRYPT);
}

// Read the usernames and passwords
$usernames = file($usernames_file, FILE_IGNORE_NEW_LINES);
$passwords = file($plaintext_passwords_file, FILE_IGNORE_NEW_LINES);

if (count($usernames) !== count($passwords)) {
    die("Usernames and passwords count do not match.");
}

// Create or overwrite the hashed passwords file
$hashed_file = fopen($hashed_passwords_file, 'w');

foreach ($usernames as $index => $username) {
    $password = $passwords[$index];
    $hashed_password = hashPassword($password);
    fwrite($hashed_file, "$username:$hashed_password\n");
}

fclose($hashed_file);
echo "Hashed passwords have been stored in $hashed_passwords_file.";
?>
