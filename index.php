<?php include 'page_top.php'; ?>
    <div class="content">
    	<div class="content-banner">My Card</div>
        <div class="content-box">
        	<div class="box-main">
            	<div class="box-title">What card(s) do you have?</div>
                <form id="form1" name="form1" method="post" action="">
                <div class="box-row">
                <label for="bank">Bank&nbsp;&nbsp;</label>
                <select name="bank" id="bank" onchange="getCard();">
                	<option selected>- Please select a bank -</option>
                </select>&nbsp;&nbsp;
                <label for="card">Card&nbsp;&nbsp;</label>
                <select name="card" id="card" onchange="getCardImage();"></select>
                </div>
                <div class="box-row">
                	<div id="cardimage"></div>
                </div>
                <div class="box-row">
                <table width="400" border="0" cellspacing="2" cellpadding="2">
                  <tbody>
                    <tr>
                      <td width="45%" align="left">
                      <label for="textfield">Average monthly spend&nbsp;&nbsp;</label>
                      </td>
                      <td align="left">
                      <input type="text" name="ams" id="ams" onkeypress="return event.keyCode>=48&&event.keyCode<=57||event.keyCode==46" onpaste="return !clipboardData.getData('text').match(/\D/)" ondragenter="return false" style="ime-mode:Disabled">
                      </td>
                    </tr>
                    <tr>
                      <td align="left"><label for="bpem">Balance paid each month&nbsp;&nbsp;</label></td>
                      <td align="left">
                      <select name="bpem" id="bpem">
                           <option value="0">All</option>
                           <option value="1">Min Balance</option>
                           <option value="2">&lt;50%</option>
                           <option value="3">&gt;50%</option>
                       </select>
                      </td>
                    </tr>
                    <tr>
                      <td align="left"><label for="pir">Purchase interest rate&nbsp;&nbsp;</label></td>
                      <td align="left"><input type="text" name="pir" id="pir"></td>
                    </tr>
                    <tr>
                      <td align="left"><label for="af">Annual fees&nbsp;&nbsp;</label></td>
                      <td align="left"><input type="text" name="af" id="af"></td>
                    </tr>
                  </tbody>
                </table>
                </div>
                <div class="box-row"><input type="submit" name="submit" id="submit" class="btn btn-green" value="Add Card" /></div>
                </form>
            </div>
        	<div class="box-main">
            	<div class="box-title">My current cards</div>
                <div class="box-row">
                    <div class="box-row-card">&nbsp;</div>
                </div>
            </div>
            <div class="box-main">
            	<div class="box-title">More information about yourself</div>
                <?php
                $q = getQuestions($conn);
				for($i=0; $i<count($q); $i++){
				?>
                <div class="box-row">
				<?php
					echo $q[$i][1]."<br/>";
					$a = getAnswers($conn, $q[$i][0]);
					for($j=0; $j<count($a); $j++){
				?>
                <label>
                <input type="radio" name="<?php echo "Q".$q[$i][0]; ?>" value="<?php echo $a[$j][0]; ?>" id="<?php echo "Q".$q[$i][0]."_".$j; ?>">
                <?php echo $a[$j][1]; ?></label><br/>
				<?php
					}
				?>
				</div>
				<?php
				}
				?>
            </div>
        </div>
    </div>
<?php include 'page_footer.php'; ?>
