using Gtk;

class Clock {
    private Window window;
    private Label label;

    public Clock() {
        this.window = new Window();
        this.window.title = "Clock";
        this.window.window_position = WindowPosition.CENTER;
        this.window.set_default_size(200, 100);
        this.window.destroy.connect(Gtk.main_quit);

        this.label = new Label("Loading...");
        var attributes = new Pango.AttrList();
        attributes.change(new Pango.AttrSize(25 * Pango.SCALE));
        this.label.attributes = attributes;
        this.window.add(this.label);
    }

    public void run() {
        var source = new TimeoutSource(1000);
        source.set_callback(() => {
            var time = new DateTime.now_local();
            var time_str = "%02d:%02d:%02d".printf(time.get_hour(), time.get_minute(),
                time.get_second());
            this.label.set_text(time_str);
            return true;
        });
        source.attach(null);
        this.window.show_all();
        Gtk.main();
    }

    public static void main(string[] args) {
        Gtk.init(ref args);
        var clock = new Clock();
        clock.run();
    }
}
