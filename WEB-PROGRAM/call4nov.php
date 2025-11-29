<?php
$con = mysqli_connect("localhost", "root", "", "ammanullah-se_5-2");
if (!$con) {
    die('Connection error: ' . mysqli_connect_error());
}

mysqli_set_charset($con, 'utf8mb4');

$message = '';
$allocations = [];

// Fetch all students
$students = [];
$qu = 'SELECT sap_id, student_name FROM studentreg4nov';
$re = mysqli_query($con, $qu);
if ($re) {
    while ($data = mysqli_fetch_assoc($re)) {
        $students[] = $data;
    }
    mysqli_free_result($re);
}

// Fetch all courses
$courses = [];
$qu = 'SELECT course_id, course_name, course_code FROM coursereg4nov';
$re = mysqli_query($con, $qu);
if ($re) {
    while ($data = mysqli_fetch_assoc($re)) {
        $courses[] = $data;
    }
    mysqli_free_result($re);
}

// Handle course allocation
if (isset($_POST['allocate_btn'])) {
    $sid = isset($_POST['student_id']) ? trim($_POST['student_id']) : '';
    $cid = isset($_POST['course_id']) ? trim($_POST['course_id']) : '';

    if ($sid === '' || $cid === '') {
        $message = 'Please select both student and course.';
    } else {
        // Check if allocation already exists
        $check_stmt = mysqli_prepare($con, "SELECT * FROM course_allocation WHERE sap_id = ? AND course_id = ?");
        if ($check_stmt) {
            mysqli_stmt_bind_param($check_stmt, 'ss', $sid, $cid);
            mysqli_stmt_execute($check_stmt);
            $check_result = mysqli_stmt_get_result($check_stmt);
            
            if (mysqli_num_rows($check_result) > 0) {
                $message = 'This student is already allocated to this course.';
            } else {
                // Insert new allocation
                $stmt = mysqli_prepare($con, "INSERT INTO course_allocation (sap_id, course_id, allocated_date) VALUES (?, ?, NOW())");
                if ($stmt) {
                    mysqli_stmt_bind_param($stmt, 'ss', $sid, $cid);
                    if (mysqli_stmt_execute($stmt)) {
                        $message = 'Course allocated successfully!';
                    } else {
                        $message = 'Error: ' . mysqli_stmt_error($stmt);
                    }
                    mysqli_stmt_close($stmt);
                } else {
                    $message = 'Prepare error: ' . mysqli_error($con);
                }
            }
            mysqli_stmt_close($check_stmt);
        }
    }
}

// Fetch all allocations
$qu = 'SELECT ca.allocation_id, s.sap_id, s.student_name, c.course_name, c.course_code, ca.allocated_date 
        FROM course_allocation ca
        JOIN studentreg4nov s ON ca.sap_id = s.sap_id
        JOIN coursereg4nov c ON ca.course_id = c.course_id
        ORDER BY ca.allocated_date DESC';
$re = mysqli_query($con, $qu);
if ($re) {
    while ($data = mysqli_fetch_assoc($re)) {
        $allocations[] = $data;
    }
    mysqli_free_result($re);
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Allocation</title>
    <style>
        body {
            background: linear-gradient(120deg, #4f8cff 0%, #6ee7b7 100%);
            font-family: 'Segoe UI', Arial, sans-serif;
            padding: 16px;
        }
        .container {
            max-width: 900px;
            margin: 32px auto;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 24px rgba(0,0,0,0.07);
            padding: 32px;
        }
        h1 {
            color: #2563eb;
            text-align: center;
            margin-bottom: 24px;
        }
        h2 {
            color: #4f8cff;
            margin-top: 24px;
            margin-bottom: 16px;
            border-bottom: 2px solid #4f8cff;
            padding-bottom: 8px;
        }
        .form-group {
            margin-bottom: 16px;
        }
        label {
            display: block;
            margin-bottom: 6px;
            color: #222;
            font-weight: 500;
        }
        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 14px;
            box-sizing: border-box;
        }
        select:focus {
            border-color: #4f8cff;
            outline: none;
            box-shadow: 0 0 4px rgba(79, 140, 255, 0.3);
        }
        button {
            width: 100%;
            padding: 12px;
            background: #4f8cff;
            color: #fff;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            margin-top: 12px;
            transition: background 0.2s;
        }
        button:hover {
            background: #2563eb;
        }
        .message {
            margin-top: 16px;
            padding: 12px;
            border-radius: 6px;
            text-align: center;
            font-weight: 500;
        }
        .message.success {
            background: #d4edda;
            color: #155724;
        }
        .message.error {
            background: #f8d7da;
            color: #721c24;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 24px;
        }
        table th, table td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }
        table th {
            background: #4f8cff;
            color: #fff;
        }
        table tr:hover {
            background: #f4f6fb;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Course Allocation</h1>

        <?php if ($message): ?>
            <div class="message <?php echo (strpos($message, 'successfully') !== false) ? 'success' : 'error'; ?>">
                <?php echo htmlspecialchars($message); ?>
            </div>
        <?php endif; ?>

        <h2>Allocate Course to Student</h2>
        <form method="post">
            <div class="form-group">
                <label for="student_id">Select Student</label>
                <select name="student_id" id="student_id" required>
                    <option value="">-- Choose a Student --</option>
                    <?php if (!empty($students)): ?>
                        <?php foreach ($students as $student): ?>
                            <option value="<?php echo htmlspecialchars($student['sap_id']); ?>">
                                <?php echo htmlspecialchars($student['student_name']) . ' (' . htmlspecialchars($student['sap_id']) . ')'; ?>
                            </option>
                        <?php endforeach; ?>
                    <?php else: ?>
                        <option value="">No students available</option>
                    <?php endif; ?>
                </select>
            </div>

            <div class="form-group">
                <label for="course_id">Select Course</label>
                <select name="course_id" id="course_id" required>
                    <option value="">-- Choose a Course --</option>
                    <?php if (!empty($courses)): ?>
                        <?php foreach ($courses as $course): ?>
                            <option value="<?php echo htmlspecialchars($course['course_id']); ?>">
                                <?php echo htmlspecialchars($course['course_name']) . ' (' . htmlspecialchars($course['course_code']) . ')'; ?>
                            </option>
                        <?php endforeach; ?>
                    <?php else: ?>
                        <option value="">No courses available</option>
                    <?php endif; ?>
                </select>
            </div>

            <button type="submit" name="allocate_btn">Allocate Course</button>
        </form>

        <!-- Display Allocations Table -->
        <h2>Allocated Courses</h2>
        <?php if (!empty($allocations)): ?>
            <table>
                <thead>
                    <tr>
                        <th>SAP ID</th>
                        <th>Student Name</th>
                        <th>Course Name</th>
                        <th>Course Code</th>
                        <th>Allocated Date</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($allocations as $alloc): ?>
                        <tr>
                            <td><?php echo htmlspecialchars($alloc['sap_id']); ?></td>
                            <td><?php echo htmlspecialchars($alloc['student_name']); ?></td>
                            <td><?php echo htmlspecialchars($alloc['course_name']); ?></td>
                            <td><?php echo htmlspecialchars($alloc['course_code']); ?></td>
                            <td><?php echo htmlspecialchars($alloc['allocated_date']); ?></td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        <?php else: ?>
            <p style="text-align:center; color:#888; margin-top:24px;">No allocations yet.</p>
        <?php endif; ?>
    </div>
</body>
</html>