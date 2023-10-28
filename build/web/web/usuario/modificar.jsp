<%-- 
    Document   : modificar
    Created on : 3 oct 2023, 10:17:02
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
        <title>Modificar usuario</title>
    </head>
    <body>
    <center>
        <h1>Modificar Usuario</h1>
        <hr/>
        <form action ="/ejemplosesion/usuario?accion=buscar&redir=modificar" method="post">
            <table>
                <tr>
                    <th style="text-align: right">ID:</th>
                    <td><input type="text" name="id"/></th>
                </tr>
                <tr>
                    <th><input type="submit" value="Buscar"></th>
                    <td><input type="reset" name="Limpiar"/></td>
                </tr>              
            </table>
        </form>
        <hr/>
        <%
            if (alguien != null) {
        %>
        <form action="/ejemplosesion/usuario?accion=modificar"  method="post">
            <table>
                <tr>
                    <th style="text-align: right">ID:</th>
                    <td><input" type="text" name="id" value="<%= (alguien != null) ? alguien.getId() : ""%>" readonly="readonly"></td>
                </tr>
                <tr>
                    <th style="text-align: right">Password:</th>
                    <td><input" type="text" name="id" value="<%= (alguien != null) ? alguien.getPassword(): ""%>" readonly="readonly"></td>
                </tr>
                <tr>
                    <th style="text-align: right">Nombre:</th>
                    <td><input" type="text" name="id" value="<%= (alguien != null) ? alguien.getNombre() : ""%>" readonly="readonly"></td>
                </tr>
                <tr>
                    <th style="text-align: right">Apellido:</th>
                    <td><input" type="text" name="id" value="<%= (alguien != null) ? alguien.getApellido() : ""%>" readonly="readonly"></td>
                </tr>
                <tr>
                    <th style="text-align: right">Email:</th>
                    <td><input" type="text" name="id" value="<%= (alguien != null) ? alguien.getEmail() : ""%>" readonly="readonly"></td>
                </tr>
                <tr>
                    <th>
                        <select name="tipo">
                            <option value="Administrador"
                                    <%=(alguien != null && alguien.getTipo().equals("Administrador")) ? "selected" : ""%> >Administrador</option>
                            <option value="Cliente"
                                    <%=(alguien != null && alguien.getTipo().equals("Cliente")) ? "selected" : ""%> >Cliente</option>
                        </select>
                    </th>
                </tr>
                <tr>
                    <th><input type="submit" value="Modificar"></th>
                    <td><input type="reset" name="Limpiar"/></td>
                </tr>
            </table>
        </form>
        <hr/>
        <%
            }
        %>
        <p style="color:#FF0000;">
            <%= (mensaje != null && !mensaje.isEmpty()) ? mensaje : ""%>
        </p>
        <% request.getSession().setAttribute("usuario.buscar", null);%>
    </center>
    </body>
</html>
