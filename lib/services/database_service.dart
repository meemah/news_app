/// Get usrr object
/// when you get the user object, generate a key string using random service
/// get encrypted password using encrypted password
/// save all in the userobject
///
///
/// get the user(collect the email and password){
/// check the db where the email is valid,
/// decrypt the password and verify if its the same as the one the user entered
/// then return object
///
/// }
///
abstract class DatabaseService {
  Future initDatabase();
}
