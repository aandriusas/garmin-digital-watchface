using Toybox.Application;

class garmindigitalwatchfaceApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    function getInitialView() {
        return [ new garmindigitalwatchfaceView() ];
    }

}