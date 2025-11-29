<?php
$con = mysqli_connect("localhost", "root", "", "ammanullah-se_5-2");
if (!$con) {
    die('Connection error: ' . mysqli_connect_error());
}

mysqli_set_charset($con, 'utf8mb4');

$message = '';

// Handle Student Registration
if (isset($_POST['sbtn'])) {
    $sid = isset($_POST['sid']) ? trim($_POST['sid']) : '';
    $sn = isset($_POST['sn']) ? trim($_POST['sn']) : '';
    $ec = isset($_POST['ec']) ? trim($_POST['ec']) : '';
    $fn = isset($_POST['fn']) ? trim($_POST['fn']) : '';
    $addr = isset($_POST['addr']) ? trim($_POST['addr']) : '';
    $ph = isset($_POST['ph']) ? trim($_POST['ph']) : '';

    if ($sid === '' || $sn === '' || $ec === '' || $fn === '' || $addr === '' || $ph === '') {
        $message = 'Please fill in all student fields.';
    } else {
        $stmt = mysqli_prepare($con, "INSERT INTO studentreg4nov (sap_id, student_name, emergency_caller, father_name, address, phone) VALUES (?, ?, ?, ?, ?, ?)");
        if ($stmt) {
            mysqli_stmt_bind_param($stmt, 'ssssss', $sid, $sn, $ec, $fn, $addr, $ph);
            if (mysqli_stmt_execute($stmt)) {
                $message = 'Student registered successfully!';
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
    <title>Student Registration Form</title>
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
        <h1>Student Registration System</h1>
        
        <?php if ($message): ?>
            <div class="message <?php echo (strpos($message, 'successfully') !== false) ? 'success' : 'error'; ?>">
                <?php echo htmlspecialchars($message); ?>
            </div>
        <?php endif; ?>

        <!-- Student Registration Section -->
        <h2>Student Information</h2>
        <form method="post">
            <div class="form-group">
                <label for="sid">SAP ID</label>
                <input type="text" name="sid" id="sid" required>
            </div>
            <div class="form-group">
                <label for="sn">Student Name</label>
                <input type="text" name="sn" id="sn" required>
            </div>
            <div class="form-group">
                <label for="ec">Emergency Caller</label>
                <input type="text" name="ec" id="ec" required>
            </div>
            <div class="form-group">
                <label for="fn">Father Name</label>
                <input type="text" name="fn" id="fn" required>
            </div>
            <div class="form-group">
                <label for="addr">Address</label>
                <input type="text" name="addr" id="addr" required>
            </div>
            <div class="form-group">
                <label for="ph">Phone Number</label>
                <input type="text" name="ph" id="ph" required>
            </div>
            <button type="submit" name="sbtn">Register Student</button>
        </form>
        </div>
</body>
</html>