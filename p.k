#include "std.k"


int main(long argc, char** argv){


    Vec3f v;
    v.set(1,2,3);
    Vec3f two;
    two.set(2,4,6);

    double dot = v.dot(&two);

    printf("DOT: %f\n", dot);
    printf("%f,%f,%f\n",v.x,v.y,v.z);


    return 0;
}
