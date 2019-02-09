delegate void MyFunction(int a);

void caller(MyFunction f) {
    f(3);
}

void main() {
    int b = 3;
    int c = 4;
    caller((a) => {
        c = 4;
        b = 5;
        stdout.printf("%d %d\n", a, c);
    });
    caller((a) => {
        b = 4;
        stdout.printf("%d %d\n", a, b);
    });
}
