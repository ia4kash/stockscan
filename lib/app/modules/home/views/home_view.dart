import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stockscan/app/data/values/strings.dart';
import 'package:stockscan/app/modules/stock_description/views/description_view.dart';
import 'package:stockscan/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appName),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.stocks.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int i) {
                  final stock = controller.stocks[i];
                  return ListTile(
                    onTap: () => Get.to(() => DescriptionView(stock: stock)),
                    title: Text(
                      stock.name ?? "",
                      style: TextStyle(fontSize: 16),
                    ),
                    subtitle: Text(
                      "${stock.tag} ${stock.color == "red" ? '\u2193' : '\u2191'}",
                      style: TextStyle(
                          fontSize: 14, color: getColor(stock.color ?? "")),
                    ),
                  );
                },
              ),
      ),
    );
  }
}

Color getColor(String color) {
  if (color == "green") return Colors.green;
  if (color == "red") return Colors.red;
  return Colors.black;
}
