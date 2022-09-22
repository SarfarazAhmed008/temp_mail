import '../models/authorization_model.dart';
import '../models/account_model.dart';
import '../remote_services/email_service.dart';
import '../../domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImp extends AuthenticationRepository {

  @override
  Future<AccountModel> createEmailAccount(String email, String password) async{
    final response = await EmailService.createAccount(email, password);
    return AccountModel.fromJson(response);
  }

  @override
  Future<AuthorizationModel> accountLogin(String email, String password) async{
    final response = await EmailService.accountLogin(email, password);
    return AuthorizationModel.fromJson(response);
  }

}
