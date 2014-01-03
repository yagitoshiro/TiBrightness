// This is a test harness for your module
// You should do something interesting in this harness 
// to test out the module and to provide instructions 
// to users on how to use it by example.


// open a single window
var win = Ti.UI.createWindow({
	layout: 'vertical',
	backgroundColor:'white'
});

var upButton = Ti.UI.createButton({
	width: Ti.UI.SIZE,
	height: Ti.UI.SIZE,
	title: 'UP',
	color: 'Black',
	top: 20
});
win.add(upButton);
var downButton = Ti.UI.createButton({
	width: Ti.UI.SIZE,
	height: Ti.UI.SIZE,
	title: 'DOWN',
	color: 'Black',
	top: 20
});
win.add(downButton);
var textField = Ti.UI.createTextField({
	left: 20,
	right: 20,
	top: 20,
	borderStyle: Ti.UI.INPUT_BORDERSTYLE_ROUNDED
});
win.add(textField);
var setButton = Ti.UI.createButton({
	width: Ti.UI.SIZE,
	height: Ti.UI.SIZE,
	title: 'Set Brightness',
	color: 'Black',
	top: 20
});
win.add(setButton);
var getButton = Ti.UI.createButton({
	width: Ti.UI.SIZE,
	height: Ti.UI.SIZE,
	title: 'Get Brightness',
	color: 'Black',
	top: 20
});
win.add(getButton);

win.open();

// TODO: write your module tests here
var TiBrightness = require('org.selfkleptomaniac.mod.tibrightness');
Ti.API.info("module is => " + TiBrightness);

upButton.addEventListener('click', function(){
	var brightness = TiBrightness.up();
	alert(brightness);
});
downButton.addEventListener('click', function(){
	var brightness = TiBrightness.down();
	alert(brightness);
});
setButton.addEventListener('click', function(){
	var brightness = TiBrightness.setBrightness({brightness: textField.value});
	alert(brightness);
});
getButton.addEventListener('click', function(){
	alert(TiBrightness.getBrightness());
});

