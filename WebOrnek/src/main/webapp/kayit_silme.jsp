<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%Connection conn = null;


Class.forName("com.mysql.jdbc.Driver").newInstance();
String dbUrl = "jdbc:mysql://46.28.239.130/ecommerce";%>
<%
String gelenId = request.getParameter("Id");

if (gelenId != null) {
Connection con = null;
PreparedStatement ps = null;
try {
	conn = DriverManager.getConnection(dbUrl, "ecommerce", "Hercai123");
	java.sql.Statement sorgulama = conn.createStatement();
String sql = "DELETE from personel where Id=?";
ps = conn.prepareStatement(sql);
 
ps.setString(1, gelenId);
int i = ps.executeUpdate();
if (i > 0) {
out.print("silindi");
sorgulama.close();
conn.close();
response.sendRedirect("personel_listesi.jsp");
} else {
out.print("Hata! ");
}
} catch (SQLException sql) {
request.setAttribute("error", sql);
out.println(sql);
}
}
%>
