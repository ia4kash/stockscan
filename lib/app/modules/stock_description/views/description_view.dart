import 'package:flutter/material.dart';
import 'package:stockscan/app/data/models/response/stocks_response.dart';
import 'package:stockscan/app/modules/home/views/home_view.dart';
import 'package:stockscan/app/modules/stock_description/views/render_text.dart';

class DescriptionView extends StatelessWidget {
  final Stocks stock;

  DescriptionView({super.key, required this.stock});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(stock.name ?? ""),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${stock.tag} ${stock.color == "red" ? '\u2193' : '\u2191'}",
              style:
                  TextStyle(fontSize: 16, color: getColor(stock.color ?? "")),
            ),
            SizedBox(height: 10.0),
            ListView.separated(
              itemCount: stock.criteria?.length ?? 0,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int i) {
                return RenderText(stock.criteria?[i] ?? Criteria());
              },
              separatorBuilder: (_, __) => SizedBox(height: 10.0),
            ),
          ],
        ),
      ),
    );
  }
}
