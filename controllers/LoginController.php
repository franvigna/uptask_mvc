<?php

namespace Controllers;

use Classes\Email;
use Model\Usuario;
use MVC\Router;

class LoginController {
    public static function login(Router $router){
        $alertas = [];
        if($_SERVER['REQUEST_METHOD'] === 'POST'){
            $usuario = new Usuario($_POST);

           $alertas = $usuario->validarLogin();

            if(empty($alertas)){
               //Verificar que el usaurio exista
                $usuario = Usuario::where('email',$usuario->email);
                if(!$usuario || !$usuario->confirmado  ){
                    Usuario::setAlerta('error', 'El Usuario no existe o no esta confirmado');
                } else {
                    //El usuario existe
                    if( password_verify($_POST['password'], $usuario->password)){
                        //iniciar la sesion del usuario
                        session_start();
                        $_SESSION['id'] = $usuario->id;
                        $_SESSION['nombre'] = $usuario->nombre;
                        $_SESSION['email'] = $usuario->email;
                        $_SESSION['login'] = true;

                        //redireccionar
                        header('Location: /dashboard');

                    }else{
                        Usuario::setAlerta('error', 'Contraseña incorrecta');
                    }
                }
            }
        }
        $alertas = Usuario::getAlertas();

        //Render a la vista
        $router->render('auth/login',[
            'titulo'=> 'Iniciar Sesion',
            'alertas'=> $alertas
        ]);
    }
    public static function logout(){
        session_start();
        $_SESSION = [];
        HEADER('Location: /');
    }

    public static function crear(Router $router){
        $alertas = [];
        $usuario = new Usuario;

        if($_SERVER['REQUEST_METHOD'] === 'POST'){
            $usuario->sincronizar($_POST);
            $alertas = $usuario->validarNuevaCuenta();
            if(empty($alertas)){
                $existeUsuario = Usuario::Where('email', $usuario->email);

                if($existeUsuario){
                    Usuario::setAlerta('error', 'El Usuario ya esta registrado');
                    $alertas = Usuario::getAlertas();
                }else{
                    //hashear el passwword
                    $usuario->hashPassword();

                    //eliminar password2
                    unset($usuario->password2);

                    //general el token
                    $usuario->crearToken();

                    //Crear un nuevo ususario
                    $resultado = $usuario->guardar();

                    //enviar email
                    $email = new Email($usuario->email, $usuario->nombre, $usuario->token);
                    $email->enviarConfirmacion();

                    if($resultado){
                        header('Location: /mensaje');
                    }
                }
            }
        }

        //Render a la vista
        $router->render('auth/crear',[
            'titulo' => 'Crea tu cuenta en UpTask',
            'usuario' => $usuario,
            'alertas' => $alertas
        ]);
    }

    public static function olvide(Router $router){
        $alertas = []; 
        if($_SERVER['REQUEST_METHOD'] === 'POST'){
            $usuario = new Usuario($_POST);
            $alertas = $usuario->validarEmail();

            if(empty($alertas)){
                //buscar el usuario
                $usuario = Usuario::where('email', $usuario->email);
                if($usuario && $usuario->confirmado){
                    //encontro al usuario
                    //Generar un nuevo token
                    $usuario->crearToken();
                    unset($usuario->password2);

                    //Actualizar el usaurio
                    $usuario->guardar();

                    //enviar el email
                    $email = new Email($usuario->email,$usuario->nombre,  $usuario->token);

                    $email->enviarInstrucciones();


                    //imprimir la alerta
                    Usuario::setAlerta('exito', 'Hemos enviado las instrucciones a tu email');

                }else{
                    //no existe el usuario
                    Usuario::setAlerta('error', 'El Usuario no existe o no esta confirmado');
                }
            }
        }

        $alertas = Usuario::getAlertas();
        //render a la vista
        $router->render('auth/olvide',[
            'titulo' => 'Olvide mi Contraseña',
            'alertas' => $alertas
        ]);
    }

    public static function reestablecer(Router $router){

        $token = s($_GET['token']);
        $mostrar = true;

        if(!$token)header('Location: /');

        //Identificar el usuario con este token
        $usuario = Usuario::where('token', $token);

        if(empty($usuario)) {
            //no se encontro un usuario con ese token
            Usuario::setAlerta('error', 'Token no valido');
            $mostrar = false;  
        }

        if($_SERVER['REQUEST_METHOD'] === 'POST'){
            //Añadir el nuevo password
            $usuario->sincronizar($_POST);

            //Validar el password
            $alertas = $usuario->validarPassword();

            if(empty($alertas)){
                //Hashear el nuevo password
                $usuario->hashPassword();
                unset($usuario->password2);

                //Eliminar el Token
                $usuario->token = "";

                //Guardar el usuario en la BD
                $resultado = $usuario->guardar();

                //Redireccionar
                if($resultado)header('Location: /');

            }
        }

        $alertas = Usuario::getAlertas();

        //render a la vista
        $router->render('auth/reestablecer',[
            'titulo' => 'Restablecer Cuenta',
            'alertas' => $alertas,
            'mostrar' => $mostrar
        ]);
    }

    public static function mensaje(Router $router){
       //render a la vista
       $router->render('auth/mensaje',[
        'titulo'=> 'Cuenta Creada Exitosamente'
        ]);
    }

    public static function confirmar(Router $router){

        $token = s($_GET['token']);
        $alertas = [];
        if(!$token)header('Location: /');

        //Encontrar al usuario con este token
        $usuario = Usuario::where('token', $token);

        if(empty($usuario)) {
            //no se encontro un usuario con ese token
            Usuario::setAlerta('error', 'Token no valido');
        }else{
            //Confirmar la cuenta
            $usuario->confirmado = 1;
            $usuario->token = "";
            unset($usuario->password2);
            
            //Guardar en la BD
            $usuario->guardar();

            Usuario::setAlerta('exito', 'Cuenta Comprobada Correctamente');
        }

        $alertas = Usuario::getAlertas();

        //render a la vista
        $router->render('auth/confirmar', [
            'titulo' => 'Cuenta Confirmada',
            'alertas' => $alertas
        ]);
    }
}