<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>PERSONEL EKLEME SAYFASI</h1>
<%
	Connection conn = null;
	Class.forName("com.mysql.jdbc.Driver");
	String dbUrl = "jdbc:mysql://46.28.239.130:3306/ecommerce";
	conn = DriverManager.getConnection(dbUrl,"ecommerce","Hercai123");
	String sqlSorgu = "insert into personel(Adi,Soyadi) values(?,?)";
	PreparedStatement st = conn.prepareStatement(sqlSorgu);
	st.setString(1, request.getParameter("Adi"));
	st.setString(2, request.getParameter("Soyadi"));
	 int gelenDeger = st.executeUpdate();
	 if(gelenDeger>0){
		 out.println("kayıt eklenmiştir");
	 }
	 st.close();
	 conn.close();
	 response.sendRedirect("personel_listesi.jsp");
%>
</body>
</html>