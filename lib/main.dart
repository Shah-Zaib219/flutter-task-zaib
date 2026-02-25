import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_task_zaib/app/app.bottomsheets.dart';
import 'package:flutter_task_zaib/app/app.dialogs.dart';
import 'package:flutter_task_zaib/app/app.locator.dart';
import 'package:flutter_task_zaib/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'ui/views/bundles/bundles_viewmodel.dart';
import 'services/cart_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => locator<CartService>()),
        ChangeNotifierProvider(create: (_) => BundlesViewModel()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [StackedService.routeObserver],
    );
  }
}
