/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

document.addEventListener('DOMContentLoaded', function () {
    var parametros = new URLSearchParams(window.location.search);
    var modalError = document.getElementById('modal-form');
    var modalBloqueo = document.getElementById('modal');
    var tiempoRestanteElement = document.getElementById('tiempoRestante');
    var intentosRestantesModalElement = document.getElementById('intentosRestantesModal');
    var intentosRestantesElement = document.getElementById('intentosRestantes');
    var bloqueo = parametros.get('bloqueo') === 'true';
    var error = parametros.get('error') === 'true';
    var intentos = parametros.get('intentos');
    var tiempo = parametros.get('tiempo') || 5;

    intentosRestantesModalElement.textContent = intentos;
    intentosRestantesElement.textContent = intentos;

    if (bloqueo) {
        tiempoRestanteElement.textContent = tiempo + ':00';

        var minutos = tiempo - 1;
        var segundos = 59;
        var timer = setInterval(function () {
            if (segundos === 0) {
                minutos--;
                segundos = 59;
            } else {
                segundos--;
            }

            if (minutos === 0 && segundos === 0) {
                clearInterval(timer);
                modalBloqueo.style.display = 'none';
            }

            tiempoRestanteElement.textContent = minutos + ':' + (segundos < 10 ? '0' + segundos : segundos);
        }, 1000);

        modalBloqueo.style.display = 'block';
    } else {
        modalBloqueo.style.display = 'none';

        if (error && intentos > 0) {
            modalError.style.display = 'block';

            window.addEventListener('click', function (event) {
                if (event.target === modalError) {
                    modalError.style.display = 'none';
                }
            });

            window.addEventListener('keydown', function (event) {
                if (event.key === 'Enter') {
                    modalError.style.display = 'none';
                }
            });
        } else {
            modalError.style.display = 'none';
        }
    }
});

//Ejecutando funciones
document.getElementById("btn__iniciar-sesion").addEventListener("click", iniciarSesion);
document.getElementById("btn__registrarse").addEventListener("click", register);
window.addEventListener("resize", anchoPage);

//Declarando variables
var formulario_login = document.querySelector(".formulario__login");
var formulario_register = document.querySelector(".formulario__register");
var contenedor_login_register = document.querySelector(".contenedor__login-register");
var caja_trasera_login = document.querySelector(".caja__trasera-login");
var caja_trasera_register = document.querySelector(".caja__trasera-register");

//FUNCIONES

function anchoPage() {

    if (window.innerWidth > 850) {
        caja_trasera_register.style.display = "block";
        caja_trasera_login.style.display = "block";
    } else {
        caja_trasera_register.style.display = "block";
        caja_trasera_register.style.opacity = "1";
        caja_trasera_login.style.display = "none";
        formulario_login.style.display = "block";
        contenedor_login_register.style.left = "0px";
        formulario_register.style.display = "none";
    }
}

anchoPage();


function iniciarSesion() {
    if (window.innerWidth > 850) {
        formulario_login.style.display = "block";
        contenedor_login_register.style.left = "10px";
        formulario_register.style.display = "none";
        caja_trasera_register.style.opacity = "1";
        caja_trasera_login.style.opacity = "0";
    } else {
        formulario_login.style.display = "block";
        contenedor_login_register.style.left = "0px";
        formulario_register.style.display = "none";
        caja_trasera_register.style.display = "block";
        caja_trasera_login.style.display = "none";
    }
}

function register() {
    if (window.innerWidth > 850) {
        formulario_register.style.display = "block";
        contenedor_login_register.style.left = "410px";
        formulario_login.style.display = "none";
        caja_trasera_register.style.opacity = "0";
        caja_trasera_login.style.opacity = "1";
    } else {
        formulario_register.style.display = "block";
        contenedor_login_register.style.left = "0px";
        formulario_login.style.display = "none";
        caja_trasera_register.style.display = "none";
        caja_trasera_login.style.display = "block";
        caja_trasera_login.style.opacity = "1";
    }
}
 