
#include "external_api.h"

int conn(const char* addr){
	return 1;
}

bool disconn(int fd){
	if(fd == 0){
		return false;
	}
	else{
		return true;
	}
}


