#ifndef __SPRINTF
#   error "sprintf.k should only be included through sprintf.cb"
#endif

#define FORMAT_INT64 'l'
#define FORMAT_UNSIGNED 'u'
#define FORMAT_CHAR 'c'
#define FORMAT_BOOL 'B'
#define FORMAT_BINARY 'b'
#define FORMAT_DOUBLE 'e'
#define FORMAT_FLOAT 'f'
#define FORMAT_STRING 's'
#define FORMAT_START '%'
#define FORMAT_HEX 'x'
#define FORMAT_OCTAL 'o'
#define FORMAT_INT 'i'

char* __numbercharactersbase1016 = "0123456789abcdef";


/* 
function long toStr(long val, char* buffer, bool signed, short base){

    int signspace = 0;
    if(val < 0 && signed){
        @buffer = '-';
        buffer+=1;
        val = 0-val;
        signspace=1;
    }
    long l = log(val)+1;
    buffer+=l;
    for(int i = 0 ; i < l;i+=1){

        buffer-=1;
        char mod = val%base;
        @buffer = $char (mod) +'0' + ('a'-'0')*(mod > 9);
        
        val/=base;

    }
    return l+signspace;

} */

function long divmod10(long x, long* mod){
    @mod = x % 10;
    return x / 10;
}

template<typename T>
function long toStr(T val, char* buffer, bool s, long base){
    if(val == 0){
        @buffer = '0';
        return 2;
    }
    char signspace = 0;
    if(val < 0 && s){
        @buffer = '-';
        buffer+=1;
        val = 0-val;
        signspace=1;
    }

    

    base;
    char tmpbuf[64];
    memset(&tmpbuf, 0, 64);
    long len = 0;
    while(val != 0){

        long mod;
        //val = divmod((long)val,base,&mod);
        mod = val % 10;
        val /= 10;

        tmpbuf[len] = __numbercharactersbase1016[mod];
        
        len++;

    }
    buffer--;
    for(int i = len;i>0;i--){
        buffer[i]=tmpbuf[len-i];
    }





    return (len+signspace)+1;


}


size_t toBinary(char* buffer, unsigned long val, int bits){
    buffer += (char*) bits;
    for(int i = 0 ; i < bits;i++){
        if( (val&&1) ){
            @buffer = '1';
        }else{
            @buffer = '0';
        }
        val >>= 1;
        buffer--;
    }

    return bits;

}



function long toStr(double val, char* buffer, long multiplier){
    if(isQNaN(val)){
        strcpy(buffer, "QNaN");
        return 4;
    }else if(isSNaN(val)){
        strcpy(buffer, "SNaN");
        return 4;
    }else if (isNaN(val)){
        strcpy(buffer, "NaN");
        return 3;
    }else if (val == INF){
        strcpy(buffer, "Inf");
        return 3;
    }else if (val == NINF){
        strcpy(buffer, "-Inf");
        return 4;
    }


    long mantissa = val;
    long l = 0;

    if(mantissa == 0 && signOf(val)){
        @buffer = '-';
        buffer++;
        l++;
        
    }
    l += toStr<long>(mantissa, buffer, 1, 10);
    buffer+=(char*)l-1;
    val = (abs(val)-abs(mantissa))*multiplier;
    long decimal = abs(round(val));
    long leading = toStr<long>(decimal, buffer, 1, 10)-1;
    @buffer = '.';
    buffer++;
    leading = 7-leading;
    for range(i, leading){
        @buffer = '0';
        buffer++;
        l++;
    }


    l += toStr<long>(decimal, buffer, 1, 10);
    return l+1;


}





int __sprintf(char* str, char* fmt, void* args){

    int argc = 0;

    void og = str;

    if(str == 0 || fmt == 0){
        
        return 0;
    }


    while( @fmt != 0 ){


        
        
        if(@fmt != FORMAT_START){
            
            

            @str = @fmt;
            str++;

        
        
        }else{

            fmt++;
            char c = @fmt;


            switch(c){
                case FORMAT_INT{
                    int inum = args[argc];
                    size_t isize = toStr<int>(inum, str, 1, 10);
                    str += (char*) isize-1;
                    break;
                }

                case FORMAT_INT64 {
                    long num = (args[argc]);
                    long size = toStr<long>(num, str, 1, 10);
                    str+=(char*)size-1;
                    break;
                }
                case FORMAT_CHAR {
                    char cf = (char) args[argc];
                    @str = cf;
                    str++;
                    break;

                }
                case FORMAT_HEX {

                    long numx = (args[argc]);
                    long sx = toStr<long>(numx, str, 0, 16);
                    str+=(char*)sx-1;
                    break;
                }
                case FORMAT_OCTAL {

                    long numo = (args[argc]);
                    long so = toStr<int>(numo, str, 0, 8);
                    str+=(char*)so-1;
                    break;
                }
                case FORMAT_UNSIGNED {

                    char typespec = fmt[1];
                    if (typespec == FORMAT_INT64){
                        long unum = (args[argc]);
                        int usize = toStr<long>(unum, str, 0, 10);
                        str+=(char*)usize-1;
                        fmt++;
                    }else{
                        long unum = (args[argc]);
                        int usize = toStr<int>(unum, str, 0, 10);
                        str+=(char*)usize-1;
                    }
                    break;


                    
                }
                case FORMAT_STRING {
                    int ssize = strcpy(str,args[argc]);
                    str+=(char*)ssize;
                    break;
                }
                case FORMAT_BOOL {
                    bool b = args[argc];
                    char* boolean_string = "False";
                    if(b){
                        boolean_string = "True";
                    }
                    int bsize = strcpy(str, boolean_string);
                    
                    str+=(char*)bsize;
                    break;
                }
                case FORMAT_DOUBLE {
                    double d = args[argc];
                    int dsize = toStr(d, str, DOUBLE_PRECISION_MULTIPLIER);
                    str += (char*)dsize-1;
                    break;
                }
                case FORMAT_FLOAT {
                    float flt = args[argc];
                    double dflt = flt;
                    int fsize = toStr(dflt, str, 10000000);
                    str +=(char*) fsize-1;
                    break;
                }

                

                case FORMAT_BINARY{
                    long numb = args[argc];
                    char bitind = @(fmt+1);
                    int bits = 64;
                    if(bitind == '8'){
                        fmt++;
                    }else if (bitind == '4'){
                        bits = 32;
                        fmt ++;
                    }else if (bitind == '2'){
                        bits = 16;
                        fmt ++;
                    }else if (bitind == '1'){
                        bits = 8;
                        fmt++;
                    }
                    long sb = toBinary(str,numb, bits);
                    str+=(char*)sb;
                    break;
                }
            }


            argc++;


        }


        fmt++;

    }


    return ((long) str)-og;



}



__cdecl int sprintf(char* dest, char* fmt, void arg1, void arg2, void arg3, void arg4){

    void args[4];

    args[0]=arg1;
    args[1]=arg2;
    args[2]=arg3;
    args[3]=arg4;
    int l = __sprintf(dest,fmt,&args);
    return l;
}