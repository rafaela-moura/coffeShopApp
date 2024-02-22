import 'package:coffeapp/utils/app_palette.dart';
import 'package:coffeapp/utils/routes.dart';
import 'package:coffeapp/view/detail_view.dart';
import 'package:coffeapp/view/home_view.dart';
import 'package:coffeapp/view/map_view.dart';
import 'package:coffeapp/view/order_view.dart';
import 'package:coffeapp/view/start_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffe App',
      theme: ThemeData(
        fontFamily: 'Sora',
        colorScheme: ColorScheme.fromSeed(seedColor: AppPalette.primary),
        useMaterial3: true,
      ),
      navigatorKey: navigatorKey,
      routes: {
        RoutesApp.START: (context) => const StartView(),
        RoutesApp.HOME: (context) => const HomeView(),
        RoutesApp.DETAILITEM: (context) => const DetailItemView(),
        RoutesApp.ORDER: (context) => const OrderView(),
        RoutesApp.MAP: (context) => const MapView(),
      },
      initialRoute: RoutesApp.START,
    );
  }
}
