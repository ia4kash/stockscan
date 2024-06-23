import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stockscan/app/app_binding.dart';
import 'package:stockscan/app/data/values/constants.dart';
import 'package:stockscan/app/data/values/env.dart';
import 'package:stockscan/app/routes/app_pages.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => unFocus(context),
      child: GetMaterialApp(
        title: Env.title,
        navigatorKey: GlobalKeys.navigationKey,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.HOME,
        getPages: AppPages.pages,
        defaultTransition: Transition.cupertino,
        initialBinding: AppBinding(),
        builder: kDebugMode ? null : widgetBuilder,
      ),
    );
  }
}

unFocus(context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus!.unfocus();
  }
}

Widget widgetBuilder(BuildContext context, Widget? widget) {
  Widget error = const Text('...Please try again later..');
  debugPrint("error widget type: ${widget.runtimeType}");
  if (widget is Scaffold || widget is Navigator || widget is FocusScope) {
    error = Scaffold(body: Center(child: error));
  }
  ErrorWidget.builder = (errorDetails) => error;
  if (widget != null) return widget;
  throw ('Please try again later');
}
