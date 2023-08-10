<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <link href="BOOTSTRAP/CSSS/stilomodal.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="BOOTSTRAP/CSSS/stilo.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <main>
            <div class="contenedor__todo">
                <div class="caja__trasera">
                    <div class="caja__trasera-login">
                        <h3>¿Ya tienes una cuenta?</h3>
                        <p>Inicia sesión para entrar en la página</p>
                        <button id="btn__iniciar-sesion">Iniciar Sesión</button>
                    </div>
                    <div class="caja__trasera-register">
                        <h3>¿Aún no tienes una cuenta?</h3>
                        <p>Regístrate para que puedas iniciar sesión</p>
                        <button id="btn__registrarse">Regístrarse</button>
                    </div>
                </div>

                <!--Formulario de Login y registro-->
                <div class="contenedor__login-register">
                    <!--Login-->
                    <form action="Login" class="formulario__login" method="post">
                        <h2>Iniciar Sesión</h2>
                        <input type="text" placeholder="Usuario" name="usuUsuario" required="true">
                        <input type="password" placeholder="Contraseña" name="usuClave" required="true">
                        <input class="w-100" style="background: rgba(0, 128, 255, 0.5); border: none; border-radius: 30px; height: 50px" type="submit" value="INGRESAR" name="btn-login">
                        <br>
                        <br>
                        <center>
                            <h5 style="color: #007bb6;">${errorSesion}</h5>
                        </center>
                    </form>
                    <br>
                    <!--Register-->
                    <form action="" class="formulario__register">
                        <h2>Regístrarse</h2>
                        <input type="text" placeholder="Nombres completos">
                        <input type="text" placeholder="Apellidos completos">
                        <input type="text" placeholder="Correo Electronico">
                        <input type="text" placeholder="Cedula">
                        <input type="password" placeholder="Contraseña">
                        <a href="#">Regístrarse</a>
                    </form>
                </div>
            </div>
        </main>
    </body>
</html>