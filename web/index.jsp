<%-- 
    Document   : index
    Created on : 12/09/2023, 9:17:31 p. m.
    Author     : cesar
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://kit.fontawesome.com/0fd39519e2.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    </head>
    <body>
        <h1>carrito compras</h1>

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
                        <a class="nav-link disabled" href="Controlador?accion=Carrito"><i class="fas fa-cart-plus"><label style="color: darkorange">(${contador})</label></i>carrito</a>
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
        <div class="container mt-2">
            <div class="row">
                <h1>${cantidad}</h1>
                <c:forEach var="p" items="${listaProductos}">
                    <div class="col-sm-4">
                        <div class="card">
                            <div class="card-header">
                                <h2>${p.nombres}</h2>
                            </div>
                            <div class="card-body">
                                <i>${p.precio}</i>
                                <img src="ControladorImg?id=${p.idProducto}" width="200" height="200">
                            </div>
                            <div class="card-footer text-center">
                                <label>${p.descripcion}</label>
                                <a href="Controlador?accion=agregarCarrito&id=${p.idProducto}" class="btn btn-outline-info">agregar a carrito</a>
                                <a href="Controlador?accion=Comprar&id=${p.idProducto}" class="btn btn-danger">comprar</a>
                            </div>
                        </div>
                    </div> 
                </c:forEach>

            </div>

        </div>

        <i class="fa-solid fa-user"></i> 







        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>
