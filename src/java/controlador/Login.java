package controlador;

import dao.*;
import modelo.*;
import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import security.Encriptador;

public class Login extends HttpServlet {

    //Variables de sesion
    HttpSession session;
    Usuario usu = new Usuario();
    UsuarioDao usuDao = new UsuarioDao();
    Encriptador enc = new Encriptador();

    //Variables de la logica
    String usuUsuario = "";
    String usuClave = "";
    String usuClaveBd = "";
    Integer usuIntento = 0;
    Integer idUsuario = 0;

    // Constante para el número máximo de intentos permitidos
    final int MAX_INTENTOS = 3;

    //Variables de navegacion
    String INCIO = "Controlador?p=usuarios";
    String LOGIN = "index.jsp";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        session = request.getSession();
        usuUsuario = request.getParameter("usuUsuario");
        usuClave = request.getParameter("usuClave");

        idUsuario = usuDao.getIdUsuario(usuUsuario);
        
        // Si los parametros es igual a null o el id del idUsuario == 0 caso contrario pasa al else
        if (idUsuario == 0 || idUsuario == null) {
            request.setAttribute("errorSesion", "El usuario ingresado no esta registrado!!");
            request.getRequestDispatcher(LOGIN).forward(request, response);
        } else {
            // Utilizamos la bd para dar logica
            usu = usuDao.getById(idUsuario);
            usuClaveBd = usu.getUsuClave();
            System.out.println("usuClaveBd " + usuClaveBd);

            // SI LA CLAVE DESENCRIPTADA ES IGUAL A LA INGRESADA EN LA INTERFAZ SE DA EL ACCESO
            usuIntento = usu.getUsuIntento();

            // Validamos la clave
            // si la usuClaveBd(BASE DE DATOS DESENCRIPTADA) es igual a la clave del input igresado por el usuario
            if (usuClaveBd.equals(usuClave)) {
                // GENERAMOS EL CONTROL DE INTENTOS
                if (usuIntento <= MAX_INTENTOS) {
                    // Resetear intentos fallidos al inicio de sesión exitoso
                    usu = new Usuario(idUsuario, usuUsuario, usuClave, 0);
                    usuDao.updateById(usu);
                    // Realizamos la redireccion a la interfaz y agregamos los datos del usuario
                    session.setAttribute("idUsuario", idUsuario);
                    session.setAttribute("usuUsuario", usuUsuario);
                    session.setAttribute("usuario", usu);
                    response.sendRedirect(INCIO);
                } else {
                    request.setAttribute("errorSesion", "LIMITES DE INTENTOS EXCEDIDOS!!");
                    request.getRequestDispatcher(LOGIN).forward(request, response);
                }
            } else {
                // Aqui la clave es incorrecta
                // Incrementar el contador de intentos fallidos
                usu = new Usuario(idUsuario, usuUsuario, usuClaveBd, usuIntento + 1);

                int intentosRestantes = MAX_INTENTOS - usuIntento - 1; // Cálculo de intentos restantes

                if (usuIntento >= MAX_INTENTOS) {
                    request.setAttribute("errorSesion", "LÍMITE DE INTENTOS EXCEDIDO," + "\n" + "USUARIO BLOQUEADO!!");
                } else {
                    if (intentosRestantes == 0) {
                        request.setAttribute("errorSesion", "CLAVE INCORRECTA!!" + "\n" + "USUARIO BLOQUEADO!!");
                        usu = new Usuario(idUsuario, usuUsuario, usuClaveBd, 0);
                    } else {
                        request.setAttribute("errorSesion", "CLAVE INCORRECTA!!" + "\n" + "Intentos restantes: " + intentosRestantes);
                    }
                }
                usuDao.updateById(usu);
                request.getRequestDispatcher(LOGIN).forward(request, response);
            }
        }
    }
}
