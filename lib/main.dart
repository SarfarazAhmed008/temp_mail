import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/services/local_storage_services.dart';
import 'presentation/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocalServices();
  runApp(const Application());
}

initLocalServices() async {
  await Get.putAsync(() => LocalStorageService.initialize());
}
