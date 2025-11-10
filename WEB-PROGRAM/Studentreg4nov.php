<?php
$con=mysqli_connect("localhost","root","","ammanullah-se_5-2");
if(!$con){
    echo "connection error";
}
if(isset($_POST['submit'])){
    $a=$_POST['sid'];
    $b=$_POST['sn'];
    $qu="insert into studentreg4nov values('$a','$b')";
    $re=mysqli_query($con,$qu);
    if($re){
        echo "data inserted";
    }else{
        echo  "error";
    }
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Student Registration Form</h1>
    <form action="">
        <label for="">Sap Id</label>
        <input type="text" name="sid" id="">
         <label for="">name</label>
        <input type="text" name="sn" id="">
        <button type="submit" name ="sbtn">save</button>
</form>

</body>
</html>