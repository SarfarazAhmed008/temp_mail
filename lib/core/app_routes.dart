import 'package:get/route_manager.dart';
import '../presentation/screens/message_screen.dart';
import '../presentation/bindings/authentication_binding.dart';
import '../presentation/bindings/message_binding.dart';
import '../presentation/screens/authentication_screen.dart';
import '../presentation/bindings/domain_binding.dart';
import '../presentation/screens/domain_screen.dart';


class AppRoutes {
  AppRoutes._();

  static const String domain = '/domain';
  static const String authenticate = '/authenticate';
  static const String messages = '/messages';
}

class AppPages {
  AppPages._();

  static final pages = [
    GetPage(
      name: AppRoutes.domain,
      page: () => DomainScreen(),
      binding: DomainBinding(),
    ),
    GetPage(
      name: AppRoutes.authenticate,
      page: () => AuthenticationScreen(),
      binding: AuthenticationBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.messages,
      page: () => MessageScreen(),
      binding: MessageBinding(),
      transition: Transition.rightToLeft,
    ),
  ];
}
