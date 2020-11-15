

#ifndef __SPRINTF
#define __SPRINTF 1


#define FORMAT_INT64 'i'
#define FORMAT_UINT64 'u'
#define FORMAT_CHAR 'c'
#define FORMAT_BOOL 'b'
#define FORMAT_DOUBLE 'd'
#define FORMAT_STRING 's'
#define FORMAT_START '%'
#define FORMAT_FLOAT 'f'
#define FORMAT_HEX 'x'
#define FORMAT_OCTAL 'o'

#include "math.k"
#include "string.k"
#include "bits/endian.k"


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



char* __numbercharactersbase1016 = "0123456789abcdef";

function long toStr(long val, char* buffer, bool signed, long base){
    if(val == 0){
        @buffer = '0';
        return 1;
    }
    char signspace = 0;
    if(val < 0 && signed){
        @buffer = '-';
        buffer+=1;
        val = 0-val;
        signspace=1;
    }

    

    char tmpbuf[64];
    memset(&tmpbuf, 0, 64);
    long len = 0;
    while(val != 0){

        long mod;

        mod = val%base;
        val /= base;


        tmpbuf[len] = __numbercharactersbase1016[mod];
        len++;

    }

    for(int i = len;i>0;i--){
        buffer[i]=tmpbuf[len-i];
    }





    return (len+signspace)++;


}





function long toStr(double val, char* buffer, long multiplier){

    long integral = val;
    long l = toStr(integral, buffer, 1, 10);
    buffer+=l;
    
    val = abs(val);
    val -= abs(integral);
    val *= multiplier;

    @buffer = '.';
    buffer++;
    l += toStr(round(val), buffer, 0, 10);
    return l+1;


}


/**

    Format fmt with args into str.
    Formats:
        -%i signed integer value
        -%u unsigned integer value
        -%x hex value
        -%c char
        -%b boolean
        -%f float
        -%d double
        -%s cstring

    str must be already allocated with enough size for the operation to complete. If not, SIGSEGV will be raised.
    @param str a destination string preallocated with enough space for the operation.
    @param fmt a format string.
    @param args the arguments to fill into the string. An inadequate amount of arguments will result in a SIGSEGV.
*/
global int __sprintf(char* str, char* fmt, void* args){

    int argc = 0;

    void og = str;


    if(str == 0 || fmt == 0){
        
        return 0;
    }


    while( @fmt != 0 ){


        
        
        if(@fmt != FORMAT_START){
            
            

            @str = @fmt;
        
        
        }else{

            fmt++;
            char c = @fmt;


            switch(c){
                case FORMAT_INT64 {
                    long num = (args[argc]);
                    long size = toStr(num, str, 1, 10);
                    str+=size-1;
                    break;
                }
                case FORMAT_CHAR {
                    char cf = $char args[argc];
                    @str = cf;
                    break;

                }
                case FORMAT_HEX {

                    long numx = (args[argc]);
                    long sx = toStr(numx, str, 0, 16);
                    str+=sx-1;
                    break;
                }
                case FORMAT_OCTAL {

                    long numo = (args[argc]);
                    long so = toStr(numo, str, 0, 8);
                    str+=so-1;
                    break;
                }
                case FORMAT_UINT64 {
                    long unum = (args[argc]);
                    int usize = toStr(unum, str, 0, 10);
                    str+=usize-1;
                    break;
                }
                case FORMAT_STRING {
                    int ssize = strcpy(str,args[argc]);
                    str+=ssize-1;
                    break;
                }
                case FORMAT_BOOL {
                    bool b = args[argc];
                    char* boolean_string = "False";
                    if(b){
                        boolean_string = "True";
                    }
                    int bsize = strcpy(str, boolean_string);
                    
                    str+=bsize;
                    break;
                }
                case FORMAT_DOUBLE {
                    double d = args[argc];
                    int dsize = toStr(d, str, DOUBLE_PRECISION_MULTIPLIER);
                    str += dsize-1;
                    break;
                }

                case FORMAT_FLOAT{
                    double f = args[argc];
                    int fsize = toStr(f, str, FLOAT_PRECISION_MULTIPLIER);
                    str += fsize-1;
                    break;
                }
            }


            argc++;


        }


        fmt++;
        str++;

    }

    return ($long str)-og;



}




global int sprintf(char* dest, char* fmt, void arg1, void arg2, void arg3, void arg4){

    void* args = malloc(4*void);

    args[0]=arg1;
    args[1]=arg2;
    args[2]=arg3;
    args[3]=arg4;
    int l = __sprintf(dest,fmt,args);
    free(args);
    return l;
}


#endif