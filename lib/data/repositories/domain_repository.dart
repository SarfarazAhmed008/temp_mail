import '../remote_services/email_service.dart';
import '../models/domain_collection_model.dart';
import '../../domain/repositories/domain_repository.dart';

class DomainRepositoryImp extends DomainRepository {

  @override
  Future<DomainCollectionModel> fetchDomainList(int page) async{
    final response = await EmailService.getDomains(page);
    return DomainCollectionModel.fromJson(response);
  }

}
