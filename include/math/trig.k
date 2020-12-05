
#ifndef __TRIG
#   error "trig.k should only be included through math.cb"
#endif

/**
 * Standard series macros
 */
#define __TAYLOR_3F     (3*2)
#define __TAYLOR_5F     (__TAYLOR_3F*5*4)
#define __TAYLOR_7F     (__TAYLOR_5F*7*6)
#define __TAYLOR_9F     (__TAYLOR_7F*9*8)

#define __TAYLOR_P3(x) (x*x*x)
#define __TAYLOR_P5(x) (__TAYLOR_P3(x)*x*x)
#define __TAYLOR_P7(x) (__TAYLOR_P5(x)*x*x)
#define __TAYLOR_P9(x) (__TAYLOR_P7(x)*x*x)

/**
 * ASIN series fraction constants
 */
#define __TAYLOR_ASIN1      0.5
#define __TAYLOR_ASIN2      0.375
#define __TAYLOR_ASIN3      0.3125
#define __TAYLOR_ASIN4      0.2734375

/**
 * ASIN Terms
 */
#define __TAYLOR_ASINT1     (__TAYLOR_ASIN1*(__TAYLOR_P3(x)/3.0))
#define __TAYLOR_ASINT2     (__TAYLOR_ASIN2*(__TAYLOR_P5(x)/5.0))
#define __TAYLOR_ASINT3     (__TAYLOR_ASIN3*(__TAYLOR_P7(x)/7.0))
#define __TAYLOR_ASINT4     (__TAYLOR_ASIN4*(__TAYLOR_P9(x)/9.0))

/**
 * ATAN series terms
 */
#define __TAYLOR_ATAN3(x)       (1.0/(3.0*(__TAYLOR_P3(x))))
#define __TAYLOR_ATAN5(x)       (1.0/(5.0*(__TAYLOR_P5(x))))
#define __TAYLOR_ATAN7(x)       (1.0/(7.0*(__TAYLOR_P7(x))))
#define __TAYLOR_ATAN9(x)       (1.0/(9.0*(__TAYLOR_P9(x))))

/**
 * Vanilla series
 */
#define __VANILLA_PS(x)         x - (__TAYLOR_P3(x)/3.0) + (__TAYLOR_P5(x)/5.0) - (__TAYLOR_P7(x)/7.0) + (__TAYLOR_P9(x)/9.0)





/**
 * A degree nine taylor approximation of the sin function
 */
double taylor_sin(double x){

    return x - (__TAYLOR_P3(x)/__TAYLOR_3F) + (__TAYLOR_P5(x)/__TAYLOR_5F) - (__TAYLOR_P7(x)/__TAYLOR_7F) +  (__TAYLOR_P9(x)/__TAYLOR_9F);

}


double sin(double x){
    if (x != 0){       
        return  taylor_sin(M_PI - fmod(x, 2*M_PI));
    }
    return 0;

}


double cos(double x){

    if(x != 0){
        return sin(x+M_PI_2);
    }
    return 1;

}


double tan(double x){
    if(x != 0){
        return sin(x) / cos (x);
    }
    return 0; 
}


double cot(double x){
    if( x != 0 ){
        return 1.0 / tan(x);
    }
    return QNAN;
}


double sec(double x){
    if( x!= 0){
        return 1.0 / cos(x);
    }
    return 1;
}


double csc(double x){
    if (x!=0){
        return 1.0 / sin(x);
    }
    return QNAN;
}

double taylor_asin(double x){
    return x + __TAYLOR_ASINT1 + __TAYLOR_ASINT2 + __TAYLOR_ASINT3 + __TAYLOR_ASINT4;
}


double asin(double x){
    if(x < -1 || x > 1){
        return QNAN;
    }
    return taylor_asin(x);
}


double acos(double x){
    if(x < -1 || x > 1){
        return QNAN;
    }
    return M_PI_2 - taylor_asin(x);
}



double atan(double x){
    if(x == -1){
        return (-M_PI_4);
    }else if (x == 1){
        return M_PI_4;
    }else if (x == 0){
        return 0;
    }else if ( (x <= 1) && (x >= -1)){
        return __VANILLA_PS(x);
    }else if (x < -1){
        return 0-M_PI_2-(1/x)+__TAYLOR_ATAN3(x)-__TAYLOR_ATAN5(x);
    }else if (x > 1){
        return M_PI_2-(1/x)+__TAYLOR_ATAN3(x)-__TAYLOR_ATAN5(x);
    }
    return QNAN;
}