struct String{

    char* value;
    int len;

    destructor{
        free(this->value);
    };

    constructor(char* starter){
        int l = strlen(starter);
        this->len=l;
        this->value = malloc(l);
        memcpy(this->value, starter, l);
    };

};

function void appendString(String* this, char* other){

    int ol = strlen(other);
    char* newvalue = realloc(this->value, this->len+ol);
    if(newvalue == nullptr){
        print("Bad realloc");
        
    }
    
    char* ostart = newvalue+this->len;
    memcpy(ostart, other, ol);
    this->value = newvalue;
    this->len = this->len + ol;
}

function bool strequ(char* a, char* b){
    int i = 0;

    while(true){

        if(a[i] != b[i]){
            
            return false;
        }
        if(a[i] == 0 || b[i] == 0){
            break;
        }

        i++;
    }




    return true;
}

function void substring(String* this, String* new, int start, int end){

    int l = end-start;
    free(new->value);
    new->value = malloc(l);
    memcpy(new->value,this->value+start,l);
    new->len=l;
}

function int find(String* this, char* sequence){

    int sql = strlen(sequence);


}