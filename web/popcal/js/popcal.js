/*****************************************************************\
|                                                                 |
|  Fair License                                                   |
|                                                                 |
|  PopCal Ver 1.0 - The C-o-o-lest Pop Up Calendar!               |
|  Copyright (C) 2004  Arun Narayanan                             |
|                                                                 |
|  For Latest Release visit:                                      |
|  http://jsutils.sourceforge.net/                                |
|                                                                 |
|  Usage of the works is permitted provided that this             |
|  instrument is retained with the works, so that any entity      |
|  that uses the works is notified of this instrument.            |
|                                                                 |
|  DISCLAIMER: THE WORKS ARE WITHOUT WARRANTY.                    |
|                                                                 |
|  [2004, Fair License: rhid.com/fair]                            |
|                                                                 |
\*****************************************************************/

//Global Variables-------------->
var today;
var original;
var currcell = null;
var currfield = null;
var win = null;
var dstart, dend; //month start and end cell numbers
var savedparams = "";
var DEBUGMSG; //Used by in-built debugger
var DEBUG = false; //set it to true to see javascript errors
//END: Global Variables--------->

//Initializing Functions--------->
function popCal(field,params)
{
  var v, a, f, i, year = 0, month = 0, day = 1;

  DEBUGMSG = "Function: popCal";

  window.onerror = showErrMsg;

  if (field == null)
  {
    i = event.srcElement.sourceIndex;
    if (i > 1)
    {
      v = document.all[i - 1];
      if (v && v.tagName == "INPUT" && v.type == "text")
        field = v;
      else
      {
        showErrMsg("DEBUG:Unable to determine date field");
        return;
      }
    }
  }

  currfield = eval(field); //in case string is passed instead of obj

  if (currfield.tagName == "INPUT")
    v = currfield.value;
  else
    v = currfield.innerHTML;
  currcell = null;

  if (win && !win.closed)
  closeWindow();

  if (savedparams != "") //restore saved default settings
    eval(savedparams);

  processParameters(params);

  if (!checkDateFormat()) return;

  a = v.match(/\w+/g);
  f = DATEFORMAT.match(/\w+/g);

  if (a && a.length == f.length)
  {
    for (i=0;i<f.length;i++)
    {
      if (/d|dd/.test(f[i]) && /\d{1,2}/.test(a[i]))
        day = parseIntZero(a[i]);
      else if (/yyyy/.test(f[i]) && /\d{4}/.test(a[i]))
        year = parseIntZero(a[i]);
      else if (/y|yy/.test(f[i]) && /\d{1,2}/.test(a[i]))
      {
        year = parseIntZero(a[i]);
        year += (year < Y2KYEAR) ? 2000 : 1900;
      }	
      else if (/mmm|mmmm/.test(f[i]) && /\w{3,}/.test(a[i]))
      {
        var r = new RegExp(a[i].substr(0,3),"i");
        for (j=0;j<12;j++)
        {
          if (r.test(MONTHS[j]))
          {
            month = j + 1;
            break;
          }
        }
      }
      else if (/m|mm/.test(f[i]) && /\d{1,2}/.test(a[i]))
        month = parseIntZero(a[i]);
    }
  }
  original = { day: day, month: month, year: year }
  initCalendar(month,year);
  win.fbkwd.focus();
}

function initCalendar(month,year)
{
  var dt = new Date();
  
  today = { day: dt.getDate(), month: dt.getMonth() + 1, year: dt.getFullYear(), week: dt.getDay() }

  openWindow();

  drawTable();

  //If month or year is not valid reset to current month/year
  if (!(month && month > 0 && month <= 12))
    win.selmonth.value = today.month;
  else
    win.selmonth.value = month;
  if (!(year && year >= MINYEAR && year <= MAXYEAR))
    win.selyear.value = today.year;  
  else
    win.selyear.value = year;  

  updateCalendar();
  win.maintab.style.display = "inline";
  showStatus();
}
//END: Initializing Functions---->

//Core Functions----------------->
function drawTable()
{
  var i, j, w = "", cls;

  w += "<html><head><title>Calendar</title>";
  w += "<style>";
  w += "body { margin:0px; background-color:buttonface;}";
  w += "body,td,a,th,select { cursor:default; font-family:Arial; font-size:8pt; font-weight:bold; color:black; }";
  w += "#selmonth { position:absolute; z-index:1; display:none; }";
  w += "#selyear { position:absolute; z-index:1; display:none; }";
  w += "#maintab { display:none; }";
  w += "#dispstatus { background-color:window; color:windowtext; font-weight:normal; text-align: center; height:20px; font-size:7pt; border:1px solid buttonhighlight; border-left-color:buttonshadow; border-top-color:buttonshadow; }";
  w += "td.cal_normal, td.cal_hilite, td.cal_holiday { " + "height:" + CELLSIZE + "px; width:" + CELLSIZE + "px; padding:1px; text-align:center; color:black; }";
  w += "td.cal_button, td.cal_arrow, td.cal_button2 { text-align: center; padding:1px; border:1px solid buttonhighlight; background-color:buttonface; border-right-color:buttonshadow; border-bottom-color:buttonshadow; color:buttontext; }";
  w += "td.cal_button { background: buttonface url(" + IMGDIR + "pick.gif) no-repeat 100% 100%; }";
  w += "td.cal_arrow { height:16px; width:16px; } ";
  w += "#fwd { background: buttonface url(" + IMGDIR + "fwd.gif) no-repeat 50% 50%; }";
  w += "#ffwd { background: buttonface url(" + IMGDIR + "ffwd.gif) no-repeat 50% 50%; }";
  w += "#bkwd { background: buttonface url(" + IMGDIR + "bkwd.gif) no-repeat 50% 50%; }";
  w += "#fbkwd { background: buttonface url(" + IMGDIR + "fbkwd.gif) no-repeat 50% 50%; } ";
  w += "th { background-color:black; color:white; text-align:center;}";
  w += "td.cal_normal { border:1px solid white; background-color:#dddddd; border-right-color:#999999; border-bottom-color:#999999; }";
  w += "td.cal_hilite { padding:0px; border:2px solid white; background-color:#eeeeee; border-right-color:#666666; border-bottom-color:#666666; }";
  w += "td.cal_holiday { border:1px solid white; background-color:#cccccc; border-right-color:#999999; border-bottom-color:#999999; }";
  w += "</style>";
  w += "</head><body></body></html>";

  win.document.write(w);

  w = "<select id=selmonth size=12 onchange='opener.updateCalendar()' " +
      "onclick='opener.hideDropdowns()' onblur='opener.hideDropdowns()' " +
      "onkeydown='opener.downKeySelectBox()' tabindex=4>";
  for (i=0;i<12;i++)
    w += "<option value='" + (i+1) + "'>" + MONTHS[i] + "</option>";
  w += "</select>";  
  w += "<select id=selyear size=8 onchange='opener.updateCalendar()' " +
      "onclick='opener.hideDropdowns()' onblur='opener.hideDropdowns()' " +
      "onkeydown='opener.downKeySelectBox()' tabindex=6>";
  for (i=MINYEAR;i<=MAXYEAR;i++)
    w += "<option value='" + i + "'>" + i + "</option>";
  w += "</select>";  
  w += "<table onkeydown='opener.downKey()' onmouseover='opener.setFocusHandler()' id=maintab border=0 cellspacing=0 cellpadding=0>";
  w += "<tr><td>";

  w += "<table onmouseover='opener.overButton()' onmouseout='opener.outButton()'" +
       " border=0 width='100%' cellspacing=0 cellpadding=0>";  
  w += "<tr><td id=fbkwd onclick=\"opener.go('<<')\" class=cal_arrow tabindex=1>&nbsp;</td>";
  w += "<td id=bkwd onclick=\"opener.go('<')\" class=cal_arrow tabindex=2>&nbsp;</td>";
  w += "<td id=dispmonth class=cal_button onclick='opener.toggle(this,selmonth)' tabindex=3>";
  w += "</td><td id=dispyear width=60 class=cal_button onclick='opener.toggle(this,selyear)' tabindex=5>";      
  w += "</td><td id=fwd onclick=\"opener.go('>')\" class=cal_arrow tabindex=7>&nbsp;";
  w += "</td><td id=ffwd onclick=\"opener.go('>>')\" class=cal_arrow tabindex=8>&nbsp;";    
  w += "</td></tr>";
  w += "</table>";
  
  w += "</td></tr><tr><td>";
  
  w += "<table onmouseover='opener.hideDropdowns();opener.overCell()' " +
       "onclick='opener.setDate()' onmouseout='opener.outCell()' " +
       "border=0 cellspacing=0 cellpadding=0>";
  w += "<tr>"
  for (i=0;i<7;i++)
    w += "<th id=w" + i + ">" + WEEKS[i].substr(0,WEEKHEAD_SIZE) + "</th>";
  w += "</tr>"
  for (i=0; i<5; i++)
  {
    w += "<tr>";
    for (j=0; j<7; j++)
    {
      cls = (j==0 || j==6) ? "cal_holiday" : "cal_normal";
      w += "<td id=a" + (i * 7 + j) + " class=" + cls + "> </td>";
    }
    w += "</tr>";
  }
  w += "</table>";
  
  w += "</td></tr><tr><td id=dispstatus></td></tr><tr><td>";
  
  w += "<table  onmouseover='opener.overButton()' onmouseout='opener.outButton()'" +
       " border=0 width='100%' cellspacing=0 cellpadding=0>";  
  
  w += "<tr><td id=disptoday class=cal_button2 tabindex=40 onclick=\"opener.go('today')\">";
  w += TODAY_TEXT + ": " + MONTHS[today.month-1].substr(0,3) + " " + today.day + ", " + today.year;    
  w += "</td><td id=butblank class=cal_button2 tabindex=41 onclick='opener.setBlankDate()'>"
       + BLANK_TEXT + "</td>";
  w += "<td id=butclose class=cal_arrow tabindex=41 onclick='opener.closeWindow()'>&#x00d7;</td>";
  w += "</tr>";
  w += "</table>";  

  w += "</td></tr>";
  w += "</table>";
  
  win.document.body.innerHTML = w;
}

function updateCalendar()
{
  var k, i, j = 1, tip, td;

  month = win.selmonth.value;
  year = win.selyear.value;
  win.dispmonth.innerText = win.selmonth.options[win.selmonth.selectedIndex].text;
  win.dispyear.innerText = win.selyear.value;

  win.document.title = CALENDAR_TITLE + ": " + win.selyear.value +
                       " ....................................";
  dstart = getFirstDay(month, year);
  dend = getLastDay(month, year) + dstart;
  for (i=0;i<35;i++) 
  {
    td = eval("win.a" + i);
    td.innerText = " ";
    td.style.backgroundImage = 'url(none)'; //reset today marking
    td.style.backgroundPosition = "center center";
    td.style.backgroundRepeat = "no-repeat";
    td.tabIndex = "-1";
  }
  for (i=dstart;i<dend;i++)
  {
    td = eval("win.a" + (i%35));
    td.tabIndex = j + 8;
    td.innerText = j++;
  }
  
  var isCurrMonth = false;
  if (month == today.month && year == today.year)
  {
    td = eval("win.a" + (dstart - 1 + today.day)%35);
    td.style.backgroundImage = "url(" + IMGDIR + "today.gif)";
    isCurrMonth = true;
  }

  if (month == original.month && year == original.year)
  {
    td = eval("win.a" + (dstart - 1 + original.day)%35);
    if (isCurrMonth && today.day == original.day)
      td.style.backgroundImage = "url(" + IMGDIR + "origtoday.gif)";
    else
      td.style.backgroundImage = "url(" + IMGDIR + "origday.gif)";
    td.style.backgroundRepeat = "no-repeat";
  }
  
//  hideDropdowns();
}
//END: Core Functions------------>

//Event Handler Functions-------->
function overCell()
{

  var obj = win.event.srcElement;
  
  if (currcell == obj) return;
  
  if (/^w\d$/.test(obj.id)) //week headings
    showStatus(WEEKS[parseInt(obj.id.substr(1))]);
  else if (obj.innerText != " ")
  {
    obj.className = "cal_hilite";
    var i = parseInt(obj.id.substr(1)) % 7;
    showStatus(WEEKS[i] + ", " + MONTHS[win.selmonth.value-1] 
               + " " + obj.innerText + ", " + win.selyear.value);
  }  
  currcell = obj;
}

function outCell()
{
  currcell = null;

  var obj = win.event.srcElement;

  if (obj.innerText == " ") return;
  
  var i = parseInt(obj.id.substr(1)) % 7;
  
  if (i == 0 || i == 6)
    obj.className = "cal_holiday";
  else
    obj.className = "cal_normal";

  showStatus();
}

function overButton()
{
  var s = null;
  var td = win.event.srcElement;

  //Give a pressed button look
  //td.style.borderRightColor = td.style.borderBottomColor = "ButtonHighlight";
  //td.style.borderLeftColor = td.style.borderTopColor = "ButtonShadow";

  switch (td.id)
  {
    case "fbkwd": 
      s = PREV_YEAR_TEXT;
      break;
    case "bkwd": 
      s = PREV_MONTH_TEXT;
      break;
    case "ffwd":
      s = NEXT_YEAR_TEXT;
      break;
    case "fwd":
      s = NEXT_MONTH_TEXT;
      break;
    case "dispmonth":
      s = SELECT_MONTH_TEXT;
      break;
    case "dispyear":
      s = SELECT_YEAR_TEXT;
      break;
    case "disptoday":
      s = GO_TO_TODAY_TEXT;
      break;
    case "butblank":
      s = SET_BLANK_DATE_TEXT;
      break;
    case "butclose":
      s = CLOSE_CALENDAR_TEXT;
      break;
  }
  showStatus(s);
}

function outButton()
{
  var td = win.event.srcElement;
  
  //Give an unpressed button look
  td.style.borderRightColor = td.style.borderBottomColor = "ButtonShadow";
  td.style.borderLeftColor = td.style.borderTopColor = "ButtonHighlight";

  showStatus();
}

function downKey()
{
  var p, i;

//  showStatus("Key: " + win.event.keyCode + "  ID: " + win.event.srcElement.id);
  var k = win.event.keyCode;
  var e = win.event.srcElement;
  
  if (k == 13) //ENTER key pressed
    win.event.srcElement.click();
  else if (k == 39) //Right arrow pressed
  {
    if (e.id == "butclose")
      win.fbkwd.focus();
    else
      win.event.keyCode = 9; //simulate TAB press
  }
  else if (k == 40) //Down arrow pressed
  {
    if (/^a\d{1,2}$/.test(e.id)) //if calendar cell
    {
      i = parseInt(e.id.substr(1)) + 7;
      p = eval("win.a" + i);
      if (i < 35 && p.innerText != " ")
        p.focus();
      else
        win.disptoday.focus();
    }
    else if (/(disptoday|butblank|butclose)/.test(e.id))
      win.fbkwd.focus();
    else
      eval("win.a" + dstart).focus();
  }
  else if (k == 38) //Up arrow pressed
  {
    if (/^a\d{1,2}/.test(e.id)) //if calendar cell
    {
      i = parseInt(e.id.substr(1)) - 7;
      p = eval("win.a" + i);
      if (i >= 0 && p.innerText != " ")
        p.focus();
      else
        win.fbkwd.focus();
    }
    else if (/(disptoday|butblank|butclose)/.test(e.id))
      eval("win.a" + ((dend -1) % 35)).focus();
    else
      win.fbkwd.focus();
  }
  else if (k == 37) //Left arrow pressed
  {
    if (e.id == "a" + dstart)
      win.ffwd.focus();
    else if (e.id == "disptoday")
      eval("win.a" + ((dend -1) % 35)).focus();
    else if (e.id == "fbkwd")
      win.butclose.focus();
    else if (p = e.previousSibling)
      p.focus();
    else if (p = e.parentElement.previousSibling)
    {
      p.lastChild.focus();
//      alert(e.parentNode.tagName);
    }
  }
}

function downKeySelectBox()
{
  var k = win.event.keyCode;
  
  if (k == 27 || k == 13) //ESC or ENTER key pressed
    hideDropdowns();
}

function setFocusHandler()
{
  var obj = win.event.srcElement;

  if (parseInt(obj.tabIndex) > 0)
    obj.focus();
}

function go(direction)
{
  var month = win.selmonth.value, year = win.selyear.value;

  switch (direction)
  {
    case ">" : 
      if (month == 12 && year < MAXYEAR) 
      {
        year++;
        month = 1;
      }
      else if (month < 12)
        month++;
      break;
      
    case ">>" : 
      if (year < MAXYEAR) 
        year++;
      break;
      
    case "<" : 
      if (month == 1 && year > MINYEAR) 
      {
        year--;
        month = 12;
      }
      else if (month > 1)
        month--;
      break;
      
    case "<<" : 
      if (year > MINYEAR) 
        year--;
      break;

    case "today" : 
      month = today.month;
      year = today.year;
  }

  win.selmonth.value = month;
  win.selyear.value = year;
  
  updateCalendar();
}

function toggle(t,obj)
{
  if (obj.style.display == "inline")
    obj.style.display = "none";
  else
  {
    obj.style.left = t.offsetLeft;
    obj.style.top = t.offsetHeight;    
    obj.style.width = t.offsetWidth;
    obj.style.display = "inline";    
    obj.focus();
  }
  
  //hide the other dropdown if displayed currently
  if (obj.id == "selmonth")
    win.selyear.style.display = "none";
  else
    win.selmonth.style.display = "none";  
}
//END: Event Handler Functions--->

//Utility Functions-------------->
function trimStr(str)
{
  return str.replace(/^\s+|\s+$/g,"");
}

function processParameters(params)
{
  var p, v, i;

  DEBUGMSG = "Function: processParameters\nRecheck the parameters passed to the popCal function.";
  if (params == null || params == "") return;

  savedparams = "";

  p = params.split(";");

  for (i = 0; i < p.length; i++)
  {
    if (!/^[a-zA-Z_ ]+=/.test(p[i])) continue;
    v = p[i].split("=");
    if (v.length == 2)
    {
      v[0] = trimStr(v[0]).toUpperCase();
      v[1] = trimStr(v[1]);
      if (/^(MINYEAR|MAXYEAR|Y2KYEAR|CELLSIZE|WEEKHEAD_SIZE)$/.test(v[0]) &&
         /^\s*\d+\s*$/.test(v[1]))
      {
        savedparams += v[0] + "=" + eval(v[0]) + ";";
        eval(p[i]);
      }
      else if (/^(MONTHS|WEEKS)$/.test(v[0]))
      {
        savedparams += v[0] + '="' + eval(v[0]) + '".split(",");';
        eval(v[0] + '="' + v[1] + '".split(",")');
      }
      else if (eval(v[0]) != "undefined")
      {
        savedparams += v[0] + '="' + eval(v[0]) + '";';
        eval(v[0] + '="' + v[1] + '"');
      }
    }
  }
}

function showErrMsg(msg,url,line)
{
  var s = "POPCAL DEBUGGER:\n\n";

  if (!DEBUG) return true;

  if (/^DEBUG:/.test(msg)) //custom error message
    s += msg;
  else
  {
    s += "An error was been caught.\n" +
      "Error: " + msg + "\nLine: " + line + "\n" +
      "URL: " + url;
  } 

  if (DEBUGMSG != "")
    s += "\n\nAdditional Info:\n" + DEBUGMSG;
  
  DEBUGMSG = "";
  
  alert(s);
  return true;
}

function checkDateFormat()
{
  var df = DATEFORMAT;
///d|dd/.test(df) && 
  if (/m|mm|mmm|mmmm/.test(df) && /y|yy|yyyy/.test(df))
    return true;
  else
  {
    showErrMsg("DEBUG:Unknown Date Format (" + df + ")!\n\n" +
          "Make sure the config file and/or the params are correct.\n" +
          "Month and year format are mandatory.");
    return false;
  }
}

function setDate()
{
  var d, df;

  var obj = win.event.srcElement;

  //Check for valid cell click
  if (!/^a\d{1,2}$/.test(obj.id)) return;
  if (obj.innerText == " ") return;
  
  var day = parseInt(obj.innerText);
  var month = win.selmonth.value;
  var year = win.selyear.value;
  var week = WEEKS[parseInt(obj.id.substr(1)) % 7];

  d = df = DATEFORMAT;
  
  if (/mmmm/.test(df))
    d = d.replace("mmmm",MONTHS[month-1]);
  else if (/mmm/.test(df))
    d = d.replace("mmm",MONTHS[month-1].substr(0,3));
  else if (/mm/.test(df))
    d = d.replace("mm",padOneZero(month));
  else if (/m/.test(df))
    d = d.replace("m",month);

  if (/wwww/.test(df))
    d = d.replace("wwww",week);
  else if (/www/.test(df))
    d = d.replace("www",week.substr(0,3));
  else if (/ww/.test(df))
    d = d.replace("ww",week.substr(0,2));

  if (/yyyy/.test(df))
    d = d.replace("yyyy",year);
  else if (/yy/.test(df))
    d = d.replace("yy",padOneZero(year%100));
  else if (/y/.test(df))
    d = d.replace("y",year%100);

  if (/dd/.test(df))
    d = d.replace("dd",padOneZero(day));
  else if (/d/.test(df))
    d = d.replace("d",day);
  
  if (currfield.tagName == "INPUT")
    currfield.value = d;
  else
    currfield.innerHTML = d;

  closeWindow();
}

function setBlankDate()
{
  if (currfield.tagName == "INPUT")
    currfield.value = "";
  else
    currfield.innerHTML = "";

  closeWindow();
}


function openWindow()
{
  var w = 7 * CELLSIZE + 28;
  var h = 5 * CELLSIZE + 76; 
  var l = window.screenLeft + currfield.offsetLeft - document.body.scrollLeft;
  var t = window.screenTop + currfield.offsetTop + currfield.offsetHeight - document.body.scrollTop;
  if (l + w > screen.availWidth) 
    l = screen.availWidth - w;
  if (t + h + 30 > screen.availHeight) 
    t = t - h - currfield.offsetHeight - 30;
  if (t < 0) t = 0;
  if (l < 0) l = 0;
  var settings = "width=" + w + ",height=" + h + ",top=" + t + ",left=" + l + 
                 ",status=no,toolbar=no,menubar=no,location=no,resize=no";

  win = window.open("","calWin",settings);
  window.onunload = closeWindow;
}

function closeWindow()
{
  if (win) win.close();
  win = null;
}

function padOneZero(num)
{
  if (num < 10)
    return "0" + num;
  else
    return num;
}

function parseIntZero(str)
{
  return parseInt(str.replace(/^0+/,"")); //remove leading zeros
}

function getFirstDay(month, year)
{
  var d = new Date(year, month-1, 1);
  return d.getDay();
}

function getLastDay(month, year)
{ 
  var numdays = new Array(31,28,31,30,31,30,31,31,30,31,30,31);
  
  if ( (month == 2) && (year%4 == 0) && (year%100 != 0)) //Leap year check for February
    return 29;

  return numdays[month-1];
}

function showStatus(status_str)
{
  if (status_str == null || status_str == "" || status_str == "undefined")
    status_str = DEFAULT_STATUS_TEXT;
  win.dispstatus.innerText = status_str;
}

function hideDropdowns()
{
  //hide both the dropdowns
  win.selyear.style.display = "none";
  win.selmonth.style.display = "none";
}
//END: Utility Functions--------->