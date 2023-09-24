<%-- 
    Document   : carrito
    Created on : 12/09/2023, 10:02:42 p. m.
    Author     : cesar
--%>

<%@page import="Modelo.Carrito"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://kit.fontawesome.com/0fd39519e2.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="#">cesar store</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="Controlador?accion=home">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">ofertas del dia</a>
                    </li>
                    <i class="fa-solid fa-user"></i>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="Controlador?accion=home"><i class="fas fa-cart-plus"><label style="color: darkorange">${contador}</label></i>seguir comprando</a>
                    </li>
                </ul>


                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>


                <ul class="navbar-nav"> <%--en el ul se pego el li para que saliera dropdow a la derecha--%>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            iniciar sesion
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </li>
                </ul>


            </div>
        </nav>
        <div class="container mt-4">
            <h3>carrito</h3>
            <br>
            <div class="row">
                <div class="col-sm-8">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>item</th>
                                <th>nombres</th>
                                <th>descripcion</th>
                                <th>precioCompra</th>
                                <th>cantidad</th>
                                <th>subtotal</th>
                                <th>acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<Carrito> lista = (List<Carrito>) request.getAttribute("carrito");
                                for (Carrito car : lista) {

                            %>
                            <tr>
                                <td><%=car.getItem()%></td>
                                <td><%=car.getNombres()%></td>
                                <td><%=car.getDescripcion()%>
                                    <img src="ControladorImg?id=<%=car.getIdProducto()%>" width="100" height="100">
                                </td>
                                <td><%=car.getPrecioCompra()%></td>
                                
                                <td>
                                    <input type="hidden" id="idpro" value="<%=car.getIdProducto()%>">
                                    <input type="number" id="Cantidad" value="<%=car.getCantidad()%>" class="form-control text-center" min="1">
                                </td>
                                <td><%=car.getSubtotal()%></td>
                                <td>
                                    <input type="hidden" id="idp" value="<%=car.getIdProducto()%>">
                                    <a href="#" id="btnDelete"><i class="fa-solid fa-trash-can"></i></a>
                                    <%--<a href="Controlador?accion=Delete&idp=<%=car.getIdProducto()%>" id="btnDelete">eliminar</a>--%>
                                </td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>

                </div> 
                <div class="col-sm-4">
                    <div class="card">
                        <div class="card-header">
                            <h3>generar compra</h3>
                        </div>
                        <div class="card-body">
                            <label>Subtotal</label>
                            <input type="text" value="${totalApagar}" readonly="" class="form-control"> <%--readonly="" para qie este desactivada la edicion--%>
                            <label>Descuento</label>
                            <input type="text" readonly="" class="form-control"> <%--readonly="" para qie este desactivada la edicion--%>
                            <label>total a pagar</label>
                            <input type="text" value="${totalApagar}" readonly="" class="form-control"> <%--readonly="" para qie este desactivada la edicion--%>

                        </div>
                        <div class="card-footer">
                            <a href="#" class="btn btn-info btn-block">realizar pago</a>
                            <a href="#" class="btn btn-danger btn-block">generar compra</a>
                        </div>
                    </div>
                </div> 
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script><%--el ultimo cdn del jquuery actualizado--%>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script><%--lo de las alertas--%>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script><%--para que me lea el ajax--%>
        <script src="js/funciones.js" type="text/javascript"></script>
    </body>
</html>
