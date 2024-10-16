<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Pet Form</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://api.fontshare.com/v2/css?f[]=satoshi@1&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;

            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Satoshi', sans-serif;
            background: #000;
            color: #eee;
            width: 100%;
            min-height: 100vh;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 1.5rem;
            background: #000;
        }

        .border-one {
            border: 0.1px solid #ffffff20;
        }

        .form-container {
            display: flex;
            flex-direction: column;
            gap: 2rem;
            padding: 2rem;
        }

        .form-section {
            padding: 2rem;
            background: #ffffff05;
            border: 1px solid #ffffff10;
            border-radius: 20px;
        }

        .form-section h2 {
            font-size: 1.75rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
        }

        label {
            display: block;
            font-size: 1rem;
            font-weight: 500;
            margin-bottom: 0.8rem;
        }

        input, select, textarea {
            width: 100%;
            padding: 12px !important;
            margin-bottom: 1.2rem !important;
            border-radius: 8px;
            border: 0.1px solid #ffffff05 !important;
            background: #ffffff0a;
            color: #fff;
            font-size: 1rem;
        }

        .submit-btn, .cancel-btn {
            padding: 0.8rem 1.6rem;
            border-radius: 32px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s ease;
            text-align: center;
        }

        .submit-btn {
            background: #00ff88;
            color: #000;
        }

        .cancel-btn {
            background: crimson;
            color: #000;
        }

        .submit-btn:hover {
            background: #00cc6e;
        }
    </style>
</head>
<body>
<header class="border-one flex flex-row items-center justify-between">
    <a href="/pet_war/family" class="cancel-btn">Cancel</a>
    <h1 class="text-3xl font-bold">Add a New Member</h1>
</header>

<div class="form-container">
    <form action="addPet" method="POST" enctype="multipart/form-data">
        <div class="form-section">
            <h2>Pet Information</h2>
            <label for="name">Pet Name</label>
            <input type="text" id="name" name="name" required>

            <label for="breed">Breed</label>
            <input type="text" id="breed" name="breed" required>

            <label for="animal_type">Animal Type</label>
            <input type="text" id="animal_type" name="animal_type" required>

            <label for="age">Age</label>
            <input type="number" id="age" name="age" required>

            <label for="gender">Gender</label>
            <select id="gender" name="gender" required>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
            </select>

            <label for="date_of_birth">Date of Birth</label>
            <input type="date" id="date_of_birth" name="date_of_birth" required>

            <label for="vaccination_status">Vaccination Status</label>
            <select id="vaccination_status" name="vaccination_status" required>
                <option value="Up to date">Up to date</option>
                <option value="Not up to date">Not up to date</option>
            </select>

            <label for="medical_conditions">Medical Conditions</label>
            <textarea id="medical_conditions" name="medical_conditions" rows="3"></textarea>

            <label for="size_or_weight">Size/Weight</label>
            <input type="text" id="size_or_weight" name="size_or_weight" required>

            <label for="personality">Personality</label>
            <input type="text" id="personality" name="personality">

            <label for="favorite_food">Favorite Food</label>
            <input type="text" id="favorite_food" name="favorite_food">

            <label for="profile_picture">Profile Picture</label>
            <input type="file" id="profile_picture" name="profile_picture" accept="image/*">
            <button type="submit" class="submit-btn w-64">Submit</button>

        </div>

    </form>
</div>
</body>
</html>
