#include "api.h"
#include "external_api.h"

int open_connection(const char* addr){
	int fd = conn(addr); // call external API
	if(fd == 0){
		cout << "external api " << __func__ << "returned 0" << endl;
		throw ConnectionFailException();
	}
	return fd;
}

void close_connection(int fd){
	bool result = disconn(fd);
	if(result){
		cout << "external api " << __func__ << " failed." << endl;
	}
}

