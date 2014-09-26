<?php include 'page_top.php'; ?>
    <div class="content">
    	<div class="content-banner">My Card</div>
        <div class="content-box">
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
        	<div class="box-main">
            	<div class="box-title">My current cards</div>
                <p><a href="#" id="dialog-link" class="ui-state-default ui-corner-all"><span class="ui-icon ui-icon-newwin"></span>Add Card</a></p>
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