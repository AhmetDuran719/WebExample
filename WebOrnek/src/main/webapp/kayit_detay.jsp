<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Personel Detay Sayfası </h1>
<%
Connection conn = null;
Class.forName("com.mysql.jdbc.Driver");
String dbUrl = "jdbc:mysql://46.28.239.130:3306/ecommerce";
conn = DriverManager.getConnection(dbUrl,"ecommerce","Hercai123");
String detaySorgusu = "select * from personel where Id=?";
PreparedStatement sorgulama = conn.prepareStatement(detaySorgusu);
sorgulama.setString(1,(request.getParameter("Id")));
ResultSet detayVeri = sorgulama.executeQuery();

%>
<%
while(detayVeri.next()) {
%>	
<form method="post" action="kayit_guncelleme.jsp">
<input type="hidden" name="Id" value="<%=detayVeri.getString("Id") %>">
<table>

<tr>
<td>Adı : </td><td><input type="text" name="Adi" value="<%=detayVeri.getString("Adi") %>"></td>
</tr>
<tr>
<td>Soyadı : </td><td><input type="text" name="Soyadi" value="<%=detayVeri.getString("Soyadi") %>"></td>
</tr>
<tr>
				<td><input type="submit" name="Gönder" size="40"></td>
				<td><input type="reset" name="Sıfırla" size="40"></td>
</tr>
</table>
</form>

<%
}
detayVeri.close();
conn.close();
%>
</body>
</html>