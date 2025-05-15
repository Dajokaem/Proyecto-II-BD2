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
            <h1 class="text-center text-primary">CRUD de Reserva</h1>

            <!-- Formulario -->
            <form:form method="POST" action="/Reserva/guardar" modelAttribute="reserva">
                <form:hidden path="cod_reserva" />
                <div class="mb-3">
                    <label class="form-label">Codigo Investigador</label>
                    <form:input path="cod_investigador" class="form-control" />
                </div>
                <div class="mb-3">
                    <label class="form-label">Codigo Laboratorio</label>
                    <form:input path="cod_laboratorio" class="form-control" />
                </div>
                <div class="mb-3">
                    <label class="form-label">fecha_inicio</label>
                    <form:input path="fecha_inicio" type="date" class="form-control" />
                </div>
                <div class="mb-3">
                    <label class="form-label">fecha_final</label>
                    <form:input path="fecha_fin" type="date" class="form-control" />
                </div>
                <button type="submit" class="btn btn-success">Guardar</button>
            </form:form>

            <hr/>

            <!-- Tabla -->
            <table class="table table-bordered mt-3">
                <thead class="table-dark">
                    <tr>
                        <th>#</th>
                        <th>Codigo Inv.</th>
                        <th>Codigo Lab.</th>
                        <th>fecha de inicio</th>
                        <th>fecha de cierre</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                  
                  List<Reserva> lista = (List<Reserva>) request.getAttribute("reservas");
                  int index = 1;
                  if (lista != null) {
                      for (Reserva res : lista) {
                    %>
                    <tr>
                        <td><%= index++ %></td>
                        <td><%= res.getCod_investigador() %></td>
                        <td><%= res.getCod_laboratorio() %></td>
                        <td><%= res.getFecha_inicio() %></td>
                        <td><%= res.getFecha_fin() %></td>
                        <td>
                            <a href="#" class="btn btn-info btn-sm"
                               data-bs-toggle="modal"
                               data-bs-target="#editarModal"
                               data-cod-reserva="<%= res.getCod_reserva() %>"
                               data-cod-investigador="<%= res.getCod_investigador() %>"
                               data-cod-laboratorio="<%= res.getCod_laboratorio() %>"
                               data-fecha-inicio="<%= res.getFecha_inicio() %>"
                               data-fecha-fin="<%= res.getFecha_fin() %>">Editar</a>

                            <a href="/Reserva/eliminar/<%= res.getCod_reserva() %>" class="btn btn-danger btn-sm"
                               onclick="return confirm('¿Eliminar esta reserva?')">Eliminar</a>
                        </td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr><td colspan="6">No hay Reservas disponibles.</td></tr>
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
                    <form:form method="POST" action="/Reserva/guardar" modelAttribute="reserva">
                        <div class="modal-header">
                            <h5 class="modal-title">Editar Reserva</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body">
                            <form:hidden path="cod_reserva" id="editCodReserva" />
                            <div class="mb-3">
                                <label>Codigo Investigador</label>
                                <form:input path="cod_investigador" class="form-control" id="editInvestigador" />
                            </div>
                            <div class="mb-3">
                                <label>Codigo Laboratorio</label>
                                <form:input path="cod_laboratorio" class="form-control" id="editLaboratorio" />
                            </div>
                            <div class="mb-3">
                                <label>Fecha inicio</label>
                                <form:input path="fecha_inicio" type="date" class="form-control" id="editFecha_inicio" />
                            </div>
                             <div class="mb-3">
                                <label>Fecha final</label>
                                <form:input path="fecha_fin" type="date" class="form-control" id="editFecha_fin" />
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
                const cod = button.getAttribute('data-cod-reserva');
                const investigador = button.getAttribute('data-cod-investigador');
                const laboratorio = button.getAttribute('data-cod-laboratorio');
                const fecha_inicio = button.getAttribute('data-fecha-inicio');
                const fecha_fin = button.getAttribute('data-fecha-fin');

                document.getElementById('editCodReserva').value = cod;
                document.getElementById('editInvestigador').value = investigador;
                document.getElementById('editLaboratorio').value = laboratorio;
                document.getElementById('editFecha_inicio').value= fecha_inicio;
                document.getElementById('editFecha_fin').value = fecha_fin;
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


    </body>
</html>
