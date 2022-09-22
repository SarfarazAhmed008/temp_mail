import '../entities/domain_collection.dart';

abstract class DomainRepository {
  Future<DomainCollection> fetchDomainList(int page);
}
