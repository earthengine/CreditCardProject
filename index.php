<?php include 'page_top.php'; ?>
    <div class="content">
    	<div class="content-banner">My Card</div>
        <div class="content-box">
        	<div class="box-main">
            	<div class="box-title">My current cards
		<span id="button-add-card"><a href="#" id="add-card-link" class="jq-button ui-state-default ui-corner-all"><span class="ui-icon ui-icon-newwin"></span>Add Card</a></span>
		</div>
                <div id="wallet" class="box-row">
                    
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

<div id="add-card" title="Add Card">
	<table>
		<tr><td><label for="bank">Bank</label></td><td><select name="bank" id="bank" onchange="getCard();">
                	<option selected>Please wait...</option>
                </select></td></tr>
		<tr><td><label for="card">Card</label></td>
                    <td><select name="card" id="card" onchange="getCardImage();"><option selected>Please wait...</option></select></td></tr>
		<tr><td colspan="2"><div class="box-row">
                	<div id="cardimage"></div>
                </div></td></tr>
		<tr><td><label for="ams">Average monthly spend</label></td><td><input type="text" name="ams" 
		id="ams" onkeypress="return event.keyCode>=48&&event.keyCode<=57||event.keyCode==46;" 
		onpaste="return !clipboardData.getData('text').match(/\D/);" ondragenter="return false;" style="ime-mode:Disabled" value="4000"></td></tr>
		<tr><td>Balance paid off:</td><td><select name="bpem" id="bpem">
                           <option value="0">All</option>
                           <option value="1">Min Balance</option>
                           <option value="2">&lt;50%</option>
                           <option value="3">&gt;50%</option>
                       </select></td></tr>
		<tr><td><label for="pir">Purchase interest rate</label></td><td><input type="text" name="pir" id="pir" value="19">%</td></tr>
		<tr><td><label for="psa">Percentage spend on AMEX</label></td><td><input value="25" id="psa">%</td></tr>
                    <tr>
                      <td align="left"><label for="af">Annual fees&nbsp;&nbsp;</label></td>
                      <td align="left"><input type="text" name="af" id="af"></td>
                    </tr>
	</table>	
</div>

<div id="wallet-card-template" style="display:none">
  <div class="box-row-card wallet-card">
    <img class="wallet-card-image" alt="ANZ Rewards Black">
    <div class="div-text wallet-label">ANZ Rewards Black With AMEX ($4000)</div>
    <a href="#" class="ui-state-default ui-corner-all delete-card jq-button"><span class="ui-icon ui-icon-newwin"></span>Delete Card</a>
    <a href="#" class="ui-state-default ui-corner-all edit-card jq-button"><span class="ui-icon ui-icon-newwin"></span>Edit Card</a>
  </div>
</div>

<?php include 'page_footer.php'; ?>
