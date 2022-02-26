#include <iostream>
#include <exception>

using namespace std;

class ConnectionFailException : public exception{};

int open_connection(const char* addr);

void close_connection(int fd);

bool write_date(int fd, char* data);
