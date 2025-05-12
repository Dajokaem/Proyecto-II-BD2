<%-- 
    Document   : editarLaboratorio
    Created on : 12/05/2025, 01:13:20
    Author     : jos56
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
