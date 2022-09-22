import 'package:get/get.dart';
import '../../data/repositories/domain_repository.dart';
import '../../domain/usecases/fetch_domains_use_case.dart';
import '../controllers/domain_controller.dart';

class DomainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DomainRepositoryImp());
    Get.lazyPut(() => FetchDomainsUseCase(Get.find<DomainRepositoryImp>()));
    Get.lazyPut(() => DomainController(Get.find<FetchDomainsUseCase>()));
  }
}
