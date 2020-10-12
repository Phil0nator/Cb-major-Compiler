struct String{

    char* value;
    int len;

    destructor{
        free(this->value);
    }

};

function void createString(String* dest, char* starter){

    int l = strlen(starter);
    dest->len=l;
    dest->value = malloc(l);
    memcpy(dest->value, starter, l);


}

function void appendString(String* this, char* other){

    int ol = strlen(other);
    char* newvalue = realloc(this->value, this->len+ol);
    if(newvalue == nullptr){
        print("Bad realloc");
        
    }

    char* ostart = newvalue+ol-3;
    memcpy(ostart, other, ol);
    this->value = newvalue;

}

function void freeString(String* this){
    free(this->value);
}