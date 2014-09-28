<?php include 'admin_top.php'; ?>
<table width="400" border="0" cellspacing="2" cellpadding="2" class="box">
  <tbody>
    <tr>
      <td>
      	<script language="javascript">getBank();getCard();</script>
      	<label for="bank">Bank&nbsp;&nbsp;</label>
        <select name="bank" id="bank" onchange="getCard();">
            <option selected>- Please select a bank -</option>
        </select>&nbsp;&nbsp;
      </td>
    </tr>
    <tr>
      <td>
		<label for="card">Card&nbsp;&nbsp;</label>
		<select name="card" id="card" onchange="getCardImage();"></select>
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
  </tbody>
</table>
<?php include 'admin_footer.php'; ?>