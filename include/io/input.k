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
    fgets(STDIN, buffer, maxlen);

}



int toInteger(char* str, bool signed){

    while(@str == ' '){
        str+=1;
    }
    char c = $char (@str);
    int val = 0;
    bool negative = false;
    if(c == '-' && signed){
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



int __scanf(char* format, void** args, fd_t file){
    
    char* inp = nullptr;
    size_t len = 0;
    size_t gotten = 0;
    do {
        len+= __SCANFMAXCHUNK;
        inp = realloc(inp, len);
        gotten = fgets(file,inp+len-__SCANFMAXCHUNK, __SCANFMAXCHUNK);
        inp[len-__SCANFMAXCHUNK+gotten]=0;
    } while (gotten >= __SCANFMAXCHUNK );
    
    
    int retval = __SSCANF(format, inp, args);
    free(inp);
    return retval;
}