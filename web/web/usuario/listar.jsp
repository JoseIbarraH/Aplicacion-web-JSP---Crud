<%-- 
    Document   : listar
    Created on : 3 oct 2023, 10:16:45
    Author     : jciba
--%>

<%@page import="jose.modelo.Usuario"%>
<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario listado[] = (Usuario[]) session.getAttribute("usuario.listar");
    String mensaje = null;
    if (listado == null || listado.length <= 0) {
        mensaje = "Resultado: 0 usuarios encontrados en el sistema";
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <center>
            <h1>Todos los usuarios agregados al sistema</h1>
            <%
                if (mensaje != null) {
                    out.print(mensaje);
                }else{
            %>
            <table border="1">
                <thead>
                    <tr>
                        <th>Item</th>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Email</th>
                        <th>Tipo</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int contador = 0;
                        for (Usuario alguien : listado) {
                            contador = contador + 1;
                    %>
                    <tr>
                        <td><%= contador%></td>
                        <td><%= alguien.getId()%></td>
                        <td><%= alguien.getNombre()%></td>
                        <td><%= alguien.getApellido()%></td>
                        <td><%= alguien.getEmail()%></td>
                        <td><%= alguien.getTipo()%></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <%
                }
            %>
            <hr>
            <a href="../../index.jsp"><<:: VOLVER AL MENU</a>
        </center>
    </body>
</html>
