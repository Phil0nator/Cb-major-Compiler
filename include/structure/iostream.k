#ifndef __IOSTREAM
#   error "iostream.k should only be included through iostream.cb"
#endif




void ostream::operator =(fd_t newhandle){
    handle=newhandle;
}

ostream ostream::operator <<(char* data){
    fputs(handle, data);
    return @this;
}

ostream ostream::operator <<(long data){
    fprintf(handle, "%l", data);
    return @this;
}

ostream ostream::operator <<(unsigned long data){
    fprintf(handle, "%ul", data);
    return @this;
}

ostream ostream::operator <<(float data){
    fprintf(handle, "%f", data);
    return @this;
}

ostream ostream::operator <<(double data){
    fprintf(handle, "%e", data);
    return @this;
}

ostream ostream::operator << (char data){
    fprintf(handle, "%c", data);
    return @this;
}

ostream ostream::operator <<(int data){
    fprintf(handle, "%i", data);
    return @this;
}

ostream ostream::operator << (string data){
    fputs(handle , data.raw);
    return @this;
}



