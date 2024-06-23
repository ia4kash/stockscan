import 'dart:developer';

import 'package:get/get.dart';
import 'package:stockscan/app/data/models/response/stocks_response.dart';
import 'package:stockscan/app/data/repository/stocks_repository.dart';
import 'package:stockscan/base/base_controller.dart';

class HomeController extends BaseController<StocksRepository> {
  final isLoading = RxBool(false);
  final stocks = RxList<Stocks>();

  @override
  void onInit() {
    getUserProfile();
    super.onInit();
  }

  getUserProfile() async {
    isLoading.value = true;
    final response = await repository.getStocksData();

    isLoading.value = false;
    if (response.data != null) {
      stocks.value = response.data ?? [];
    }
  }
}
