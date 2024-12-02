
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jaat_app/theme/theme.dart';
import 'package:webview_flutter/webview_flutter.dart';

// import '/plugins/nb_utils/nb_utils.dart' as utl;
import 'core/locator.dart';
import 'core/navigator_service.dart';
import 'core/res/utils/app_colors.dart';
import 'core/router.dart' as router;
import 'core/router_constants.dart';

/// Entry point for App
/// seting up [locator] for singelton instances
/// init [Firebase]
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocatorInjector.setUpLocator();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  /// Required to setup on Platform basis, as this plugin compiles natively
  if (Platform.isAndroid) {
    WebView.platform = SurfaceAndroidWebView();
  } else {
    WebView.platform = CupertinoWebView();
  }

  // await utl.initialize();

  configLoading();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const Application());
}

/// configure easyloading, P.S. we are using it only on checkout screen
void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 4000)
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorType = EasyLoadingIndicatorType.chasingDots
    ..indicatorSize = 45.0
    ..indicatorColor = AppColors.primaryColor
    ..progressColor = AppColors.primaryColor
    ..backgroundColor = const Color.fromARGB(255, 151, 44, 44).withOpacity(1)
    ..textColor = const Color.fromARGB(255, 107, 8, 8)
    ..maskType = EasyLoadingMaskType.custom
    ..maskColor = const Color.fromARGB(255, 246, 244, 244).withOpacity(0.40)
    ..dismissOnTap = false;
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      builder: EasyLoading.init(),

      /// setup app theme
      theme: themeData(context),
      navigatorKey: locator<NavigatorService>().navigatorKey,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.Router.generateRoute,
      // initialRoute: orderDetailsRoute,
      initialRoute: productListRoute,

      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [
        Locale('en', ''),
        Locale('zh', ''),
        Locale('he', ''),
        Locale('es', ''),
        Locale('ru', ''),
        Locale('ko', ''),
        Locale('hi', ''),
      ],
    );
  }
}
