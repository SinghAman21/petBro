package com.pet.pet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "AddPet", urlPatterns = {"/addPet"})
@MultipartConfig
public class AddPet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("addPet.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve parameters from the request
        String name = request.getParameter("name");
        String breed = request.getParameter("breed");
        String animalType = request.getParameter("animal_type");
        String ageStr = request.getParameter("age");
        String gender = request.getParameter("gender");
        String dateOfBirth = request.getParameter("date_of_birth");
        String vaccinationStatus = request.getParameter("vaccination_status");
        String medicalConditions = request.getParameter("medical_conditions");
        String sizeOrWeight = request.getParameter("size_or_weight");
        String personality = request.getParameter("personality");
        String favoriteFood = request.getParameter("favorite_food");

        // File upload handling for profile picture
        Part profilePicturePart = request.getPart("profile_picture");
        String fileName = Paths.get(profilePicturePart.getSubmittedFileName()).getFileName().toString(); // Get file name
        InputStream profilePictureInputStream = profilePicturePart.getInputStream(); // Get file content as input stream

        // Validate the required parameters
        if (name == null || name.trim().isEmpty() ||
                breed == null || breed.trim().isEmpty() ||
                animalType == null || animalType.trim().isEmpty() ||
                ageStr == null || ageStr.trim().isEmpty() ||
                gender == null || gender.trim().isEmpty() ||
                dateOfBirth == null || dateOfBirth.trim().isEmpty() ||
                vaccinationStatus == null || vaccinationStatus.trim().isEmpty() ||
                sizeOrWeight == null || sizeOrWeight.trim().isEmpty()) {

            request.setAttribute("errorMessage", "Please fill in all required fields.");
            request.getRequestDispatcher("addPetForm.jsp").forward(request, response);
            return;
        }

        int age = Integer.parseInt(ageStr); // Parse age as an integer

        // Insert into database
        String sql = "INSERT INTO pets (name, breed, animal_type, age, gender, date_of_birth, vaccination_status, medical_conditions, size_or_weight, personality, favorite_food, profile_picture) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseUtils.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, name);
            stmt.setString(2, breed);
            stmt.setString(3, animalType);

            stmt.setInt(4, age);
            stmt.setString(5, gender);
            stmt.setString(6, dateOfBirth);
            stmt.setString(7, vaccinationStatus);
            stmt.setString(8, medicalConditions != null ? medicalConditions : "");
            stmt.setString(9, sizeOrWeight);
            stmt.setString(10, personality != null ? personality : "");
            stmt.setString(11, favoriteFood != null ? favoriteFood : "");
            stmt.setBlob(12, profilePictureInputStream);

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                response.sendRedirect("family");

            } else {
                request.setAttribute("errorMessage", "Error adding pet, please try again.");
                request.getRequestDispatcher("addPetForm.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            throw new ServletException("Database error", e);
        }
    }
}

