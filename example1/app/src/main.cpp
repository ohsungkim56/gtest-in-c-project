
#include <iostream>
#include "nw_interface.h"

using namespace std;

int main(){

	cout << "[" << __func__ << "] start" << endl;

	int fd = open_connection("127.0.0.1");

	// do something...
	
	close_connection(fd);

	return 0;
}
