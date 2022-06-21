import 'dart:async';
import 'dart:io';

import 'package:components/components.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:im/bloc/network_bloc.dart';
import 'package:im/bloc/network_state.dart';
import 'package:im/views/splash_screen.dart';
import 'package:page_transition/page_transition.dart';

import 'app_routes.dart';

class App extends StatelessWidget {
  static const App _instance = App._internal();

  const App._internal();
  factory App() {
    return _instance;
  }

  @override
  Widget build(BuildContext context) {
    return getMaterialApp(widget: const SplashScreen(), title: 'Launch', buildContext: context);
  }

  AppRoutes getAppRoutes() {
    return AppRoutes();
  }

  Widget getMaterialApp({required Widget widget, required String title, required BuildContext buildContext}) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      home: widget,
      theme: AppStyle.lightTheme(buildContext),
      localizationsDelegates: buildContext.localizationDelegates,
      supportedLocales: buildContext.supportedLocales,
      locale: buildContext.locale,
      onGenerateRoute: getAppRoutes().getRoutes,
    );
  }

  Future<dynamic> setNavigation(
      BuildContext context, String appRouteName,{VoidCallback? func}) async {
    Future.delayed(const Duration(milliseconds: 10), () async {
      final info = await Navigator.push(
          context,
          PageTransition(
              child: getAppRoutes().getWidget(context, appRouteName),
              type: PageTransitionType.fade,
              settings: RouteSettings(name: appRouteName),
              duration: const Duration(microseconds: 0))
      ).then((value) =>func);
      return info;
    });
  }

  void setBackNavigation(BuildContext context) {
    Navigator.pop(context, "true");
  }

  void closeApp() {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else {
      exit(0);
    }
  }
}
