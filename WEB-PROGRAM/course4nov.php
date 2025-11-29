<?php
$con = mysqli_connect("localhost", "root", "", "ammanullah-se_5-2");
if (!$con) {
    die('Connection error: ' . mysqli_connect_error());
}

mysqli_set_charset($con, 'utf8mb4');

$message = '';

// Handle Course Registration
if (isset($_POST['cbtn'])) {
    $sid_course = isset($_POST['sid_course']) ? trim($_POST['sid_course']) : '';
    $cn = isset($_POST['cn']) ? trim($_POST['cn']) : '';
    $cc = isset($_POST['cc']) ? trim($_POST['cc']) : '';
    $rc = isset($_POST['rc']) ? trim($_POST['rc']) : '';

    if ($sid_course === '' || $cn === '' || $cc === '' || $rc === '') {
        $message = 'Please fill in all course fields.';
    } else {
        $stmt = mysqli_prepare($con, "INSERT INTO coursereg4nov (sap_id, course_name, course_code, registered_course) VALUES (?, ?, ?, ?)");
        if ($stmt) {
            mysqli_stmt_bind_param($stmt, 'ssss', $sid_course, $cn, $cc, $rc);
            if (mysqli_stmt_execute($stmt)) {
                $message = 'Course registered successfully!';
            } else {
                $message = 'Error: ' . mysqli_stmt_error($stmt);
            }
            mysqli_stmt_close($stmt);
        } else {
            $message = 'Prepare error: ' . mysqli_error($con);
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Registration Form</title>
    <style>
        body {
            background: linear-gradient(120deg, #4f8cff 0%, #6ee7b7 100%);
            font-family: 'Segoe UI', Arial, sans-serif;
            padding: 16px;
        }
        .container {
            max-width: 600px;
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
        .form-group {
            margin-bottom: 16px;
        }
        label {
            display: block;
            margin-bottom: 6px;
            color: #222;
            font-weight: 500;
        }
        input, select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 14px;
            box-sizing: border-box;
        }
        input:focus, select:focus {
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
    </style>
</head>
<body>
    <div class="container">
        <h1>Course Registration Form</h1>
        
        <?php if ($message): ?>
            <div class="message <?php echo (strpos($message, 'successfully') !== false) ? 'success' : 'error'; ?>">
                <?php echo htmlspecialchars($message); ?>
            </div>
        <?php endif; ?>

        <form method="post">
            <div class="form-group">
                <label for="sid_course">SAP ID (Link to Student)</label>
                <input type="text" name="sid_course" id="sid_course" required>
            </div>
            <div class="form-group">
                <label for="cn">Course Name</label>
                <input type="text" name="cn" id="cn" required>
            </div>
            <div class="form-group">
                <label for="cc">Course Code</label>
                <input type="text" name="cc" id="cc" required>
            </div>
            <div class="form-group">
                <label for="rc">Registered Course</label>
                <select name="rc" id="rc" required>
                    <option value="">Select Status</option>
                    <option value="Yes">Yes</option>
                    <option value="No">No</option>
                    <option value="Pending">Pending</option>
                </select>
            </div>
            <button type="submit" name="cbtn">Register Course</button>
        </form>
    </div>
</body>
</html>