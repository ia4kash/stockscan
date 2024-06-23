import 'package:flutter/material.dart';
import 'package:stockscan/app/data/models/response/stocks_response.dart';
import 'package:stockscan/app/data/values/constants.dart';
import 'package:stockscan/utils/utils.dart';

class RenderText extends StatelessWidget {
  final Criteria criteria;

  const RenderText(this.criteria, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final input = criteria.text ?? "";
    return Wrap(
      spacing: 5,
      children: input.split(' ').toList().map((e) {
        if (e.startsWith('\$')) {
          final Variable? variable = criteria.variables?[e];
          return GestureDetector(
            onTap: () {
              final a = variable?.values?..sort();
              variable?.type == VariableType.value.name
                  ? AppUtils.getBottomSheet(
                      children: a
                              ?.map(
                                (e) => Column(
                                  children: [
                                    Text(
                                      '$e',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Divider(),
                                  ],
                                ),
                              )
                              .toList() ??
                          [SizedBox()],
                    )
                  : AppUtils.getBottomSheet(children: [
                      Text("Set Parameter"),
                      SizedBox(height: 10.0),
                      TextFormField(
                        initialValue: "${variable?.defaultValue}",
                      )
                    ]);
            },
            child: Text(
              "(${getText(variable)})",
              style: TextStyle(fontSize: 18, color: Colors.blue),
            ),
          );
        } else {
          return Text(
            e,
            style: TextStyle(fontSize: 18),
          );
        }
      }).toList(),
    );
  }
}

String getText(Variable? variable) => variable?.type == VariableType.value.name
    ? "${variable?.values?[0]}"
    : variable?.defaultValue.toString() ?? "";
