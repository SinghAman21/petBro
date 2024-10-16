<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pet Management Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://api.fontshare.com/v2/css?f[]=satoshi@1&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Satoshi', sans-serif;
            background-color: #121212;
            color: #ddd;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-box {
            background-color: #1E1E1E;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.7);
            width: 100%;
            max-width: 420px;
            text-align: center;
            transition: all 0.3s ease;
        }

        .login-box:hover {
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.8);
        }

        h2 {
            color: #ffffff;
            margin-bottom: 20px;
            font-size: 28px;
            font-weight: bold;
        }

        label {
            color: #bbb;
            display: block;
            margin-bottom: 10px;
            text-align: left;
            font-size: 14px;
        }

        input[type="text"], input[type="password"] {
            background-color: #333;
            border: 1px solid #444;
            color: #ddd;
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 8px;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        input[type="text"]:focus, input[type="password"]:focus {
            background-color: #444;
            outline: none;
            border: 1px solid #007BFF;
        }

        button {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s, transform 0.2s ease-in-out;
        }

        button:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        .error {
            color: #ff6b6b;
            margin-top: 15px;
            font-size: 14px;
        }
    </style>
</head>
<body>

<div class="login-box">
    <h2 class="text-2xl font-semibold">Login</h2>
    <form action="login" method="POST">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" placeholder="Enter your username" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" placeholder="Enter your password" required>

        <button type="submit" class="px-4 py-2 bg-cyan-900">Login</button>
    </form>

    <!-- Display error message if login fails -->
    <%
        String error = request.getParameter("error");
        if (error != null && error.equals("1")) {
    %>
    <p class="error">Invalid username or password!</p>
    <% } %>
</div>

</body>
</html>
