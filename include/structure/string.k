#ifndef __STRINGCLASS
#   error "string.k should only be included through string.cb"
#endif


string string::operator =(char* init){
    length = strlen(init);
    maprealloc(raw, length);
    raw[length+1] = 0;
    strcpy(raw, init);
    return @this;
}

string string::operator += (string other){
    length += other.length;
    maprealloc(raw, length+1);
    strcpy(raw+(char*)(length-other.length), other.raw);
    return @this;
}

string string::operator +(string other){
    string out = raw;
    out += other;
    return out;
}

string string::operator +(char* other){
    string out = raw;
    out += other;
    return out;
}

string string::operator += (char* other){
    size_t otherlen = strlen(other);
    maprealloc(raw, length+otherlen+1);
    strcpy(raw + (char*)length, other);
    length+=otherlen;
    return @this;
}