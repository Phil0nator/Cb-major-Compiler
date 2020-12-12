#ifndef __SCANF
#   error   "sscanf.k should only be included through sscanf.cb"
#endif


#define SSCANF_FORMAT_INT 'i'
#define SSCANF_FORMAT_UINT 'u'
#define SSCANF_FORMAT_CHAR 'c'
#define SSCANF_FORMAT_FLOAT 'f'
#define SSCANF_FORMAT_DOUBLE 'd'
#define SSCANF_FORMAT_STRING 's'
#define SSCANF_FORMAT_HEX 'x'
#define SSCANF_FORMAT_SPECIFIER '%'








function int scanint(char* str, long* dest, bool signed){

    long val = 0;
    char c = $char (@str);
    bool negative = false;
    char* ogstr =str;
    if(c == '-' && signed){
        negative = true;
        str+=1;
        c = $char(@str);
    }

    while( c <= '9' && c >= '0'){
        c-='0';
        val = (val*10)+(c);
        str+=1;
        c = $char (@str);
    }

    if(!negative){
        @dest = val;
    }else{
        @dest = 0-val;
    }
    return str-ogstr;

    

}


function int scanstr(char* str, char delim, char* dest){
    char* ogstr = str;
    while(@str != delim){
        @dest = @str;
        str++;
        dest++;
    }
    return str-ogstr; 
}


function int scansd(char* str, double* dest){

    long integral;
    long decimal;
    ssize_t diff = scanint(str, &integral, true);
    str+=diff;
    if(@str != '.'){
        @dest = integral;
        return diff;
    }
    str++;
    ssize_t dif2 = scanint(str, &decimal, false);
    int n = pow(10, dif2);
    integral *= n;
    double num = integral+decimal;

    @dest = num/($double n);


    return diff+dif2;



}



int __SSCANF(char* format, char* input, void** args){

    int argc = 0;
    
    if(input == 0 || format == 0){
        return 0;
    }
    while(@format != 0){

        if(@format != SSCANF_FORMAT_SPECIFIER){
            format++;
            input++;
        }
        else
        {

            format++;
            char c = @format;
            ssize_t diff;
            if(c == SSCANF_FORMAT_INT){
                long* p = args[argc];
                
                diff = scanint(input, args[argc], true);
                input+=diff;
                format++;


            }else if (c == SSCANF_FORMAT_UINT){

                diff = scanint(input, args[argc], false);
                input += diff;
                format++;

            }else if (c == SSCANF_FORMAT_CHAR){

                char* ptr = args[argc];
                @ptr = @input;
                input++;
                format++;


            }else if (c == SSCANF_FORMAT_STRING){
                format++;
                diff = scanstr(input, @format, args[argc]);
                input+=diff;
            }else if (c == SSCANF_FORMAT_FLOAT || c == SSCANF_FORMAT_DOUBLE){

                diff = scansd(input, args[argc]);
                input+=diff;
                format++;
            }


            argc ++;


        }

    }

    return argc;


}



__cdecl int sscanf(char* fmt, char* input, void* a, void* b, void* c, void* d){

    void args[4];
    args[0]=a;
    args[1]=b;
    args[2]=c;
    args[3]=d;

    return __SSCANF(fmt, input, &args);

}