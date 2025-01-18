<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>

<%
String email = (session.getAttribute("email") != null) ? session.getAttribute("email").toString() : null;
String product_id = request.getParameter("id");
int quantity = 1;
int product_price = 0;
int product_total = 0;
int cart_total = 0;

if (email == null) {
    response.sendRedirect("login.jsp?msg=Please login first");
    return;
}

try (Connection con = project.ConnectionProvider.getCon()) {
    // Fetch product details
    PreparedStatement psProduct = con.prepareStatement("SELECT price FROM product WHERE id = ?");
    psProduct.setString(1, product_id);
    ResultSet rsProduct = psProduct.executeQuery();

    if (rsProduct.next()) {
        product_price = rsProduct.getInt("price");
        product_total = product_price;
        System.out.println("Product Price: " + product_price);
    } else {
        response.sendRedirect("HomeTable.jsp?msg=invalidProduct");
        return;
    }

    // Check if the product already exists in the cart
    PreparedStatement psCart = con.prepareStatement("SELECT quantity, total FROM cart WHERE product_id = ? AND email = ? AND address IS NULL");
    psCart.setString(1, product_id);
    psCart.setString(2, email);
    ResultSet rsCart = psCart.executeQuery();

    if (rsCart.next()) {
        cart_total = rsCart.getInt("total") + product_total;
        quantity = rsCart.getInt("quantity") + 1;
        System.out.println("Existing Cart Total: " + rsCart.getInt("total"));
        System.out.println("Updated Cart Total: " + cart_total);

        PreparedStatement psUpdateCart = con.prepareStatement(
            "UPDATE cart SET total = ?, quantity = ? WHERE product_id = ? AND email = ? AND address IS NULL"
        );
        psUpdateCart.setInt(1, cart_total);
        psUpdateCart.setInt(2, quantity);
        psUpdateCart.setString(3, product_id);
        psUpdateCart.setString(4, email);
        psUpdateCart.executeUpdate();
        response.sendRedirect("HomeTable.jsp?msg=exist");
        return;
    }

    // Insert into cart if product does not exist
    PreparedStatement psInsertCart = con.prepareStatement(
        "INSERT INTO cart(email, product_id, quantity, price, total) VALUES(?, ?, ?, ?, ?)"
    );
    psInsertCart.setString(1, email);
    psInsertCart.setString(2, product_id);
    psInsertCart.setInt(3, quantity);
    psInsertCart.setInt(4, product_price);
    psInsertCart.setInt(5, product_total);
    System.out.println("Inserting into Cart: " + product_total);
    psInsertCart.executeUpdate();

    response.sendRedirect("HomeTable.jsp?msg=added");
} catch (Exception e) {
    e.printStackTrace();
    response.sendRedirect("HomeTable.jsp?msg=invalid");
}
%>

