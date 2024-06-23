import 'package:get/get.dart';
import 'package:stockscan/app/app_controller.dart';
import 'package:stockscan/app/data/repository/stocks_repository.dart';

import 'data/network/network_requester.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // Repositories
    Get.put(NetworkRequester.shared, permanent: true);
    Get.put(StocksRepository(), permanent: true);

    // Controllers
    Get.put(AppController(), permanent: true);
  }
}
