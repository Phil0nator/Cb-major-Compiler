#ifndef __SYSTEM
#   error "system.k should only be included through system.cb"
#endif




char* __systembashpath = "/bin/bash";

char** __emptyenv = {"PATH=/bin:/usr/bin:/sbin:/usr/sbin",nullptr, nullptr};


char** __systemcallargvconst = {"sudo", "-c", nullptr, nullptr};


long system(char* command){

    
    pid_t pid = fork();
    if(pid == 0 ){
        
        __systemcallargvconst[2] = command;


        long err = execve(__systembashpath, __systemcallargvconst, __emptyenv);
        printf(strerror(err));
        
    } // if child, execute bash
    waitpid(pid, nullptr, nullptr);
    return 0;
}
