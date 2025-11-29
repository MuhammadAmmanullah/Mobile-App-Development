<!DOCTYPE html>
<html>
<head>
    <title>View Students</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 1000px;
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
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:hover {
            background-color: #f5f5f5;
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
        <h1>Registered Students</h1>
        
        <div class="nav">
            <a href="index.php">Register Student</a>
            <a href="enroll.php">Enroll in Course</a>
            <a href="view_students.php">View Students</a>
        </div>

        <?php
        include 'db.php';
        
        $sql = "SELECT * FROM students ORDER BY registration_date DESC";
        $stmt = $conn->query($sql);
        $students = $stmt->fetchAll();
        ?>

        <table>
            <thead>
                <tr>
                    <th>Student ID</th>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Course</th>
                    <th>Registration Date</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($students as $student): ?>
                <tr>
                    <td><?php echo $student['student_id']; ?></td>
                    <td><?php echo $student['full_name']; ?></td>
                    <td><?php echo $student['email']; ?></td>
                    <td><?php echo $student['phone']; ?></td>
                    <td><?php echo $student['course'] ?: 'Not enrolled'; ?></td>
                    <td><?php echo $student['registration_date']; ?></td>
                </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</body>
</html>