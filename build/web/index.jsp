<%-- 
    Document   : index
    Created on : 5 oct 2023, 17:31:23
    Author     : jciba
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (request.getSession().getAttribute("usuario.login") == null) {
        getServletContext().getRequestDispatcher("/web/usuario/login.jsp").forward(request, response);
    }
%>
<html>
    <head>
        <title>Menu de la Aplicacion</title>
        <meta name="Content-type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <center>
            <<h2>Menu de la aplicacion</h2>
        <table border="0">
            <tbody>
                <tr>
                    <th><h1><a href="web/usuario/agregar.jsp">Agregar</a></h1></th>
                </tr>
                <tr>
                    <th><h1><a href="web/usuario/buscar.jsp">Buscar</a></h1></th>
                </tr>
                <tr>
                    <th><h1><a href="web/usuario/modificar.jsp">Modificar</a></h1></th>
                </tr>
                <tr>
                    <th><h1><a href="web/usuario/eliminar.jsp">Eliminar</a></h1></th>
                </tr>
                <tr>
                    <th><h1><a href="usuario?accion=listartodo">Listar</a></h1></th>
                </tr>
                <tr>
                    <th><h1><a href="ejemplosesion/usuario?accion=logout">salir</a></h1></th>
                </tr>
            </tbody>
        </table>
    </center>
    </body>
</html>
