import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/models/news_resp.dart';
import 'package:news_app/models/news_user.dart';
import 'package:news_app/services/database_service.dart';
import 'package:news_app/services/encryption_service.dart';
import 'package:news_app/services/news_service.dart';

import 'main_test.mocks.dart';

@GenerateMocks([
  DatabaseServiceImpl,
  NewsServiceImpl,
], customMocks: [
  // ignore: deprecated_member_use
  MockSpec<NewsRespModel>(returnNullOnMissingStub: true),
  // ignore: deprecated_member_use
  MockSpec<NewsUser>(returnNullOnMissingStub: true),
  // ignore: deprecated_member_use
  MockSpec<EncryptionServiceImpl>(returnNullOnMissingStub: true),
])
void main() {
  group("testing getting news", () {
    final newsServiceImpl = MockNewsServiceImpl();
    final mockResponse = MockNewsRespModel();

    test("Test if the news endpoint returns news model", () {
      when(mockResponse.totalResults).thenReturn(1);

      when(
        newsServiceImpl.getNews(pageNumber: "1"),
      ).thenAnswer((_) => Future.value(mockResponse));
      expect(1, mockResponse.totalResults);
    });

    test("Test if the news endpoint returns news model", () {
      when(mockResponse.totalResults).thenReturn(1);

      when(
        newsServiceImpl.getNews(pageNumber: "1"),
      ).thenAnswer((_) => Future.value(mockResponse));
      expect(1, mockResponse.totalResults);
    });
  });

  group("testing authentication", () {
    String email = "meemah@getnada.com";
    String encryptedPassword = "unittest";
    String userName = "meemah";
    String userKeyString = "testkey";
    final databaseServiceImpl = MockDatabaseServiceImpl();
    final mockResponse = MockNewsUser();
    test("test if user is present", () {
      when(
        mockResponse.email,
      ).thenReturn(email);
      when(
        mockResponse.encrpytedPassword,
      ).thenReturn(encryptedPassword);
      when(
        mockResponse.userName,
      ).thenReturn(userName);
      when(
        mockResponse.userKeyString,
      ).thenReturn(userKeyString);
      when(
        databaseServiceImpl.getUser(email: email, password: encryptedPassword),
      ).thenAnswer((_) => Future.value(mockResponse));
      expect(userName, mockResponse.userName);
    });
  });
}
