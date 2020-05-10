<?php 

require_once('phpmailer/PHPMailerAutoload.php');
$mail = new PHPMailer;
$mail->CharSet = 'utf-8';

$name = $_POST['name'];
$phone = $_POST['number'];
$text = $_POST['text'];

$mail->isSMTP();                                      // Set mailer to use SMTP
$mail->Host = 'smtp.mail.ru';  																							// Specify main and backup SMTP servers
$mail->SMTPAuth = true;                               // Enable SMTP authentication
$mail->Username = 'potolkirostov.spam@mail.ru'; // Ваш логин от почты с которой будут отправляться письма
$mail->Password = 'N31al16al72'; // Ваш пароль от почты с которой будут отправляться письма
$mail->SMTPSecure = 'ssl';                            // Enable TLS encryption, `ssl` also accepted
$mail->Port = 465; // TCP port to connect to / этот порт может отличаться у других провайдеров

$mail->setFrom('potolkirostov.spam@mail.ru'); // от кого будет уходить письмо?
$mail->addAddress('egor1999280111@gmail.com');     // Кому будет уходить письмо 
$mail->isHTML(true);                                  // Set email format to HTML

$mail->Subject = 'Отзыв о работе';
$mail->Body    = '' .$name . ' оставил отзыв, его телефон ' .$phone. '. Отзыв клиента: ' .$text;
$mail->AltBody = '';

if(!$mail->send()) {
    echo 'Error';
}
?>