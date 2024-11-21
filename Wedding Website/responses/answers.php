<?php
error_reporting(E_ALL); 
ini_set('display_errors', 1);

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Collect form data and sanitize inputs
    $email = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);
    $fname = filter_var($_POST['fname'], FILTER_SANITIZE_SPECIAL_CHARS);
    $lname = filter_var($_POST['lname'], FILTER_SANITIZE_SPECIAL_CHARS);
    $attend = filter_var($_POST['attendance'], FILTER_SANITIZE_SPECIAL_CHARS);
    $diet = is_array($_POST['diet']) ? implode(", ", array_map('filter_var', $_POST['diet'], array_fill(0, count($_POST['diet']), FILTER_SANITIZE_SPECIAL_CHARS))) : filter_var($_POST['diet'], FILTER_SANITIZE_SPECIAL_CHARS);
    $access = filter_var($_POST['access'], FILTER_SANITIZE_SPECIAL_CHARS);
    $song = filter_var($_POST['song'], FILTER_SANITIZE_SPECIAL_CHARS);
    $advice = filter_var($_POST['advice'], FILTER_SANITIZE_SPECIAL_CHARS);
    $other = filter_var($_POST['other'], FILTER_SANITIZE_SPECIAL_CHARS);

    // Suppress output to prevent "headers already sent" issue
    ob_start();

    // Open the file in append mode (same directory as answers.php)
    $file_path = "rsvps.csv";
    if (!file_exists(dirname($file_path))) {
        die("Directory does not exist: " . dirname($file_path));
    }
    $file = fopen($file_path, "a");

    if ($file === false) {
        die("Error opening file for writing.");
    }

    // Add new data to the file
    if (fputcsv($file, [$fname, $lname, $email, $attend, $diet, $access, $song, $advice, $other]) === false) {
        die("Error writing to file.");
    }

    // Close the file
    fclose($file);

    // Redirect to the thank you page
    header("Location: ../thank-you.html");
    ob_end_flush();
    exit();
}
?>

