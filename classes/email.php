<?php

namespace Classes;

use PHPMailer\PHPMailer\PHPMailer;

class Email {
    protected $email;
    protected $nombre;
    protected $token;

    public function __construct($email, $nombre, $token)
    {
        $this->email = $email;
        $this->nombre = $nombre;
        $this->token = $token;
    }

    public function enviarConfirmacion(){
        $mail = new PHPMailer();
        $mail->isSMTP();
        $mail->Host = 'smtp.mailtrap.io';
        $mail->SMTPAuth = true;
        $mail->Port = 2525;
        $mail->Username = '1a2decae21d237';
        $mail->Password = 'c0ccfc660349f5';

        $mail->setFrom('cuentas@uptask.com');
        $mail->addAddress('cuentas@uptask.com', 'uptask.com');
        $mail->Subject = 'Confirma tu cuenta';

        $mail->isHTML(true);
        $mail->CharSet = 'UTF-8';

        $contenido = '<html>';
        $contenido .= "<p><strong>Hola " . $this->nombre . "</strong> Has Creado tu cuenta en UpTask, solo debes confirmarla en el siguiente enlace</p>";
        //COLOCAR EL DOMINIO EN PRESIONA AQUI
        $contenido .= "<p>Presiona aqui: <a href='http://localhost:3000/confirmar?token=" . $this->token . "'>Confirmar Cuenta</a></p>";
        $contenido .= "<p>Si no creaste esta cuenta, puedes ignorar este mendaje</p>";
        $contenido .= '</html>';

        $mail->Body = $contenido;

        //Enviar el Email
        $mail->send();
 
    }

    public function enviarInstrucciones(){
        $mail = new PHPMailer();
        $mail->isSMTP();
        $mail->Host = 'smtp.mailtrap.io';
        $mail->SMTPAuth = true;
        $mail->Port = 2525;
        $mail->Username = '1a2decae21d237';
        $mail->Password = 'c0ccfc660349f5';

        $mail->setFrom('cuentas@uptask.com');
        $mail->addAddress('cuentas@uptask.com', 'uptask.com');
        $mail->Subject = 'Reestablece tu Contraseña';

        $mail->isHTML(true);
        $mail->CharSet = 'UTF-8';

        $contenido = '<html>';
        $contenido .= "<p><strong>Hola " . $this->nombre . "</strong> Parece que has olvidado tu contraseña, sigue el siguiente enlace para reestablecerlo</p>";
        //COLOCAR EL DOMINIO EN PRESIONA AQUI
        $contenido .= "<p>Presiona aqui: <a href='http://localhost:3000/reestablecer?token=" . 
        $this->token . "'>Reestablecer Contraseña</a></p>";
        $contenido .= "<p>Si no creaste esta cuenta, puedes ignorar este mendaje</p>";
        $contenido .= '</html>';

        $mail->Body = $contenido;

        //Enviar el Email
        $mail->send();

    }
}

