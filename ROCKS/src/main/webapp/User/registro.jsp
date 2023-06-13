<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="co.edu.sena.rocks.repository.UserRepositoryImpl"%>
<%@page import="co.edu.sena.rocks.bean.User"%>
<%@page import="co.edu.sena.rocks.repository.Repository"%>



<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8"></meta>
    <!--author-->
    <meta name="author" content="Juan-Santiago"></meta>
    <!--descripcion-->
    <meta name="description" content="Pagina basada en el registro .">
    </meta>
    <!--keywords-->
    <meta name="keywords" content="Registro de usuario, Crear cuenta, Registro exitoso, Error de registro">
    </meta>
    <!--minium responsive viewport-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    </meta>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </meta>
</head>
<!--TITLE-->
<title>Registro de Usuario </title>
<!--FAVICON-->
<link rel="icon" type="image/x-icon" href="./css/img/registro1.png">

</link>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
      crossorigin="anonymous">

</link>
<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/boostrap-icons@1.10.3/font/bootstrap-icons-css">

</link>
<!--custom css-->
<link rel="stylesheet" href="css/signin.css">

</link>
<body>
<div class="container">
    <header></header>
    <nav></nav>
    <section>
        <form method="POST" action="RegisterProduct" >
            <h3>Productos</h3>
            <%
                User uss = new User();
                if (session.getAttribute("datos") != null) {
                    uss = (User) session.getAttribute("datos");

                }
            %>
            <label for="nombre">Nombre</label><br>
            <input value="<%=uss.getNombre() != null ? uss.getNombre() : ""%>" class="form-control" type="text" id="nombre" name="nombre" placeholder="Ingrese nombre" required autofocus><br>

            <label for="Descripcion">Descripcion</label><br>
            <input value="<%=uss.getDescripcion() != null ? uss.getDescripcion() : ""%>" type="text" id="descripcion" name="descripcion" class="form-control" placeholder="Ingrese descripcion" required autofocus
                   ><br>

            <label for="Precio">Precio</label><br>
            <input value="<%=uss.getPrecio() != null ? uss.getPrecio() : ""%>" type="text" id="precio" name="precio" class="form-control" placeholder="Ingrese precio" required autofocus
                   ><br><br>

            <label for="cantidad">cantidad</label><br>
            <input value="<%=uss.getCantidad() != null ? uss.getCantidad() : ""%>" type="text" id="cantidad" name="cantidad" class="form-control" placeholder="Ingrese cantidad" required autofocus
                   ><br><br>





            <%
                if (session.getAttribute("datos") != null) {
            %>
            <button type="submit" class="btn btn-warning">Modificar</button>
            <%} else {%>
            <button type="submit" class="btn btn-success">Guardar</button>
            <%}%>
            <input type="hidden" name="id" id="id" value="<%=User.getId() != null && User.getId() > 0 ? User.getId() : "0"%>">
            <input type="hidden" name="opcion" value="modificardatos">
        </form>
        <table class="table">
            <thead>
            <tr>
                <th>
                </th>
                <th>Nombre</th>
                <th>Precio</th>
                <th>Descipcion</th>
                <th>Cantidad</th>
                <th>Eliminar</th>
            </tr>
            </thead>
            <tbody>
            <%    Repository<User> repository = new UserRepositoryImpl();
                try {
                    List<User> users = repository.listAllObj();
                    for (User user : users) {


            %>
            <tr>
                <td><form action="/rockstar/User" method="post">
                    <button  class="btn btn-primary">Abrir</button>
                    <input type="hidden" name="id"  value="<%=user.getId()%>">
                    <input type="hidden" name="opcion" value="abrirdatos">
                </form>
                </td>
                <td><%=uss.getNombre()%></td>
                <td><%=uss.getPrecio()%></td>
                <td><%=uss.getDescripcion()%></td>
                <td><%=uss.getCantidad()%></td>


                <td>
                    <form action="/rockstar/User" method="post">
                        <button class="btn btn-danger">eliminar</button>
                        <input type="hidden" name="id"  value="<%=user.getId()%>">
                        <input type="hidden" name="opcion" value="eliminardatos">
                    </form>
                </td>
            </tr>
            <% }
            } catch (SQLException e) {
                e.printStackTrace();
            }
                session.setAttribute("datos", null);
            %>
            </tbody>
        </table>
    </section>
    <footer>


    </footer>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>