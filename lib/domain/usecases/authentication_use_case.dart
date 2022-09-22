import '../entities/account.dart';
import '../entities/authorization.dart';
import '../repositories/authentication_repository.dart';

class AuthenticationUseCase {
  final AuthenticationRepository _authenticationRepository;
  AuthenticationUseCase(this._authenticationRepository);

  Future<Account> createEmailAccount(String email, String password) async {
    final accountInfo = await _authenticationRepository.createEmailAccount(email, password);
    return accountInfo;
  }

  Future<Authorization> accountLogin(String email, String password) async {
    final authorizationInfo = await _authenticationRepository.accountLogin(email, password);
    return authorizationInfo;
  }
}
