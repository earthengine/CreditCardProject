<?php include 'admin_top.php'; ?>
- Questions &amp; Answers -<br/><br/>
<table width="800" border="0" cellspacing="0" cellpadding="0" class="box">
  <tbody>
  <tr>
  	<td colspan="2" align="center">Edit questions &amp; answers</td>
  </tr>
  <tr>
  	<td colspan="2" align="center">&nbsp;</td>
  </tr>
  <?php
  $q = getQuestions($conn);
  for($i=0; $i<count($q); $i++){
  ?>
  <form id="form_q<?php echo $q[$i][0]; ?>" name="form_q<?php echo $q[$i][0]; ?>" method="post" action="update_question.php">
  <input name="qid" type="hidden" value="<?php echo $q[$i][0]; ?>" />
  <tr>
  	<td width="75%" align="left" class="box-row">Question:&nbsp;<input name="question" type="text" id="question" size="85" value="<?php echo $q[$i][1]; ?>"></td>
    <td class="box-row" align="left">[<a href="javascript:document.form_q<?php echo $q[$i][0]; ?>.submit();">Update</a>]&nbsp;[<span class="delete"><a href="delete_question.php?qid=<?php echo $q[$i][0]; ?>" onclick="return checkDelete()">Delete</a></span>]</td>
  </tr>
  </form>
  <tr>
  	<td align="left" colspan="2" class="box-row">
  <?php
  	$a = getAnswers($conn, $q[$i][0]);
	for($j=0; $j<count($a); $j++){
  ?>
    <form id="form_a<?php echo $a[$j][0]; ?>" name="form_a<?php echo $a[$j][0]; ?>" method="post" action="update_answer.php">
    <input name="qid" type="hidden" value="<?php echo $q[$i][0]; ?>" />
    <input name="aid" type="hidden" value="<?php echo $a[$j][0]; ?>" />
    <?php
    if( $j == 0 ){
		echo "Answers:&nbsp;";
	}else{
		echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
	}
	?>
    <input name="answer" type="text" id="answer" size="25" value="<?php echo $a[$j][1]; ?>">
    <?php
    if( $j == 0 ){
		echo "&nbsp;&nbsp;Order:&nbsp;";
	}else{
		echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
	}
	?>
    <input name="order" type="text" id="order" size="2" value="<?php echo $a[$j][2]; ?>">
    &nbsp;&nbsp;[<a href="javascript:document.form_a<?php echo $a[$j][0]; ?>.submit();">Update</a>]&nbsp;[<span class="delete"><a href="delete_answer.php?aid=<?php echo $a[$j][0]; ?>" onclick="return checkDelete()">Delete</a></span>]
    </form><br/>
  <?php
	}
  ?>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[&nbsp;<a href="add_new_answer.php?qid=<?php echo $q[$i][0]; ?>">+&nbsp;Add a new answer</a>&nbsp;]<br/><br/>
    </td>
  </tr>
  <?php
  }
  ?>
  </tbody>
</table>
<?php include 'admin_footer.php'; ?>