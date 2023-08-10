package controlador;

import dao.*;
import modelo.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;

public class Productos extends HttpServlet {

    String LOGIN = "index.jsp";
    String CREAR = "vista/ProductosCrear.jsp";
    String EDITAR = "vista/ProductosActualizar.jsp";
    String REGISTROS = "vista/Productos.jsp";

    //Objetos
    Producto men = new Producto();
    ProductoDao dao = new ProductoDao();
    //
    String mensaje;
    //
    Integer idProducto = 0;
    String proNombre;
    String proCodigo;
    Integer proStock;
    Double proPrecio;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("accion");
        String acceso = "";
        //========================================================================================== GLOBALES
        HttpSession session = request.getSession();
        Usuario usu = (Usuario) session.getAttribute("usuario");
        if (usu == null) {
            // si no existe un Usuario activo en el servidor se redirige al login
            request.setAttribute("errorSesion", "Debes iniciar sesion, para acceder al contenido!!");
            request.getRequestDispatcher(LOGIN).forward(request, response);
        } else {
            switch (action) {
                case "guardar":
                    proNombre = request.getParameter("proNombre");
                    proCodigo = request.getParameter("proCodigo");
                    proStock = Integer.parseInt(request.getParameter("proStock"));
                    proPrecio = Double.parseDouble(request.getParameter("proPrecio"));
                    men = new Producto(proNombre, proCodigo, proStock, proPrecio);
                    mensaje = dao.add(men);
                    request.setAttribute("mensaje", mensaje);
                    request.setAttribute("divMsj", (mensaje == "creado") ? "visible" : "sr-only");
                    acceso = REGISTROS;
                    break;
                case "actualizar":
                    idProducto = Integer.parseInt(request.getParameter("idProducto"));
                    proNombre = request.getParameter("proNombre");
                    proCodigo = request.getParameter("proCodigo");
                    proStock = Integer.parseInt(request.getParameter("proStock"));
                    proPrecio = Double.parseDouble(request.getParameter("proPrecio"));
                    men = new Producto(idProducto, proNombre, proCodigo, proStock, proPrecio);
                    mensaje = dao.updateById(men);
                    request.setAttribute("mensaje", mensaje);
                    request.setAttribute("divMsj", (mensaje == "actualizado") ? "visible" : "sr-only");
                    System.out.println(dao.updateById(men));
                    acceso = REGISTROS;
                    break;
                default:
                    acceso = LOGIN;
            }
            RequestDispatcher view = request.getRequestDispatcher(acceso);
            view.forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("accion");
        String acceso = "";
        //========================================================================================== GLOBALES
        HttpSession session = request.getSession();
        Usuario usu = (Usuario) session.getAttribute("usuario");
        if (usu == null) {
            // si no existe un Usuario activo en el servidor se redirige al login
            request.setAttribute("errorSesion", "Debes iniciar sesion, para acceder al contenido!!");
            request.getRequestDispatcher(LOGIN).forward(request, response);
        } else {
            switch (action) {
                case "crear":
                    acceso = CREAR;
                    break;
                case "editar":
                    request.setAttribute("idMenu", request.getParameter("idMenu"));
                    acceso = EDITAR;
                    break;
                case "eliminar":
                    idProducto = Integer.parseInt((String) request.getParameter("idMenu"));
                    /* ========== ENVIO EL OBJETO A LA DB=========*/
                    mensaje = dao.deleteById(idProducto);
                    request.setAttribute("mensaje", mensaje);
                    request.setAttribute("divMsj", (mensaje == "eliminado") ? "visible" : "sr-only");
                    acceso = REGISTROS;
                    break;
                default:
                    acceso = LOGIN;
            }
            RequestDispatcher view = request.getRequestDispatcher(acceso);
            view.forward(request, response);
        }
    }

}
