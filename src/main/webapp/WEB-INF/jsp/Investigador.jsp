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
        <title>Investigadores</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>


            .close {
                float: right;
                font-size: 24px;
                cursor: pointer;
            }

            input[type="text"], input[type="email"] {
                width: 95%;
                padding: 8px;
                margin: 10px 0;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            button {
                padding: 10px 20px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            button:hover {
                background-color: #0056b3;
            }
        </style>

    </head>
    <body>
        <div class="container mt-5">
            <h1 class="text-center text-primary">CRUD de Investigadores</h1>

            <!-- Formulario -->
            <form:form method="POST" action="/Investigador/guardar" modelAttribute="investigador">
                <form:hidden path="cod_investigador" />
                <div class="mb-3">
                    <label class="form-label">Nombre completo:</label>
                    <form:input path="nombre_completo" class="form-control" />
                </div>
                <div class="mb-3">
                    <label class="form-label">Email:</label>
                    <form:input path="email" class="form-control" />
                </div>
                <button type="submit" class="btn btn-success">Guardar</button>
            </form:form>

            <hr/>

            <!-- Tabla -->
            <table class="table table-bordered mt-3">
                <thead class="table-dark">
                    <tr>
                        <th>#</th>
                        <th>Nombre Completo</th>
                        <th>Email</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                  
                  List<Investigador> lista = (List<Investigador>) request.getAttribute("investigadores");
                  int index = 1;
                  if (lista != null) {
                      for (Investigador inv : lista) {
                    %>
                    <tr>
                        <td><%= index++ %></td>
                        <td><%= inv.getNombre_completo() %></td>
                        <td><%= inv.getEmail() %></td>
                        <td>
                            <a href="#" class="btn btn-info btn-sm"
                               data-bs-toggle="modal"
                               data-bs-target="#editarModal"
                               data-cod-investigador="<%= inv.getCod_investigador() %>"
                               data-nombre="<%= inv.getNombre_completo() %>"
                               data-email="<%= inv.getEmail() %>">Editar</a>

                            <a href="/Investigador/eliminar/<%= inv.getCod_investigador() %>" class="btn btn-danger btn-sm"
                               onclick="return confirm('¿Eliminar este investigador?')">Eliminar</a>
                        </td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr><td colspan="4">No hay investigadores disponibles.</td></tr>
                    <%
                        }
                    %>

                </tbody>
            </table>
        </div>
        <div class="text-center mt-4">
            <a href="/" class="btn btn-primary">Volver al Menú Principal</a>
        </div>

        <!-- Modal de edición -->
        <div class="modal fade" id="editarModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form:form method="POST" action="/Investigador/guardar" modelAttribute="investigador">
                        <div class="modal-header">
                            <h5 class="modal-title">Editar Investigador</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body">
                            <form:hidden path="cod_investigador" id="editCodInvestigador" />
                            <div class="mb-3">
                                <label>Nombre:</label>
                                <form:input path="nombre_completo" class="form-control" id="editNombre" />
                            </div>
                            <div class="mb-3">
                                <label>Email:</label>
                                <form:input path="email" class="form-control" id="editEmail" />
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Actualizar</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>

      

        <script>
            const editarModal = document.getElementById('editarModal');
            editarModal.addEventListener('show.bs.modal', function (event) {
                const button = event.relatedTarget;
                const cod = button.getAttribute('data-cod-investigador');
                const nombre = button.getAttribute('data-nombre');
                const email = button.getAttribute('data-email');

                document.getElementById('editCodInvestigador').value = cod;
                document.getElementById('editNombre').value = nombre;
                document.getElementById('editEmail').value = email;
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


    </body>
</html>
