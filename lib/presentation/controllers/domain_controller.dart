import 'package:get/get.dart';
import '../../core/constants/strings.dart';
import '../../core/services/local_storage_services.dart';
import '../../domain/entities/domain.dart';
import '../../domain/usecases/fetch_domains_use_case.dart';

class DomainController extends GetxController {
  DomainController(this._fetchDomainsUseCase);
  final FetchDomainsUseCase _fetchDomainsUseCase;

  final localStorage = Get.find<LocalStorageService>();
  RxList<Domain> domainList = <Domain>[].obs;
  RxBool load = true.obs;
  RxBool isLogged = false.obs;
  RxString userEmail = "".obs;

  @override
  void onInit() {
    _loadDomains();
    isLogged.value = localStorage.getStringValue(StringData.tokenKey) != null;
    localStorage.getStringValue(StringData.emailKey) != null ?
        userEmail.value = localStorage.getStringValue(StringData.emailKey)! : userEmail.value = "";
    super.onInit();
  }

  Future<void> _loadDomains() async {
    final domains = await _fetchDomainsUseCase.getDomains(1);
    domainList.assignAll(domains.domainModelList!);
    load(false);
  }

  void logout(){
    localStorage.clearAllValues();
    isLogged(false);
  }

}
