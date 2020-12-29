#define __CBLIB_SOURCE
//#include "cblib.cb"

#define COUNT 75000

void sort(int* array, int count){

    for (int i = 0 ; i < count; i++){

        for (int j = i; j < count; j++){

            if (array[j] < array[i]){
                int tmp = array[j];
                array[j] = array[i];
                array[i] = tmp;
            }

        }

    }

}


int main() {
    
    int array[COUNT];
    for (int i = 0 ; i < COUNT;i++){
        array[COUNT-1-i] = i;
    }

    sort(&array, COUNT);


    return 0;
}



/*
void benchmark(){

    char nullb[1000];
    memzer(&nullb, 1000);
    for range(i, 25000000){
        sprintf(&nullb, "123hd0.5: \t %i%s%f", 123, "hd", 0.5);
    }
    puts(&nullb);
    
}

*/