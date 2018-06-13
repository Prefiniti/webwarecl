<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Search Jobs</title>
<link href="centerline.css" rel="stylesheet" type="text/css" />
<script src="/Components/AJAX/ajax.js" type="text/javascript"></script>
<script language="javascript">
	
	function DoSearch(str)
	{
		var url;
		var sfield;
		var stype;
		
		sfield = AjaxGetCheckedValue("SearchField");
		stype = AjaxGetCheckedValue("SearchType");
		
		url = "forms/searchSub.cfm?SearchType=";
		url += stype;
		url += "&SearchField=";
		url += sfield;
		url += "&SearchValue=";
		url += escape(str);
		

		//alert(url);
		AjaxLoadPageToDiv("SearchResults", url);
	}
</script>
</head>
<body>
<form name="searchForm" >

  <table width="800" class="midTable" align="center" border="0">
    <tr>
      <th colspan="3">Search Jobs</th>
    </tr>
    <tr>
      <td>Search By:</td>
      <td colspan="2"><p>
          <label>
          <input type="radio" name="SearchField" value="clsJobNumber"  />
          Job Number</label>
          <br />
          <label>
          <input type="radio" name="SearchField" value="subdivision" checked/>
          Subdivision</label>
          <br />
          <label>
          <input type="radio" name="SearchField" value="address"/>
          Address</label>
          <br />
          <label>
          <input type="radio" name="SearchField" value="section"/>
          Section</label>
          <br />
          <label>
          <input type="radio" name="SearchField" value="township"/>
          Township</label>
          <br />
          <label>
          <input type="radio" name="SearchField" value="range"/>
          Range</label>
        </p></td>
    </tr>
    <tr>
      <td>Search Criteria:</td>
      <td><p>
          <label>
          <input type="radio" name="SearchType" value="BeginsWith" />
          Begins With</label>
          <br />
          <label>
          <input type="radio" name="SearchType" value="Contains" checked />
          Contains</label>
          <br />
        </p></td>
      <td><input name="SearchValue" type="text" size="60" onkeyup="DoSearch(this.value)" /></td>
    </tr>
    <!--- 	<tr>
	<td colspan="3" align="right"><input name="submit" type="submit" class="normalButton" value="Search Jobs" /></td>
	</tr> --->
  </table>
</form>
<table width="800" class="midTable" align="center" border="0">
  <tr>
    <td><div id="SearchResults">  </div></td>
  </tr>
</table>
</body>
</html>
