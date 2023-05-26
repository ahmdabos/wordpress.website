<?php
require_once(ABSPATH . 'wp-load.php');
$db_host = DB_HOST;
$db_name = DB_NAME;
$db_user = DB_USER;
$db_pass = DB_PASSWORD;
echo $db_user;
// Create a new mysqli instance
$mysqli = new mysqli($db_host, $db_user, $db_pass, $db_name);

// Check for connection errors

if ($mysqli->connect_error) {
    die('Connect Error (' . $mysqli->connect_errno . ') ' . $mysqli->connect_error);
}

// Tables to backup
$result = $mysqli->query('SHOW TABLES');
$tables = $result->fetch_all(MYSQLI_NUM);
foreach ($tables as &$table) {
    $table = $table[0];
}
$backup_dir = WP_CONTENT_DIR . '/backups/';
if (!is_dir($backup_dir)) {
    mkdir($backup_dir, 0755, true);
}

$backup_file = $backup_dir . 'db_backup_' . date('Ymd_His') . '.sql';
// Backup file path
$backup_file = WP_CONTENT_DIR . '/backups/db_backup_' . date('Ymd_His') . '.sql';

// Open the backup file for writing
$handle = fopen($backup_file, 'w+');

// Loop over the tables
foreach ($tables as $table) {
    // Get the table structure
    $result = $mysqli->query('SHOW CREATE TABLE ' . $table);
    $row = $result->fetch_assoc();

    // Write the table structure to the backup file
    fwrite($handle, $row['Create Table'] . ";\n\n");

    // Get the table data
    $result = $mysqli->query('SELECT * FROM ' . $table);
    while ($row = $result->fetch_assoc()) {
        // Write the table data to the backup file
        fwrite($handle, 'INSERT INTO ' . $table . ' VALUES (' . implode(',', array_map(array($mysqli, 'real_escape_string'), $row)) . ");\n");
    }

    // Write a new line to the backup file
    fwrite($handle, "\n");
}

// Close the backup file
fclose($handle);

// Close the mysqli connection
$mysqli->close();

// Now let's create a backup of the WordPress files
$rootPath = realpath('./');
$zip_file = WP_CONTENT_DIR . '/backups/files_backup_' . date('Ymd_His') . '.zip';

// Initialize archive object
$zip = new ZipArchive();
$zip->open($zip_file, ZipArchive::CREATE | ZipArchive::OVERWRITE);

// Create recursive directory iterator
$files = new RecursiveIteratorIterator(
    new RecursiveDirectoryIterator($rootPath),
    RecursiveIteratorIterator::LEAVES_ONLY
);

foreach ($files as $name => $file) {
    if ($file->isDir()) {
        continue;
    }

    // Add current file to archive
    $zip->addFile($file->getRealPath(), substr($file->getRealPath(), strlen($rootPath) + 1));
}

// Zip archive will be created only after closing object
$zip->close();