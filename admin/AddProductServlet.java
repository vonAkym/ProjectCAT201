package admin;

import java.io.*;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import project.ConnectionProvider;

@WebServlet("/admin/AddProductServlet")
@MultipartConfig(maxFileSize = 1024 * 1024 * 5) // 5MB file size limit
public class AddProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            // Retrieve form parameters
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String category = request.getParameter("category");
            String price = request.getParameter("price");
            String active = request.getParameter("active");

            // Retrieve file part
            Part filePart = request.getPart("image");
            InputStream inputStream = null;

            if (filePart != null) {
                inputStream = filePart.getInputStream();
            }

            // Save product data in the database
            Connection con = ConnectionProvider.getCon();
            PreparedStatement ps = con.prepareStatement("INSERT INTO product (id, name, category, price, active, image) VALUES (?, ?, ?, ?, ?, ?)");
            ps.setString(1, id);
            ps.setString(2, name);
            ps.setString(3, category);
            ps.setString(4, price);
            ps.setString(5, active);
            ps.setBlob(6, inputStream);
            ps.executeUpdate();

            // Redirect with success message
            response.sendRedirect("addNewProduct.jsp?msg=done");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("addNewProduct.jsp?msg=wrong");
        }
    }
}
