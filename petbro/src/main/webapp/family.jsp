<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pet Family</title>
    <!-- Tailwind CSS CDN -->
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
            padding: 1.5rem;
            background: #000;
        }

        .border-one {
            border: 0.1px solid #ffffff20;
        }

        .mid {
            border-radius: 32px;
            font-weight: 500;
            background: #ffffff20;
        }

        .mid a {
            color: #fff;
            text-decoration: none;
            padding: 0.8em 1.2em;
            border-radius: 32px;
            width: 7rem;
            text-align: center;
            transition: color 0.3s ease;
        }

        .mid a.active {
            background: #ffffff;
            color: black;
            font-weight: bold;
        }

        .container {
            padding: 2rem;
        }

        .pet-cards {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 2rem;
            justify-items: center;
        }

        .pet-card {
            background: #222;
            border: 1px solid #444;
            border-radius: 15px;
            padding: 1.5rem;
            max-width: 400px;
            width: 100%;
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .pet-card:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }

        .pet-image {
            max-width: 100%;
            border-radius: 10px;
            margin-bottom: 1rem;
            object-fit: cover;
        }

        .pet-info {
            text-align: left;
            margin-top: 1rem;
        }

        .pet-info p {
            margin: 0.5rem 0;
        }

        .pet-name {
            font-size: 1.75rem;
            font-weight: 700;
            color: #fff;
        }

        .cancel-btn {
            padding: 0.8rem 1.6rem;
            border-radius: 32px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s ease;
            background: crimson;
            color: #fff;
        }

        .cancel-btn:hover {
            background: #ff3333;
        }
    </style>
</head>
<body>
<header class="sticky top-0 z-50">
    <div class="left">
        <h1 class="text-2xl font-bold">PetBro</h1>
    </div>
    <div class="mid flex gap-4">
        <a href="/pet_war">Overview</a>
        <a href="${pageContext.request.contextPath}/family" class="active">Family</a>
        <a href="${pageContext.request.contextPath}/events" >Sessions</a>
        <a href="#">More</a>
    </div>
    <div class="right">
        <button class="bg-[crimson] hover:bg-[crimson]/50 text-black font-bold py-2 px-4 rounded-lg"
                onclick="location.href='/pet_war/addPet'">Add Member
        </button>
    </div>
</header>

<div class="container">
    <div class="pet-cards">
        <%
            // Database connection parameters
            String jdbcURL = "jdbc:mysql://localhost:3306/pet_management";
            String dbUser = "root";
            String dbPassword = "root";

            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;

            try {
                // Establish the database connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
                statement = connection.createStatement();

                // Execute the query to retrieve pet data
                String sql = "SELECT * FROM pets"; // Adjust the column names if needed
                resultSet = statement.executeQuery(sql);

                // Loop through the result set and create cards for each pet
                while (resultSet.next()) {
                    String name = resultSet.getString("name");
                    String breed = resultSet.getString("breed");
                    String animalType = resultSet.getString("animal_type");
                    int age = resultSet.getInt("age");
                    String gender = resultSet.getString("gender");
                    String dateOfBirth = resultSet.getString("date_of_birth");
                    String vaccinationStatus = resultSet.getString("vaccination_status");
                    String medicalConditions = resultSet.getString("medical_conditions");
                    String sizeOrWeight = resultSet.getString("size_or_weight");
                    String personality = resultSet.getString("personality");
                    String favoriteFood = resultSet.getString("favorite_food");
                    String profilePicture = resultSet.getString("profile_picture");  // Assuming it's a URL or file path
        %>

        <div class="pet-card">
            <h2 class="pet-name"><%= name %></h2>
            <div class="pet-info">
                <p><strong>Breed:</strong> <%= breed %></p>
                <p><strong>Type:</strong> <%= animalType %></p>
                <p><strong>Age:</strong> <%= age %> years</p>
                <p><strong>Gender:</strong> <%= gender %></p>
                <p><strong>Date of Birth:</strong> <%= dateOfBirth %></p>
                <p><strong>Vaccination Status:</strong> <%= vaccinationStatus %></p>
                <p><strong>Medical Conditions:</strong> <%= medicalConditions %></p>
                <p><strong>Size/Weight:</strong> <%= sizeOrWeight %></p>
                <p><strong>Personality:</strong> <%= personality %></p>
                <p><strong>Favorite Food:</strong> <%= favoriteFood %></p>
            </div>
        </div>

        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                // Close the resources
                try {
                    if (resultSet != null) resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                try {
                    if (statement != null) statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                try {
                    if (connection != null) connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
    </div>
</div>

</body>
</html>
