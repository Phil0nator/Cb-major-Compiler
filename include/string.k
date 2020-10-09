struct String{

    char* content;


}
function void createString(String *this, char* stuff){
    this->content = malloc(strlen(stuff));
    memcpy(this->content, stuff);
}
function void appendString(String *this, char* newstuff){

}