#include "include/std.k"




function int main(int argc, char** argv){

    Vec3d test(1,2,3);
    Vec3d other(2,4,6);

    v3dadd(&test, &other);
    v3dcross(&test, &test);

    print(test.y);


    return 0;
}