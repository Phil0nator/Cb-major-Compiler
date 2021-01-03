#ifndef __INPUT
#   error   "input.k should only be included throug input.cb"
#endif

#define MAX_INT64LEN 40
#define __SCANFMAXCHUNK 1000


int getInt(char* msg){
    
    printf(msg);
    char buff[MAX_INT64LEN];
    memset(&buff, 0, MAX_INT64LEN);
    fgets(STDIN, &buff, MAX_INT64LEN);
    return toInteger(&buff, true);

}


unsigned int getUint(char* msg){

    printf(msg);
    char buff[MAX_INT64LEN];
    memset(&buff, 0, MAX_INT64LEN);
    fgets(STDIN, &buff, MAX_INT64LEN);
    return toInteger(&buff, true);

}

char getchar(){
    char c;
    fgets(STDIN, &c, 1);
    return c;
}


void getString(char* buffer, int maxlen, char* msg){
    
    printf(msg);
    fgets(STDIN, buffer, $size_t maxlen);

}



int toInteger(char* str, bool s){

    while(@str == ' '){
        str+=1;
    }
    char c = $char (@str);
    int val = 0;
    bool negative = false;
    if(c == '-' && s){
        negative = true;
        str+=1;
        c = $char(@str);
    }
    while(c != 0 && c != 10 && c != ' '){
        val = (val*10)+(c-'0');
        str+=1;
        c = $char (@str);
    }

    if(negative){
        return 0-val;
    }
    return val;


}



int __scanf(char* format, void** args, fd_t file, bool stream){
    
    char* inp;
    if (stream){
        inp = mapalloc(__SCANFMAXCHUNK);
        fgets(file, inp, __SCANFMAXCHUNK);
    }
    else{
        inp = floads(file);
    }


    int retval = __SSCANF(format, inp, args);
    mapfree(inp);
    return retval;
}



__cdecl size_t scanf(char* format, void* a, void* b, void* c, void* d, void* e){
    void* args[5];
    args[0]=a;
    args[1]=b;
    args[2]=c;
    args[3]=d;
    args[4]=e;
    return __scanf(format, &args, STDIN, true);
}

__cdecl size_t fscanf(fd_t file, char* format, void* a, void* b, void* c, void* d ){
    void* args[4];
    args[0]=a;
    args[1]=b;
    args[2]=c;
    args[3]=d;
    return __scanf(format, &args, file, false);
}