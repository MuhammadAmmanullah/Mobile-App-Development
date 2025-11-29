<?php
if(isset($_FILES['doc'])){
    $fname = $_FILES['doc']['name'];
    $fsize = $_FILES['doc']['size'];
    $ftype = $_FILES['doc']['type'];
    $tname = $_FILES['doc']['tmp_name'];
    $upload_dir = "uploads/";
    move_uploaded_file($tname, $upload_dir . $fname);
    echo "File uploaded successfully: " . $upload_dir . $fname;

}
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>file uploading lecture</h1>
    <form method ="post" enctype ="multipart/form-data">
    <input type ="file" name ="doc">
    <input type ="submit">
</body>
</html>