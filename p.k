#include "std.k"

struct Vector{

    size_t elements;
    size_t elementSize;
    void* start = nullptr;

};

void CreateVector(Vector* this, size_t elements, size_t type){
    this->elements = elements;
    this->elementSize = type;
    this->start = qmmap(elements*type);
}

void set(Vector* this, size_t idx, void* value){

    memcpy(this->start+idx*this->elementSize, value, this->elementSize);

}

void set(Vector* this, size_t idx, void value){
    this->start[idx*this->elementSize] = value;
}

int main(long argc, char** argv){

    Vector test;
    CreateVector(&test, 5, long);
    set(&test, 0, 23);
    

    return 0;
}
