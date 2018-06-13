// PopCal Ver 1.0 - The C-o-o-lest Pop Up Calendar!               |
// Copyright (C) 2004  Arun Narayanan     
// 
// PopCal Configuration File
//
// For information on the constants, refer to the manual provided.
// The manual can also be found at the following location:
// http://jsutils.sourceforge.net/

//Constants--------------------->
//The select box associated with the year shows years from
//MINYEAR to MAXYEAR. These are also used for some validations.
var MINYEAR = 1900; 
var MAXYEAR = 2099; 
//The Y2KYEAR parameter is used when determining whether a two
//digit year belongs to the 19th or 20th century. A value of 30
//for example would take years from 00 to 29 as 2000 - 2029 and
//year values from 30 to 99 as 1930 to 1999.
var Y2KYEAR = 50;

//DATEFORMAT: Should have (d or dd) and (m,mm,mmm or mmmm) and (y,yy or yyyy)
//Eg. For Mar 2, 2003:     2    02       3 03 Mar    March      3 03    2003
var DATEFORMAT = "mmmm d, yyyy"; 

//The below two parameters (CELLSIZE & WEEKHEAD_SIZE) are display related.
//For small english calendar optimum values can be 32 and 2 respectively
//For a bigger english calendar optimum values can be 36 and 3 respectively
var CELLSIZE = 32; //Size of a cell in pixels. Increasing this would increase the calendar window size.
var WEEKHEAD_SIZE = 2; //Size in characters of the Week Headings
//The following parameter (IMGDIR) stores the location of the path were the 
//calendar related images (the gif files found under the 'images' folder of the
//distribution zip. Specify the path with respect to the location of calling page
//(not the js location). Take care to end the path with a slash (/)
//If an absolute path or a path from the web root of a webserver is not specified
//the path might require to be set using the params argument of the 'popCal' function.
var IMGDIR = "images/"; 

//The below two parameters (MONTHS & WEEKS) store the names of the months and weeks.
//For a calendar in other languages, use equivalent month and week names.
var MONTHS = new Array("January","February","March","April","May","June","July","August","September","October","November","December");
var WEEKS = new Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday");

//For a calendar in other languages, change the following text to equivalents.
var CALENDAR_TITLE = "Calendar Year"; //Displayed in title bar of Popup
var TODAY_TEXT = "TODAY"; //Displayed on the TODAY button
var BLANK_TEXT = "BLANK"; //Displayed on the BLANK button
var PREV_YEAR_TEXT = "Click to see Previous Year";
var PREV_MONTH_TEXT = "Click to see Previous Month";
var NEXT_YEAR_TEXT = "Click to see Next Year";
var NEXT_MONTH_TEXT = "Click to see Next Month";
var SELECT_MONTH_TEXT = "Click to choose a Month";
var SELECT_YEAR_TEXT = "Click to choose the Year";
var GO_TO_TODAY_TEXT = "Click to see Current Month";
var SET_BLANK_DATE_TEXT = "Click to enter a Blank Date";
var CLOSE_CALENDAR_TEXT = "Close this Window";
var DEFAULT_STATUS_TEXT = "To choose a Date, click on the Day";
//END: Constants---------------->