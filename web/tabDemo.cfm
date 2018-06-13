<div id="tabBars" class="tabBar">

</div>
<br>
<label>Tab ID (must be alphabetical chars, no spaces): <input type="text" id="tabID" name="tabID"/></label><br>
<label>Caption: <input type="text" id="tabHTML" name="tabInnerHTML" /></label><br>
<input type="button" onclick="addTabButton(GetValue('tabID'), 'tcTarget', GetValue('tabHTML'), false);" value="Add Tab" />
<!---function addTabButton(tabID, targetDivID, caption, active) --->