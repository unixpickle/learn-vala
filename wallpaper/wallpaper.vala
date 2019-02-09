// Show a fullscreen window behind everything else.
// Based on https://github.com/cheesecakeufo/komorebi/blob/master/src/OnScreen/BackgroundWindow.vala#L98

using Gtk;

class Wallpaper : GLib.Object {
    private Window[] windows;

    public Wallpaper() {
        this.windows = {};
        var display = Gdk.Display.get_default();
        for (int i = 0; i < display.get_n_monitors(); ++i) {
            var window = new Window();
            
            var rectangle = display.get_monitor(i).get_geometry();
            window.move(rectangle.x, rectangle.y);
            window.set_size_request(rectangle.width, rectangle.height);
            window.set_type_hint(Gdk.WindowTypeHint.DESKTOP);
            window.set_keep_below(true);

            this.windows += window;
        }
    }

    public void show() {
        foreach (var window in this.windows) {
            window.show_all();
        }
    }

    public static void main(string[] args) {
        Gtk.init(ref args);
        new Wallpaper().show();
        Gtk.main();
    }
}
