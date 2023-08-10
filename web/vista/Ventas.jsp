<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="modelo.*"%>
<%@page import="dao.*"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="keywords" content="">
        <meta name="author" content="">
        <meta name="robots" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="DLBS: DLBSSaas Admin  Bootstrap 5 Template">
        <meta property="og:title" content="DLBS: DLBSSaas Admin  Bootstrap 5 Template">
        <meta property="og:description" content="DLBS: DLBSSaas Admin  Bootstrap 5 Template">
        <meta property="og:image" content="https://fillow.dexignlab.com/xhtml/social-image.png">
        <meta name="format-detection" content="telephone=no">

        <!-- PAGE TITLE HERE -->
        <title>Admin Dashboard</title>

        <!-- FAVICONS ICON -->
        <link rel="shortcut icon" type="image/png" href="images/favicon.png">
        <link href="vendor/jquery-nice-select/css/nice-select.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <!-- Datatable -->
        <link href="vendor/datatables/css/jquery.dataTables.min.css" rel="stylesheet">
    </head>
    <body>

        <!--*******************
            Preloader start
        ********************-->
        <div id="preloader">
            <div class="lds-ripple">
                <div></div>
                <div></div>
            </div>
        </div>
        <!--*******************
            Preloader end
        ********************-->

        <!--**********************************
            Main wrapper start
        ***********************************-->
        <div id="main-wrapper">

            <!--**********************************
                Nav header start
            ***********************************-->
            <div class="nav-header">
                <a href="index.html" class="brand-logo">
                    <svg class="logo-abbr" width="55" height="55" viewbox="0 0 55 55" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M27.5 0C12.3122 0 0 12.3122 0 27.5C0 42.6878 12.3122 55 27.5 55C42.6878 55 55 42.6878 55 27.5C55 12.3122 42.6878 0 27.5 0ZM28.0092 46H19L19.0001 34.9784L19 27.5803V24.4779C19 14.3752 24.0922 10 35.3733 10V17.5571C29.8894 17.5571 28.0092 19.4663 28.0092 24.4779V27.5803H36V34.9784H28.0092V46Z" fill="url(#paint0_linear)"></path>
                    <defs>
                    </defs>
                    </svg>
                    <div class="brand-title">
                        <h2 class="">DLBS</h2>
                    </div>
                </a>
                <div class="nav-control">
                    <div class="hamburger">
                        <span class="line"></span><span class="line"></span><span class="line"></span>
                    </div>
                </div>
            </div>
            <!--**********************************
                Nav header end
            ***********************************-->

            <!--**********************************
        Header start
    ***********************************-->
            <div class="header">
                <div class="header-content">
                    <nav class="navbar navbar-expand">
                        <div class="collapse navbar-collapse justify-content-between">
                            <div class="header-left">
                                <div class="dashboard_bar">
                                    Clientes
                                </div>

                            </div>
                            <ul class="navbar-nav header-right">
                                <li class="nav-item dropdown">
                                    <a class="nav-link" href="javascript:void(0);" role="button" data-bs-toggle="dropdown">
                                        ${usuUsuario}
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-end">
                                        <a href="CerrarSesion" class="dropdown-item ai-icon">
                                            <svg id="icon-logout" xmlns="http://www.w3.org/2000/svg" class="text-danger" width="18" height="18" viewbox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path><polyline points="16 17 21 12 16 7"></polyline><line x1="21" y1="12" x2="9" y2="12"></line></svg>
                                            <span class="ms-2">Cerrar Sesion</span>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>

            <!--**********************************
                Header end ti-comment-alt
            ***********************************-->

            <!--**********************************
                Sidebar start
            ***********************************-->
            <div class="dlabnav">
                <div class="dlabnav-scroll">
                    <ul class="metismenu" id="menu">
                        <li>
                            <a href="Controlador?p=venta" >
                                <i class="fas fa-home"></i>
                                <span class="nav-text">Venta</span>
                            </a>
                        </li>
                        <li>
                            <a href="Controlador?p=productos" >
                                <i class="fas fa-home"></i>
                                <span class="nav-text">Productos</span>
                            </a>
                        </li>
                        <li>
                            <a href="Controlador?p=clientes" >
                                <i class="fas fa-home"></i>
                                <span class="nav-text">Clientes</span>
                            </a>
                        </li>
                        <li>
                            <a  href="Controlador?p=usuarios" >
                                <i class="fas fa-home"></i>
                                <span class="nav-text">Usuarios</span>
                            </a>

                        </li>
                    </ul>
                </div>
            </div>
            <!--**********************************
                Sidebar end
            ***********************************-->

            <!--**********************************
        Content body start
    ***********************************-->
            <div class="content-body">
                <!-- row -->
                <div class="container-fluid">
                    <div class="col-12">
                        <div class="${divMsj}">
                            <div class="alert alert-success alert-dismissible fade show ">
                                <svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="me-2"><polyline points="9 11 12 14 22 4"></polyline><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"></path></svg>
                                <span class="text-muted">${mensaje}</span>
                                <button type="button" class="btn btn-close" data-bs-dismiss="alert" aria-label="btn-close">
                                </button>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <form action="Pedido" method="post">
                                    <input type="hidden" name="fkCliente" class="form-control" id="fkCliente">
                                    <input type="hidden" name="fkProducto" class="form-control" id="fkProducto">
                                    <input type="hidden" name="fkVenta" class="form-control" id="fkVenta" value="${idVenta}">
                                    <input type="hidden" name="venCodigo" value="${codVenta}">
                                    <input type="hidden" name="detTotal" id="detTotal">
                                    <input type="hidden" name="venTotal" id="venTotal">
                                    <input type="hidden" name="venCodigo" value="${codVenta}">
                                    <div class="row">
                                        <div class="col-xl-6 m-b30">
                                            <label class="form-label">Cliente</label>
                                            <div class="input-group mb-3">
                                                <input type="text" name="fkmenu" class="form-control" id="lblNombreCli">
                                                <button type="button" class="btn btn-primary mb-2 pb-3" data-bs-toggle="modal" data-bs-target="#exampleModalLong">
                                                    Seleccionar
                                                </button>                                            
                                            </div>
                                        </div>
                                        <div class="col-xl-6 m-b30">
                                            <label class="form-label">Producto</label>
                                            <div class="input-group mb-3">
                                                <input type="text" name="fkmenu" class="form-control" id="lblNombreProd">
                                                <button type="button" class="btn btn-primary mb-2 pb-3" data-bs-toggle="modal" data-bs-target="#exampleModalLongProducto">
                                                    Seleccionar
                                                </button>                                            
                                            </div>
                                        </div>

                                        <div class="col-xl-6 m-b30">
                                            <label class="form-label">Cantidad</label>
                                            <div class="input-group mb-3">
                                                <input type="text"class="form-control" id="lbl-cantidad" name="detCantidad">
                                                <button type="button" class="btn btn-primary mb-2 pb-3" onclick="agregarDetalle()">
                                                    Agregar detalle
                                                </button>                                            
                                            </div>
                                        </div>
                                    </div>  


                                    <div class="table-responsive mt-5">
                                        <table class="table text-center h-100 py-5" id="detalle-table">
                                            <!-- ... -->
                                        </table>
                                    </div>
                                    <div class="col-lg-12 mt-3 d-flex justify-content-end align-content-center gap-4">
                                        <h3 class="text font-w200 text-uppercase my-auto">Total a pagar: <span id="totalPagar">0.00</span></h3>
                                        <input class="btn btn-primary" type="submit" name="accion" onclick="generarPDF()" value="guardar">
                                    </div>
                                </form>
                                <!-- MODAL CLIENTES -->
                                <div class="modal fade" id="exampleModalLong">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <form method="post" action="Clientes">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">SELECCIONAR CLIENTE</h5>                                   
                                                    <button type="button" class="btn btn-danger light btn-close" data-bs-dismiss="modal"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="table-responsive">
                                                        <table id="example" class="display table header-border verticle-middle" style="min-width: 845px">
                                                            <thead>
                                                                <tr>
                                                                    <th class="text-center">Id</th>
                                                                    <th class="text-center">Nombres</th>
                                                                    <th class="text-center">Apellidos</th>
                                                                    <th class="text-center">Cedula</th>
                                                                    <th class="text-center">Email</th>
                                                                    <th class="text-center">Telefono</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <%
                                                                    ClienteDao dao = new ClienteDao();
                                                                    List<ClienteProveedor> lista = dao.getAll();
                                                                    Iterator<ClienteProveedor> iterCh = lista.iterator();
                                                                    ClienteProveedor cli = null;
                                                                    while (iterCh.hasNext()) {
                                                                        cli = iterCh.next();
                                                                %>
                                                                <tr onclick="selectClient(this)">
                                                                    <td class="text-center text-muted"><%= cli.getIdClienteProveedor()%></td>
                                                                    <td class="text-center text-muted"><%= cli.getCliProNombre()%></td>
                                                                    <td class="text-center text-muted"><%= cli.getCliProApellido()%></td>
                                                                    <td class="text-center text-muted"><%= cli.getCliProCedula()%></td>
                                                                    <td class="text-center text-muted"><%= cli.getCliProEmail()%></td>
                                                                    <td class="text-center text-muted"><%= cli.getCliProTelefono()%></td>
                                                                </tr>
                                                                <%}%>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>                                                
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <!-- MODAL MENU -->
                                <div class="modal fade" id="exampleModalLongProducto">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <form method="post" action="Clientes">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">SELECCIONAR PLATO</h5>                                   
                                                    <button type="button" class="btn btn-danger light btn-close" data-bs-dismiss="modal"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="table-responsive">
                                                        <table id="example2_filter" class="display dataTable" style="min-width: 845px">
                                                            <thead>
                                                                <tr class="text-center">
                                                                    <th>Nombre</th>
                                                                    <th>Codigo</th>
                                                                    <th>Stock</th>
                                                                    <th>Precio</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <%
                                                                                        ProductoDao daoProducto = new ProductoDao();
                                                                                        List<Producto> listaProducto = daoProducto.getAll();
                                                                                        Iterator<Producto> iterPro = listaProducto.iterator();
                                                                                        Producto men = null;
                                                                                        while (iterPro.hasNext()) {
                                                                                            men = iterPro.next();
                                                                %>                                                 
                                                                <tr onclick="selectProduct(this)">
                                                                    <td class="text-center text-muted"><%= men.getIdProducto()%></td>
                                                                    <td class="text-center text-muted"><%= men.getProNombre()%></td>
                                                                    <td class="text-center text-muted"><%= men.getProPrecio()%></td>
                                                                    <td class="text-center text-muted"><%= men.getProStock()%></td>
                                                                </tr>
                                                                <%}%>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>                                                
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--**********************************
                Content body end
            ***********************************-->


            <!--**********************************
                Footer start
            ***********************************-->
            <div class="footer">
                <div class="copyright">
                    <p>Copyright © Designed &amp; Developed by <a href="../index.htm" target="_blank">DexignLab</a> 2021</p>
                </div>
            </div>
            <!--**********************************
                Footer end
            ***********************************-->

            <!--**********************************
       Support ticket button start
    ***********************************-->

            <!--**********************************
               Support ticket button end
            ***********************************-->



        </div>
        <!--**********************************
            Main wrapper end
        ***********************************-->

        <!--**********************************
            Scripts
        ***********************************-->
        <!-- Required vendors -->
        <script src="vendor/global/global.min.js"></script>
        <script src="vendor/jquery-nice-select/js/jquery.nice-select.min.js"></script>
        <script src="js/custom.min.js"></script>
        <script src="js/dlabnav-init.js"></script>
        <script src="js/demo.js"></script>
        <script src="js/styleSwitcher.js"></script>
        <!-- Datatable -->
        <script src="vendor/datatables/js/jquery.dataTables.min.js"></script>
        <script src="js/plugins-init/datatables.init.js"></script>
    </body>
</html>