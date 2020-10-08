unsigned int rand_next = 1;

function int rand(){
    rand_next = rand_next*235495089223452;
    return (rand_next % 13791369)>>5;
}


function void srand(unsigned int seed){
    rand_next=seed;
}