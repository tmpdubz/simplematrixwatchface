import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Time.Gregorian;

class simplematrixwatchfaceView extends WatchUi.WatchFace {

    var months as Array = [
        "Jan",
        "Feb",
        "Mar",
        "Apr",
        "May",
        "Jun",
        "Jul",
        "Aug",
        "Sep",
        "Oct",
        "Nov",
        "Dec"
    ];

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        var date = Gregorian.info(Time.now(), Time.FORMAT_SHORT);
        var systemStats = System.getSystemStats();

        (View.findDrawableById("Date") as Toybox.WatchUi.Text).setText(
            months[date.month - 1] + " " + date.day.format("%02d")
        ) ;
        (View.findDrawableById("HoursAndMinutes") as Toybox.WatchUi.Text).setText(
            date.hour.format("%02d") + ":" + date.min.format("%02d")
        );
        (View.findDrawableById("Battery") as Toybox.WatchUi.Text).setText(
          systemStats.battery.format("%d") + "%"
        );

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() as Void {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() as Void {
    }

}
