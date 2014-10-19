<?php
$to      = "Xuening Dong <s3469816@student.rmit.edu.au>, " .
		" Donghao Hu <s3279266@student.rmit.edu.au>, " .
		"Jia Tiong <s3370222@student.rmit.edu.au>, ".
		"Joe Ren <s3327627@student.rmit.edu.au>";
$subject = '邮件发送测试';
$message = '如果看到此信息，说明咱们的项目服务器直接支持发送邮件。我们可以用最简单的代码发送邮件了，Yeah!';
$headers = 'From: webmaster@cardscomparison.comlu.com' . "\r\n" .
    'Reply-To: webmaster@cardscomparison.comlu.com' . "\r\n" .
    'X-Mailer: PHP/' . phpversion();

mail($to, $subject, $message, $headers);
