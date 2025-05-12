<%-- 
    Document   : Index
    Created on : 10/05/2025, 23:37:18
    Author     : jos56
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <!-- Bootstrap 5 CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-..." crossorigin="anonymous">

            <!-- Bootstrap 5 JavaScript Bundle (con Popper incluido) -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-..." crossorigin="anonymous"></script>

            <title>ReservaLab</title>
        </head>
        <body>
            <div class="container mt-5">
                <h1 class="text-primary text-center">Administración</h1>

                <!-- Fila 1: Dos botones centrados -->
                <div class="d-flex justify-content-center mb-4">
                    <a href="/Investigador" class="btn btn-primary btn-sm mx-2">Investigador</a>
                    <a href="/Laboratorio" class="btn btn-primary btn-sm mx-2">Laboratorio</a>
                </div>

                <!-- Fila 2: Un botón centrado -->
                <div class="d-flex justify-content-center">
                    <a href="/Reserva" class="btn btn-primary btn-sm mx-2">Reserva</a>
                </div>
            </div>
        </body>
    </html>
</f:view>
