<?php
$con=mysqli_connect("localhost","root","","ammanullah-se_5-2");
if(!$con){
    echo "connection error";
}
$qu='select sid,snamefrom studentreg4nov';
$re=mysqli_query($con,$qu);
if($re){
    $talib=[];
    while($data=mysqli_fetch_assoc($re)){
        $talib[]=$data;
    }
}
else{
    echo 'error';
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
    <<h1>course allocation</h1>
    <label for="">select studentreg4nov</label>
    <select name="" id="">


    <?php
    if(!empty($talib)){
        foreach($talib as $row){
            echo "<option value='".$row['sid']."'>".$row['sname']."</option>";
        }
    }
    else{
        echo '<option value="">no value available</option>';
    }
    ?>
        </select>
    <label for="">select course4nov</label>
    
        </select>
</body>
</html>