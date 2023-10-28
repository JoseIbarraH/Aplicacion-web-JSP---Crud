<%-- 
    Document   : buscar
    Created on : 3 oct 2023, 10:16:31
    Author     : jciba
--%>
<%@page import="jose.modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (request.getSession().getAttribute("usuario.login") == null) {
        getServletContext().getRequestDispatcher("/web/usuario/login.jsp").forward(request, response);
    }
    String mensaje = request.getParameter("mensaje");
    Usuario alguien = (Usuario)request.getSession().getAttribute("usuario.buscar");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cosultar usuario</title>
    </head>
    <body>
        <center>
            <h1>Buscar Usuario</h1>
            <hr/><!-- comment -->
            <form action="/ejemplosesion/usuario/?accion=buscar&redir=buscar" method="post">
                <table>
                    <tr>
                        <th style="text-align: right">ID:</th>
                        <td><input type="text" name="id"/></td>
                    </tr>
                    <tr>
                        <th><input type="submit" value="Buscar"></th>
                        <td><input type="reset" name="Limpiar"/></td>
                    </tr>
                    <tr>
                        <th style="text-align: right">Password:</th>
                        <td style="text-align: left"><%= (alguien != null)?"*******":""%></td>
                    </tr>
                    <tr>
                        <th style="text-align: right">Nombre</th>
                        <td style="text-align: left"><%= (alguien != null)?alguien.getNombre():""%></td>
                    </tr>
                    <tr>
                        <th style="text-align: right">Apellido</th>
                        <td style="text-align: left"><%= (alguien != null)?alguien.getApellido():""%></td>
                    </tr>
                    <tr>
                        <th style="text-align: right">Email</th>
                        <td style="text-align: left"><%= (alguien != null)?alguien.getEmail():""%></td>
                    </tr>
                    <tr>
                        <th style="text-align: right">Tipo</th>
                        <td style="text-align: left">
                            <%= (alguien != null)?alguien.getTipo():""%>
                        </td>
                    </tr>
                </table>
            </form>
            <hr/>
                <p style="color:#FF0000;">
                    <%= (mensaje != null && !mensaje.isEmpty()) ? mensaje : ""%>
                </p>
                <% request.getSession().setAttribute("usuario.buscar", null);%>
        </center>
</body>
</html>
