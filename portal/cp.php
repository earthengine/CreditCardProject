<?php include 'admin_top.php'; ?>
- Admin account management -<br/><br/>
<form id="form1" name="form1" method="post" action="cp_changepwd.php">
<table width="400" border="0" cellspacing="2" cellpadding="2" class="box">
  <tbody>
    <tr>
      <td colspan="2" align="center">- Change password -</td>
      </tr>
    <tr>
      <td width="40%" align="right">Old password&nbsp;&nbsp;</td>
      <td><input name="oldp" type="password" id="oldp" size="25"></td>
    </tr>
    <tr>
      <td align="right">New password&nbsp;&nbsp;</td>
      <td><input name="newp" type="password" id="newp" size="25"></td>
    </tr>
    <tr>
      <td align="right">Confirm new&nbsp;&nbsp;</td>
      <td><input name="cnewp" type="password" id="cnewp" size="25"></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="submit" id="submit" value="&nbsp;&nbsp;Submit&nbsp;&nbsp;"></td>
    </tr>
  </tbody>
</table>
</form>
<br/><br/>---------- or ----------<br/><br/>
<form id="form2" name="form2" method="post" action="cp_addaccount.php">
<table width="400" border="0" cellspacing="2" cellpadding="2" class="box">
  <tbody>
    <tr>
      <td colspan="2" align="center">- Add new account -</td>
      </tr>
    <tr>
      <td width="40%" align="right">Username&nbsp;&nbsp;</td>
      <td><input name="username" type="text" id="username" size="25"></td>
    </tr>
    <tr>
      <td align="right">password&nbsp;&nbsp;</td>
      <td><input name="pwd" type="password" id="pwd" size="25"></td>
    </tr>
    <tr>
      <td align="right">Confirm&nbsp;&nbsp;<br/>password&nbsp;&nbsp;</td>
      <td><input name="cpwd" type="password" id="cpwd" size="25"></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="submit" id="submit" value="&nbsp;&nbsp;Submit&nbsp;&nbsp;"></td>
    </tr>
  </tbody>
</table>
</form>
<?php include 'admin_footer.php'; ?>