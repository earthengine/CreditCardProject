<?php include 'page_top.php'; ?>
    <div class="content">
    	<div class="content-banner">My Card</div>
        <div class="content-box">
        	<div class="box-main">
            	<div class="box-title">My current cards</div>		
					<p><a href="#" id="dialog-link" class="ui-state-default ui-corner-all"><span class="ui-icon ui-icon-newwin"></span>Add Card</a></p>
                    <div class="box-row" id="wallet">
                    </div>
                    <div class="box-row">More card info..</div>
            </div>
        </div>
    </div>

<div id="add-card" title="Dialog Title">
	<table>
		<tr><td>Bank:<td><td><select><option value="ANZ" selected="yes">ANZ</option></select></td></tr>
		<tr><td>Card:<td><td><select><option value="ARW Classic" selected="yes">ARW Classic</option></select></td></tr>
		<tr><td>Average spend (monthly):<td><td><input value="4000"></td></tr>
		<tr><td>Balance paid off:<td><td><select><option value="All" selected="yes">All</option><option value="Min" selected="yes">Mininum</option></select></td></tr>
		<tr><td>Percentage spend on AMEX:<td><td><input value="25">%</td></tr>
	</table>	
</div>

<?php include 'page_footer.php'; ?>
