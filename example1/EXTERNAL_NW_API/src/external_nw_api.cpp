
#include <string.h>
#include "external_nw_api.h"

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

bool isValid(int fd){
	if(fd > 0) return true;
	return false;
}

int write(int fd, char* data){
	return strlen(data);
}

int read(int fd, char* data){

	const char* s = "{ asd : 1}";

	strcpy(data, s);

	return strlen(s);


}
