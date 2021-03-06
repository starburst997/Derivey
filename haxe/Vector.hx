package ;

@:forward(x, y, z) abstract Vector({x:Float, y:Float, z:Float}) {

    public var magnitude(get, never):Float;

    public inline function new(x:Float = 0, y:Float = 0, z:Float = 0) this = {x:x, y:y, z:z};

    public inline function set(x:Float, y:Float, z:Float) {
        this.x = x;
        this.y = y;
        this.z = z;
    }

    public function rotateX(amount:Float):Vector return null; // TODO
    public function rotateY(amount:Float):Vector return null; // TODO
    public function rotateZ(amount:Float):Vector return null; // TODO

    inline function get_magnitude():Float return Math.sqrt(this.x * this.x + this.y * this.y + this.z * this.z);

    @:from static inline function fromPoint(value:Point):Vector return new Vector(value.x, value.y);
    @:to inline function toPoint():Point return new Point(this.x, this.y);

    public inline function clone() return new Vector(this.x, this.y, this.z);

    @:op(A * B) static inline function scalarMultiply(a:Vector, b:Float):Vector return new Vector(a.x * b, a.y * b, a.z * b);
    @:op(A * B) static inline function crossProduct(a:Vector, b:Vector):Vector return new Vector(a.y * b.z - a.z * b.y, a.z * b.x - a.x * b.z, a.x * b.y - a.y * b.x);
    @:op(A * B) static inline function scalarDivide(a:Vector, b:Float):Vector return scalarMultiply(a, 1 / b);
    @:op(A + B) static inline function add(a:Vector, b:Vector):Vector return new Vector(a.x + b.x, a.y + b.y, a.z + b.z);
    @:op(A - B) static inline function subtract(a:Vector, b:Vector):Vector return new Vector(a.x - b.x, a.y - b.y, a.z - b.z);
    @:op(-A) static inline function invert(a:Vector):Vector return new Vector(-a.x, -a.y, -a.z);
    @:op(!A) static inline function not(a:Vector):Vector return null; // TODO, I have no idea
    @:op(A ^ B) static inline function dotProduct(a:Vector, b:Vector):Float return a.x * b.x + a.y * b.y + a.z * b.z;
    public inline static function mix(a:Vector, b:Vector, t:Float):Vector return a*(1-t) + b*t;
    public inline function bar():Float return 0; // TODO, no idea
}
