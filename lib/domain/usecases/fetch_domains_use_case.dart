import '../entities/domain_collection.dart';
import '../repositories/domain_repository.dart';

class FetchDomainsUseCase {
  final DomainRepository _domainRepository;
  FetchDomainsUseCase(this._domainRepository);

  Future<DomainCollection> getDomains(int page) async {
    final domains = await _domainRepository.fetchDomainList(page);
    return domains;
  }
}
