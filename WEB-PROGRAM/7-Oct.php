<?php
$con=mysqli_connect("localhost","root","","ammanullah-se_5-2");
if(!$con)
    {
    echo "connection error";
    }
if(isset($_POST['sbtm']))
    {
        $x=$_POST['sn'];
        $y=$_POST['fn'];
        $quer="insert into bebo values('$x','$y')";
        $res=mysqli_query($con,$quer);
    if($res)
        {
            echo "data inserted";
        }
    else
        {
            echo "data not inserted";
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
    <form method="post">
    <label>student name :</label>
    <input type="text" name  ="sn"><br><br>
    <label>father name :</label>
    <input type="text" name ="fn"><br><br>
    <input type="submit" name ="sbtm" values ="submit">
    <button>
        
    </button>
</form>
</body>
</html>