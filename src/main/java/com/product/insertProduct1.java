package com.product;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.db.ConnectionProvider;

@WebServlet("/insertProduct")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class insertProduct1 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public insertProduct1() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data
        String sku = request.getParameter("sku");
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String inventory = request.getParameter("inventory");

        // Get current date
        java.sql.Date currentDate = new java.sql.Date(System.currentTimeMillis());

        // Retrieve the image file
        Part imagePart = request.getPart("image");
        InputStream imageFileStream = imagePart.getInputStream();

        try {
            // Log form data
            System.out.println("SKU: " + sku);
            System.out.println("Name: " + name);
            System.out.println("Price: " + price);
            System.out.println("Inventory: " + inventory);
            System.out.println("Date: " + currentDate);
            System.out.println("Image File Size: " + imagePart.getSize() + " bytes");

            if (imagePart != null && imagePart.getSize() > 0) {
                try {
                    Connection con = ConnectionProvider.getCon();
                    String sql = "INSERT INTO products (sku, image, name, price, inventory, date) VALUES (?, ?, ?, ?, ?, ?)";
                    PreparedStatement ps = con.prepareStatement(sql);
                    ps.setString(1, sku);
                    ps.setBinaryStream(2, imageFileStream, imagePart.getSize());
                    ps.setString(3, name);
                    ps.setDouble(4, Double.parseDouble(price));
                    ps.setInt(5, Integer.parseInt(inventory));
                    ps.setDate(6, currentDate);

                    int rows = ps.executeUpdate();
                    if (rows > 0) {
                        response.getWriter().println("Product created successfully!");
                        response.sendRedirect("dashboard.jsp");
                    } else {
                        response.getWriter().println("Failed to create the product.");
                    }

                    ps.close();
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                    response.getWriter().println("Database Error: " + e.getMessage());
                }
            } else {
                response.getWriter().println("No image uploaded!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
