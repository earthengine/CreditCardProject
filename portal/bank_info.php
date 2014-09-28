<?php include 'admin_top.php'; ?>
- Bank info. -<br/><br/>
<table width="700" border="0" cellspacing="0" cellpadding="0" class="box">
  <tbody>
  <tr>
  	<td colspan="2" align="center">Edit bank info.</td>
  </tr>
  <tr>
  	<td colspan="2" align="center">&nbsp;</td>
  </tr>
<?php
$select = "SELECT id, name FROM bank_info ORDER BY id";
$rs = mysqli_query($conn, $select);

while( $row = mysqli_fetch_array($rs) ){
	$id = $row['id'];
	$name = $row['name'];
?>
<form id="form<?php echo $id; ?>" name="form<?php echo $id; ?>" method="post" action="update_bank_info.php?bankid=<?php echo $id; ?>">
	<tr>
      <td align="left" width="80%" class="box-row">
      Bank name:&nbsp;<input name="bankname" type="text" id="bankname" size="80" value="<?php echo $name; ?>">
      </td>
      <td align="center" class="box-row">[&nbsp;<a href="javascript:document.form<?php echo $id; ?>.submit();">Update</a>&nbsp;]
      <?php /*&nbsp;|&nbsp;<span class="delete"><a href="#?bankid=<?php echo $id; ?>" onclick="return checkDelete()">Delete</a></span>*/ ?></td>
    </tr>
</form>
<?php
}
?>
  </tbody>
</table>
<br/><br/>---------- or ----------<br/><br/>
<form id="form_AddBank" name="form_AddBank" method="post" action="add_new_bank.php">
<table width="700" border="0" cellspacing="0" cellpadding="0" class="box">
  <tbody>
    <tr>
      <td colspan="2" align="center">Add a new bank</td>
    </tr>
    <tr>
      <td colspan="2" align="center">&nbsp;</td>
    </tr>
    <tr>
      <td align="left" width="80%" class="box-row">
      Bank name:&nbsp;<input name="bankname" type="text" id="bankname" size="80">
      </td>
      <td align="center" class="box-row">[&nbsp;<a href="javascript:document.form_AddBank.submit();">Add</a>&nbsp;]</td>
    </tr>
  </tbody>
</table>
</form>
<?php include 'admin_footer.php'; ?>