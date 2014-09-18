<?php session_start(); ?>
<?php
date_default_timezone_set('Australia/Melbourne');
include 'include/dbconn.php';
include 'include/func.php';
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, minimum-scale=1, maximum-scale=1">
<link rel="stylesheet" type="text/css" href="css/main.css" />
<link rel="stylesheet" type="text/css" href="css/font.css" />
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css" />
<link href='http://fonts.googleapis.com/css?family=Pontano+Sans' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Sorts+Mill+Goudy' rel='stylesheet' type='text/css'>
<title>Credit Card Project</title>
<style>
	.jq-button {
		padding: .4em 1em .4em 20px;
		text-decoration: none;
		position: relative;
	}
	.jq-button span.ui-icon {
		margin: 0 5px 0 0;
		position: absolute;
		left: .2em;
		top: 50%;
		margin-top: -8px;
	}
	.fakewindowcontain .ui-widget-overlay {
		position: absolute;
	}
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/main.js"></script>
</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="middle" class="top-wrapper">
      <nav class="top-nav-main">
        <ul>[ #logo ]&nbsp;&nbsp;
          <li><a href="index.php">Home</a></li>
          <li><a href="#">Wallet</a></li>
          <li><a href="#">About</a></li>
        </ul>
      </nav>
  </tr>
  <tr>
    <td align="center">
    <div class="wrapper">
