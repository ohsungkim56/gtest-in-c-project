#include <iostream>
#include <exception>
#include "external_api.h"

using namespace std;

class ConnectionFailException : public exception{};

int open_connection(const char* addr);

void close_connection(int fd);

