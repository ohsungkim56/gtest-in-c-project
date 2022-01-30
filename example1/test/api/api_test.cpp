
#include "gmock/gmock.h"

#include "../../api/src/api.cpp"

using ::testing::_;
using ::testing::Return;
using ::testing::Throw;

class MyMock{
public:
	MOCK_METHOD(int, conn, (const char* addr));
	MOCK_METHOD(bool, disconn, (int fd));
};

MyMock* mock;

int conn(const char* addr){
	return mock->conn(addr);
}

bool disconn(int fd){
	return mock->disconn(fd);
}

TEST(API_TEST, API_TEST_1){
	mock = new MyMock();
	ON_CALL(*mock, conn(_)).WillByDefault(Return(100));
	EXPECT_CALL(*mock, conn);

	EXPECT_EQ(open_connection("127.0.0.1"), 100);

	delete mock;
}

TEST(API_TEST, API_TEST_2){
	mock = new MyMock();
	ON_CALL(*mock, conn(_)).WillByDefault(Return(0));
	EXPECT_CALL(*mock, conn);

	EXPECT_THROW(open_connection("127.0.0.1"), ConnectionFailException);

	delete mock;
}

TEST(API_TEST, API_TEST_3){
	mock = new MyMock();

	ON_CALL(*mock, disconn(_)).WillByDefault(Return(true));
	EXPECT_CALL(*mock, disconn);

	close_connection(0);
	
	delete mock;
}
