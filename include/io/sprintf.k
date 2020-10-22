

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
#define FORMAT_HEX 'h'
#define DOUBLE_PRECISION_MULTIPLIER 100000000000000
#define FLOAT_PRECISION_MULTIPLIER 10000000
#include "math.k"
#include "string.k"



function int toStr(int val, char* buffer, bool signed){

    int signspace = 0;
    if(val < 0 && signed){
        @buffer = '-';
        buffer+=1;
        val = 0-val;
        signspace=1;
    }
    int l = log(val)+1;
    buffer+=l;
    for(int i = 0 ; i < l;i+=1){

        buffer-=1;
        @buffer = $char (val%10) +'0';
        
        val/=10;

    }
    return l+signspace;

}



function int toStr(double val, char* buffer, int multiplier){

    int integral = val;
    int l = toStr(integral, buffer, 1);
    buffer+=l;
    val = (abs(val)-integral)*multiplier;
    @buffer = '.';
    buffer+=1;
    l += toStr(round(val), buffer, 0);
    return l-1;


}





global int __sprintf(char* str, char* fmt, void* args){

    int argc = 0;

    int og = $int str;



    if(str == 0 || fmt == 0){
        return 0;
    }


    while( @fmt != 0 ){

        
        if(@fmt != FORMAT_START){
            
            

            @str = @fmt;
        
        
        }else{

            fmt+=1;
            char c = @fmt;

            if(c == FORMAT_INT64){
                
                int num = (args[argc]);

                int size = toStr(num, str, 1);
                str+=size-1;

            }else if (c == FORMAT_CHAR){
                char cf = $char args[argc];
                @str = cf;
            }
            else if (c == FORMAT_UINT64){

                int unum = (args[argc]);
                int usize = toStr(unum, str, 0);
                str+=usize-1;

            }else if (c == FORMAT_STRING){

                int ssize = strcpy(str,args[argc]);
                str+=ssize-1;

            }else if (c == FORMAT_BOOL){


                bool b = args[argc];
                char* boolean_string;
                if(b){
                    boolean_string = "True";
                }else{
                    boolean_string = "False";
                }
                int bsize = strcpy(str, boolean_string);
                str+=ssize;
            }

            else if (c == FORMAT_DOUBLE){

                double d = args[argc];
                int dsize = toStr(d, str, DOUBLE_PRECISION_MULTIPLIER);
                str += dsize-1;

            } else if (c == FORMAT_FLOAT){

                double f = args[argc];
                int fsize = toStr(f, str, FLOAT_PRECISION_MULTIPLIER);
                str += fsize-1;

            }


            argc+=1;


        }

        fmt+=1;
        str+=1;

    }

    return ($int str)-og;



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