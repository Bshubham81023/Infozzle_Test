package com.product;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/getImage")
public class getImage extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
System.out.println("id"+id);
        try {
            // Database connection
        	Connection conn = com.db.ConnectionProvider.getCon();

            // Query to fetch image
            String query = "SELECT image FROM products WHERE id=?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                byte[] imageData = rs.getBytes("image");
                System.out.println(imageData);
                // Set response content type
                response.setContentType("image/jpeg"); // Change based on the stored image type
                
                // Write image data to response
                OutputStream out = response.getOutputStream();
                out.write(imageData);
                out.close();
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
