<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
session_start();

// Path to your hashed_passwords.txt file
$hashedPasswordsFile = $_SERVER['DOCUMENT_ROOT'] . '/secure/hashed_passwords.txt';

// Function to verify password
function verifyPassword($username, $password, $hashedPasswordsFile) {
    if (!file_exists($hashedPasswordsFile)) {
        return false;
    }

    // Read the hashed_passwords.txt file
    $lines = file($hashedPasswordsFile, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
    foreach ($lines as $line) {
        list($storedUser, $storedHash) = explode(':', $line, 2);
        if ($storedUser == $username && password_verify($password, $storedHash)) {
            return true;
        }
    }
    return false;
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];

    if (verifyPassword($username, $password, $hashedPasswordsFile)) {
        $_SESSION['loggedin'] = true;
        header("Location: index.php"); // Redirect to index.php
        exit(); // Ensure script termination after redirection
    } else {
        $error = "Invalid credentials.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1" charset="UTF-8">
    <title>The Wedding of Mat and Penny</title>
    <link rel="stylesheet" type="text/css" href="login.css">
    <link rel="stylesheet" href="https://fonts.cdnfonts.com/css/tolkien">
    <link rel="icon" type="image/x-icon" href="Pics/LOTR/ring.png">
</head>
<body>
    <h2>Login</h2>
    <?php if (isset($error)) echo "<p style='color:red;'>$error</p>"; ?>
    <form method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br>
        <button type="submit" name="login">Login</button>
    </form>
</body>
</html>
