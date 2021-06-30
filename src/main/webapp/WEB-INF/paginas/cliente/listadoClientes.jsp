
<!-- 
    Voy hacer uso de la libreria de core para utilizar
    un forEach 
-->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 
   Cambiar el formato dependiendo de la localidad
-->
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="es_MX"/> 

<section id="cliente">
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <div class="card">
                    <div class="card-header">
                        <h4>Listado de Clientes</h4>
                        <table class="table table-striped">
                            <thead class="thead-dark">
                                <tr>
                                    <th>#</th>
                                    <th>Nombre</th>
                                    <th>Apellido</th>
                                    <th>Saldo</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Iteramos cada elemento de la lista de clientes -->
                                <c:forEach var="cliente" items="${clientes}" varStatus="status">
                                    <tr>
                                        <td>${status.count}</td>
                                        <td>${cliente.nombre}</td> <td>${cliente.apellido}</td>
                                        <td><fmt:formatNumber value="${cliente.saldo}" type="currency"/></td>
                                        <td>
                                            <a class="btn btn-secondary" href="${pageContext.request.contextPath}/ServletControlador?accion=editar&idCliente=${cliente.idCliente}">
                                                <i class="fas fa-angle-double-right "></i>
                                                Editar
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!--Inicio Tarjetas para los totales -->
            <div class="col-md-3">
                <div class="card text-center bg-danger text-white mb-3">
                    <div class="card-body">
                        <h3>Saldo total</h3>
                        <h4 class="display-4">
                            <fmt:formatNumber value="${saldoTotal}" type="currency"/>
                        </h4>
                    </div>
                </div>   
                <div class="card text-center bg-success text-white mb-3">
                    <div class="card-body">
                        <h3>Total Clientes</h3>
                        <h4 class="display-4">
                            <i class="fas fa-users"></i>
                            ${totalClientes}
                        </h4>
                    </div>
                </div>
            </div>
            <!--Fin Tarjetas para los totales -->
        </div>
    </div>
</section>

<!-- Agregar cliente modal -->
<jsp:include page="/WEB-INF/paginas/cliente/agregarCliente.jsp"/>