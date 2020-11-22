using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.System;
using Toybox.Lang;
using Toybox.Time.Gregorian as Date;

class garmindigitalwatchfaceView extends WatchUi.WatchFace {

	const TEXT_COLOR = Graphics.COLOR_WHITE;
	const DEVICE_HEIGHT = 240;
	const DEVICE_WIDTH_CENTER = 120;
	const DEVICE_WIDTH = 240;
	const BATTERY_COLUMN_START = DEVICE_HEIGHT - 33;
	const BATTER_TEXT_X_POSITION = 222;

    function initialize() {
        WatchFace.initialize();
    }

    // Update the view
    function onUpdate(dc) {
    	View.onUpdate(dc);

		drawGraphics(dc);
    	drawTime(dc);
    	drawSteps(dc);
    	drawDate(dc);
    	drawBattery(dc);
                
    }
    
	function drawTime(dc) {
		var clockTime = System.getClockTime();
		dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
    	dc.drawText(
	        DEVICE_WIDTH_CENTER,
	        70,
	        Graphics.FONT_SYSTEM_NUMBER_THAI_HOT,
	        Lang.format("$1$:$2$", [clockTime.hour, clockTime.min.format("%02d")]),
	        Graphics.TEXT_JUSTIFY_CENTER
        );
	}
	
	function drawSteps(dc) {
		var activityMonitorInfo = ActivityMonitor.getInfo(); 
		dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
    	dc.drawText(
	        DEVICE_WIDTH_CENTER,
	        162,
	        Graphics.FONT_SYSTEM_LARGE,
	        Lang.format("$1$ / $2$", [activityMonitorInfo.steps.format("%d"), activityMonitorInfo.stepGoal.format("%d")]),
	        Graphics.TEXT_JUSTIFY_CENTER
        );
	}
	
	function drawDate(dc) {
        dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
        var date = Date.info(Time.now(), Time.FORMAT_SHORT);
    	dc.drawText(
	        DEVICE_WIDTH_CENTER,
	        26,
	        Graphics.FONT_SYSTEM_LARGE,
	        Lang.format("$1$-$2$-$3$", [date.year, date.month.format("%02d"), date.day.format("%02d")]),
	        Graphics.TEXT_JUSTIFY_CENTER
        );
	}
	
	function drawBattery(dc) {
		var battery = System.getSystemStats().battery;
		var batteryColor = Graphics.COLOR_LT_GRAY;
		if (battery < 16) {
			batteryColor = Graphics.COLOR_DK_RED;
		} else if (battery < 31) {
			batteryColor = Graphics.COLOR_ORANGE;
		}
		dc.setColor(batteryColor, Graphics.COLOR_TRANSPARENT);
    	dc.drawText(
	        123,
	        210,
	        Graphics.FONT_SYSTEM_XTINY,
	        battery.format("%02d") + "%",
	        Graphics.TEXT_JUSTIFY_LEFT
        );
    	dc.fillRectangle(100, 217, 17, 10);
    	dc.fillRectangle(97, 219, 14, 6);
	}
	
	function drawGraphics(dc) {
		dc.setColor(0x303030, Graphics.COLOR_TRANSPARENT);
		dc.drawLine(0, 5, DEVICE_WIDTH, 5);
		dc.drawLine(0, 10, DEVICE_WIDTH, 10);
		dc.drawLine(0, 20, DEVICE_WIDTH, 20);
    	dc.drawLine(0, 25, DEVICE_WIDTH, 25);
    	dc.drawLine(0, 64, DEVICE_WIDTH, 64);
    	dc.drawLine(0, 69, DEVICE_WIDTH, 69);	
    	dc.drawLine(0, 79, DEVICE_WIDTH, 79);
    	dc.drawLine(0, 84, DEVICE_WIDTH, 84);
    	dc.drawLine(0, 156, DEVICE_WIDTH, 156);
    	dc.drawLine(0, 161, DEVICE_WIDTH, 161);
    	dc.drawLine(0, 200, DEVICE_WIDTH, 200);
    	dc.drawLine(0, 205, DEVICE_WIDTH, 205);
    	
    	
	}

}
