struct Vec3i{

    int x;
    int y;
    int z;
    int padd;

    constructor(int a, int b, int c){
        this->x=a;
        this->y=b;
        this->z=c;
    };

    

};

function void v3iadd(Vec3i* dest, Vec3i* other){
    __simd 4 int (dest,0) {(+, other, 0)} (dest, 0);
}