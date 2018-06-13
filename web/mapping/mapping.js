var map;
var markers = new Array();
var mi = 0;

function popupMap(mapTitle, address, boxMessage)
{
	
	
	
	showDiv('mapWrapper');
	
	
	getMap('mapPopup', address, 'Center Line Services Project ' + boxMessage);
	
}

function getMap(targetCtl, address, boxMessage) 
{
	var ct=AjaxGetElementReference(targetCtl);
	
	ct.style.height="400px";
	
	  if (GBrowserIsCompatible()) 
	  {
        map = new GMap2(document.getElementById(targetCtl));
		map.addControl(new GSmallMapControl());
		map.addControl(new GMapTypeControl());
		
		showAddress(address, boxMessage);
      }
}

function getMapByLatLng(targetCtl, lat, lng, boxMessage)
{
	SetInnerHTML('mapViewText', 'Map View: ' + lat + ', ' + lng);
		var ct=AjaxGetElementReference(targetCtl);
	
	ct.style.height="400px";
	
	  if (GBrowserIsCompatible()) 
	  {
        map = new GMap2(document.getElementById(targetCtl));
		map.addControl(new GLargeMapControl());
		map.addControl(new GMapTypeControl());
		map.addControl(new GScaleControl());
		map.enableScrollWheelZoom();
		
		
		map.setCenter(new GLatLng(lat, lng), 13);
		var marker = new GMarker(new GLatLng(lat, lng));
        map.addOverlay(marker);
        marker.openInfoWindowHtml(boxMessage);
      }
	
}

//

function getMapInline(targetCtl, address) 
{
	var ct=AjaxGetElementReference(targetCtl);
	
	//ct.style.height="200px";
	
	  if (GBrowserIsCompatible()) 
	  {
        map = new GMap2(document.getElementById(targetCtl));
		map.addControl(new GSmallMapControl());
		map.addControl(new GMapTypeControl());
		
		showAddressInline(address);
      }
}

function getMapNoMsg(targetCtl) 
{
	var ct=AjaxGetElementReference(targetCtl);
	
	ct.style.height="400px";
	
	  if (GBrowserIsCompatible()) 
	  {
        map = new GMap2(document.getElementById(targetCtl));
		map.addControl(new GSmallMapControl());
		map.addControl(new GMapTypeControl());
      }
}

function disableMap(targetCtl)
{
	var ct=AjaxGetElementReference(targetCtl);
	
	ct.style.height="auto";
}



function showAddress(address, bm) {
	var geocoder = new GClientGeocoder();
  geocoder.getLatLng(
    address,
    function(point) {
      if (!point) {
        //alert(address + " not found");
      } else {
        map.setCenter(point, 13);
        var marker = new GMarker(point);
        map.addOverlay(marker);
        marker.openInfoWindowHtml(bm);
      }
    }
  );
}

function showAddressInline(address) {
	var geocoder = new GClientGeocoder();
  geocoder.getLatLng(
    address,
    function(point) {
      if (!point) {
        //alert(address + " not found");
      } else {
        map.setCenter(point, 13);
        var marker = new GMarker(point);
        map.addOverlay(marker);
        
      }
    }
  );
}

function getLatitude(address) 
{
	var geocoder = new GClientGeocoder();
	geocoder.getLatLng(
    address,
    function(point) 
	{
		if(point)
		{
			
			SetValue('latitude', point.lat());
		}
		else
		{
			getLatitude('Las Cruces,NM,88001');
		}
	}
	);
}

function getLongitude(address) 
{
	var geocoder = new GClientGeocoder();
	geocoder.getLatLng(
    address,
    function(point) 
	{
		if(point)
		{
			SetValue('longitude', point.lng());
		}
		else
		{
			getLongitude('Las Cruces,NM,88001');
		}
	}
	);
}


function addAddress(address, bm, id) {
	var geocoder = new GClientGeocoder();
  geocoder.getLatLng(
    address,
    function(point) {
      if (!point) {
        //alert(address + " not found");
      } else {
        map.setCenter(point, 13);
        markers[mi] = new GMarker(point);
        map.addOverlay(markers[mi]);
        
		GEvent.addListener(markers[mi], "mouseover", function() {
    		//alert('marker ' + bm);
			SetInnerHTML('mapInfo', bm);
  		});
		GEvent.addListener(markers[mi], "mouseout", function() {
    		//alert('marker ' + bm);
			SetInnerHTML('mapInfo', '<strong>No project selected.</strong>');
  		});
		GEvent.addListener(markers[mi], "click", function() {
    		//alert('marker ' + bm);
			location.replace("projectView.cfm?id=" + id);
  		});

		mi++;
      }
	  map.setZoom(11);
    }
  );
}

function calcLatLng()
{
	var addressString;
	addressString = GetValue('address') + ',' + GetValue('city') + ',' + GetValue('state') + ',' + GetValue('zip');
	
	getLatitude(addressString);
	getLongitude(addressString);
	
	
}

function updateMap()
{
	var addressString;
	addressString = GetValue('address') + ',' + GetValue('city') + ',' + GetValue('state') + ',' + GetValue('zip');

	getMapInline('inlineMap', addressString);
}