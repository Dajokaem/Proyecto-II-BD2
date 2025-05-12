<%-- 
    Document   : Prueba
    Created on : 11/05/2025, 00:06:36
    Author     : jos56
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="Logica.*" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Laboratorios</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container mt-5">
            <h1 class="text-center text-primary">CRUD de Laboratorios</h1>

            <!-- Formulario -->
            <form:form method="POST" action="/Laboratorio/guardar" modelAttribute="laboratorio">
                <form:hidden path="cod_laboratorio" />
                <div class="mb-3">
                    <label class="form-label">Nombre:</label>
                    <form:input path="nombre" class="form-control" />
                </div>
                <div class="mb-3">
                    <label class="form-label">Ubicación:</label>
                    <form:input path="direccion" class="form-control" />
                </div>
                <button type="submit" class="btn btn-success">Guardar</button>
            </form:form>

            <hr/>

            <!-- Tabla -->
            <table class="table table-bordered mt-3">
                <thead class="table-dark">
                    <tr>
                        <th>#</th>
                        <th>Nombre</th>
                        <th>Ubicación</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                  
                  List<Laboratorio> lista = (List<Laboratorio>) request.getAttribute("laboratorios");
                  int index = 1;
                  if (lista != null) {
                      for (Laboratorio lab : lista) {
                    %>
                    <tr>
                        <td><%= index++ %></td>
                        <td><%= lab.getNombre() %></td>
                        <td><%= lab.getDireccion() %></td>
                        <td>
                            <a href="#" class="btn btn-info btn-sm"
                               data-bs-toggle="modal"
                               data-bs-target="#editarModal"
                               data-cod-laboratorio="<%= lab.getCod_laboratorio() %>"
                               data-nombre="<%= lab.getNombre() %>"
                               data-direccion="<%= lab.getDireccion() %>">Editar</a>

                            <a href="/Laboratorio/eliminar/<%= lab.getCod_laboratorio() %>" class="btn btn-danger btn-sm"
                               onclick="return confirm('¿Eliminar este laboratorio?')">Eliminar</a>
                        </td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr><td colspan="4">No hay laboratorios disponibles.</td></tr>
                    <%
                        }
                    %>

                </tbody>
            </table>
        </div>
        <div class="text-center mt-4">
            <a href="/" class="btn btn-primary">Volver al Menú Principal</a>
        </div>
        <div class="modal fade" id="editarModal" tabindex="-1" aria-labelledby="editarModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editarModalLabel">Editar Laboratorio</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Formulario en el modal -->
                        <form id="editarForm" method="POST">
                            <input type="hidden" id="cod_laboratorio" name="cod_laboratorio">
                            <div class="mb-3">
                                <label for="nombre" class="form-label">Nombre:</label>
                                <input type="text" class="form-control" id="nombre" name="nombre">
                            </div>
                            <div class="mb-3">
                                <label for="direccion" class="form-label">Ubicación:</label>
                                <input type="text" class="form-control" id="direccion" name="direccion">
                            </div>
                            <button type="submit" class="btn btn-success">Guardar cambios</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script>
            const editarModal = document.getElementById('editarModal');
            editarModal.addEventListener('show.bs.modal', function (event) {
                const button = event.relatedTarget;

                const cod = button.getAttribute('data-cod-laboratorio');
                const nombre = button.getAttribute('data-nombre');
                const direccion = button.getAttribute('data-direccion');

                document.getElementById('cod_laboratorio').value = cod;
                document.getElementById('nombre').value = nombre;
                document.getElementById('direccion').value = direccion;
            });
        </script>

    </body>
</html>
