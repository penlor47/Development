<?php
session_start();

// Path to your .htpasswd file
$htpasswdFile = 'secure/.htpasswd';

// Function to verify password
function verifyPassword($username, $password, $htpasswdFile) {
    if (!file_exists($htpasswdFile)) {
        return false;
    }

    // Read the .htpasswd file
    $lines = file($htpasswdFile, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
    foreach ($lines as $line) {
        list($storedUser, $storedHash) = explode(':', $line, 2);
        if ($storedUser == $username && password_verify($password, $storedHash)) {
            return true;
        }
    }
    return false;
}

if (isset($_POST['login'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];

    if (verifyPassword($username, $password, $htpasswdFile)) {
        $_SESSION['loggedin'] = true;
        header("Location: index.php");
        exit;
    } else {
        $error = "Invalid credentials.";
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
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
