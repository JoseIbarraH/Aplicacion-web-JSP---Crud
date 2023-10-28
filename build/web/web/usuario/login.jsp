<%-- 
    Document   : login
    Created on : 3 oct 2023, 10:16:52
    Author     : jciba
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Login</title>
</head>
<body>
    <center>
        <form action="/ejemplo_sesion_jsp/usuario?accion=login" method="post">
            <h1>Iniciar Sesión en el Sistema</h1>
            <label>ID:</label>
            <input type="text" name="id">
            <label>Password:</label>
            <input type="password" name="password">
            <input type="submit" name="login">
        </form>
    </center>
</body>
</html>

