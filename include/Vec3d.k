struct Vec3d{

    double x;
    double y;
    double z;
    double padd;

    constructor(double a, double b, double c){
        this->x=a;
        this->y=b;
        this->z=c;
    };

    

};

function void v3dadd(Vec3d* dest, Vec3d* other){
    __simd 4 double (dest,0) {(+, other, 0)} (dest, 0);
}
function void v3dsub(Vec3d* dest, Vec3d*other){
    __simd 4 double (dest, 0) {(-,other,0)} (dest, 0);
}
function void v3dcross(Vec3d* dest, Vec3d*other){
    __simd 4 double (dest, 0) {(*, other, 0)} (dest, 0);
}