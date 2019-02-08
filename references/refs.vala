class Obj1 : Object {
    public string s;

    public Obj1(string s) {
        this.s = s;
    }
}

class Obj2 : Object {
    public Obj1 foobar;

    public Obj2(Obj1 o) {
        this.foobar = o;
    }
}

void main() {
    Obj2 o = new Obj2(new Obj1(stdin.read_line()));
    stdout.printf("%s\n", o.foobar.s);
}
