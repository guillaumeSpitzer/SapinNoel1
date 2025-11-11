import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

const EPIX_PRO_51MM_PART = "006-B4314-00";
const FR45_PART = "006-B3282-00";
const VENU3S_PART = "006-B4261-00";
class SapinNoel1View extends WatchUi.WatchFace {

    var ecran_x;
    var ecran_y;
    var montre;

    function initialize() {
        WatchFace.initialize();
        var settings = System.getDeviceSettings();
        ecran_x = settings.screenWidth;
        ecran_y = settings.screenHeight;
        montre = settings.partNumber;
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
        // Récupère les 3 chaînes depuis strings.xml et les concatène
        // var s1 = WatchUi.loadResource(Rez.Strings.String1); // ID de la string dans le fichier resources/strings/strings.xml
        // var s2 = WatchUi.loadResource(Rez.Strings.String2);
        // var s3 = WatchUi.loadResource(Rez.Strings.String3);
        // var prop = System.getDeviceSettings();

        // var combined = s1 + "\n" + s2 + "\n" + s3 + "\n" +
        //     "screen width : " + prop.screenWidth + "\n" +
        //     "screen height : " + prop.screenHeight;


        // Récupère l'emplacement du StringLabel et met à jour le texte
        var view = View.findDrawableById("TitreLabel") as Text;
        if (view != null) {
            view.setText(montre); // partnumber de la montre
        }
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {

        // charge le drawable 'smiley' et le dessine
        // var mySmiley = new Rez.Drawables.Smiley();
        // mySmiley.draw( dc );


        // Get and show the current time
        var clockTime = System.getClockTime();
        var timeString = Lang.format("$1$:$2$", [clockTime.hour, clockTime.min.format("%02d")]);
        var view = View.findDrawableById("HourLabel") as Text;
        view.setText(timeString);

        // view.setText("Hello World !!!!!");

        // 1. Appel du parent pour redessiner le fond et les labels
        // les autres éléments de l'interface (drawText, drawRect, etc.) seront
        // dessinés par-dessus, donc après cet appel.
        View.onUpdate(dc);
       

       //
        // Logique de détection
        if (montre.equals(EPIX_PRO_51MM_PART)) {
            // Logique spécifique à l'Epix Pro (ex: dessiner des éléments complexes, utiliser une résolution élevée)
            dc.setColor(Graphics.COLOR_GREEN, Graphics.COLOR_BLACK);
            dc.drawText(dc.getWidth() / 2, 50, Graphics.FONT_MEDIUM, "EPIX PRO GEN2", Graphics.TEXT_JUSTIFY_CENTER);
            
        } else if (montre.equals(FR45_PART)) {
            // Logique spécifique à la Forerunner 45 (ex: dessiner moins d'éléments, utiliser des méthodes plus simples)
            dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_BLACK);
            dc.drawText(dc.getWidth() / 2, 50, Graphics.FONT_XTINY, "FORERUNNER 45", Graphics.TEXT_JUSTIFY_CENTER);
            
        } else if (montre.equals(VENU3S_PART)) {
            // Logique spécifique à la Forerunner 45 (ex: dessiner moins d'éléments, utiliser des méthodes plus simples)
            dc.setColor(Graphics.COLOR_PURPLE, Graphics.COLOR_BLACK);
            dc.drawText(dc.getWidth() / 2, 50, Graphics.FONT_GLANCE, "VENU 3S", Graphics.TEXT_JUSTIFY_CENTER);
            
        } else {
            // Logique par défaut
            dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
            dc.drawText(dc.getWidth() / 2, 50, Graphics.FONT_XTINY, "Unknown Device", Graphics.TEXT_JUSTIFY_CENTER);
        }

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
