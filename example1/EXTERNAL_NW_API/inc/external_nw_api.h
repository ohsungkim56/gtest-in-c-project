
int conn(const char* addr);

bool disconn(int fd);

bool isValid(int fd);

int write(int fd, char* data);

int read(int fd, char* buffer);
