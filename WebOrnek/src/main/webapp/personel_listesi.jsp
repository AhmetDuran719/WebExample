<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-9" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Connection conn = null;
Class.forName("com.mysql.jdbc.Driver");
String dbUrl = "jdbc:mysql://46.28.239.130:3306/ecommerce";
conn = DriverManager.getConnection(dbUrl,"ecommerce","Hercai123");
Statement sorgulama = conn.createStatement();
ResultSet sonucVeriler = sorgulama.executeQuery("select * from personel");
out.println("veritabanýn baðlanýldý");
%>

<table border="1">
<tr bgcolor="cccccc">
<td width="100">Id</td>
<td width="100">Adi</td>
<td width="100">Soyadi</td>
<td width="100">Resim</td>
<td width="100">Detay</td>

</tr>

<%
int modul=1;
String fonRengi;
while(sonucVeriler.next()) {
	if((modul%2)==1) fonRengi="#cccccc";
	else fonRengi="#dddddd";

%>
	<tr bgcolor="<%=fonRengi%>">
		<td><%=sonucVeriler.getString("Id")%></td>
		<td><%=sonucVeriler.getString("Adi")%></td>
		<td><%=sonucVeriler.getString("Soyadi")%></td>
		<td><img src="http://www.opendart.com/movie1.jpg" width="50px" height="50px" /></td>
		<td><a href="kayit_detay.jsp?Id=<%=sonucVeriler.getString("Id")%>">Detay</a></td>
	</tr>
<%
modul++;
}
sonucVeriler.close();
conn.close();
%>
</table>
<a href="kayit_ekleme.html">personel ekle</a><br>
<a href="personel_silme.html">personel silme</a>
</body>
</html>