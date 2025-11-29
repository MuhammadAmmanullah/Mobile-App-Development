<!DOCTYPE html>
<html>
<head>
    <title>Student Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input, select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }
        button {
            background: #007bff;
            color: white;
            padding: 12px 30px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
        }
        button:hover {
            background: #0056b3;
        }
        .message {
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            text-align: center;
        }
        .success {
            background: #d4edda;
            color: #155724;
        }
        .error {
            background: #f8d7da;
            color: #721c24;
        }
        .nav {
            text-align: center;
            margin: 20px 0;
        }
        .nav a {
            text-decoration: none;
            color: #007bff;
            margin: 0 10px;
            padding: 10px 20px;
            border: 1px solid #007bff;
            border-radius: 5px;
        }
        .nav a:hover {
            background: #007bff;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Student Registration System</h1>
        
        <div class="nav">
            <a href="index.php">Register Student</a>
            <a href="enroll.php">Enroll in Course</a>
            <a href="view_students.php">View Students</a>
        </div>

        <?php
        include 'db.php';
        
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $student_id = $_POST['student_id'];
            $full_name = $_POST['full_name'];
            $email = $_POST['email'];
            $phone = $_POST['phone'];
            
            try {
                $sql = "INSERT INTO students (student_id, full_name, email, phone) VALUES (?, ?, ?, ?)";
                $stmt = $conn->prepare($sql);
                $stmt->execute([$student_id, $full_name, $email, $phone]);
                
                echo '<div class="message success">Student registered successfully!</div>';
            } catch(PDOException $e) {
                echo '<div class="message error">Error: Student ID or Email already exists!</div>';
            }
        }
        ?>

        <form method="POST" action="">
            <div class="form-group">
                <label>Student ID:</label>
                <input type="text" name="student_id" required>
            </div>
            
            <div class="form-group">
                <label>Full Name:</label>
                <input type="text" name="full_name" required>
            </div>
            
            <div class="form-group">
                <label>Email:</label>
                <input type="email" name="email" required>
            </div>
            
            <div class="form-group">
                <label>Phone:</label>
                <input type="text" name="phone" required>
            </div>
            
            <button type="submit">Register Student</button>
        </form>
    </div>
</body>
</html>