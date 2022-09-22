import '../entities/account.dart';
import '../entities/authorization.dart';

abstract class AuthenticationRepository {
  Future<Account> createEmailAccount(String email, String password);
  Future<Authorization> accountLogin(String email, String password);
}
