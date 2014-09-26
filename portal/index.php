<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/admin.css" />
<title>- Admin Portal -</title>
<script language="javascript">
function checkIf(){
	var u = document.form1.username.value;
	var p = document.form1.password.value;
	
	if( u.length==0 ){
		alert("Please enter your username.");
		return false;
	}else if( p.length==0 ){
		alert("Please enter your password.");
		return false;
	}else{
		return true;
	}
}
</script>
</head>

<body>
<table width="100%" border="0" cellspacing="2" cellpadding="2">
  <tbody>
    <tr>
      <td align="center">&nbsp;</td>
    </tr>
    <tr>
      <td align="center">- Admin Login -</td>
    </tr>
    <tr>
      <td align="center">&nbsp;</td>
    </tr>
    <tr>
      <td align="center">
      <form id="form1" name="form1" method="post" action="do_login.php">
      <table width="400" border="0" cellspacing="2" cellpadding="2" class="box">
        <tbody>
          <tr>
            <td width="40%" align="right">Username&nbsp;&nbsp;</td>
            <td align="left"><input name="username" type="text" id="username" size="25"></td>
          </tr>
          <tr>
            <td align="right">Password&nbsp;&nbsp;</td>
            <td align="left"><input name="password" type="password" id="password" size="25"></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><input type="submit" name="submit" id="submit" value="&nbsp;&nbsp;Login&nbsp;&nbsp;" onclick="return checkIf()"></td>
          </tr>
        </tbody>
      </table>
      </form>
      </td>
    </tr>
    <tr>
      <td align="center">&nbsp;</td>
    </tr>
    <tr>
      <td align="center">&nbsp;</td>
    </tr>
    <tr>
      <td align="center">&nbsp;</td>
    </tr>
  </tbody>
</table>
</body>
</html>