import 'package:flutter/material.dart';
import 'package:flutter_gitser/config/routes/screen_routes.dart';
import 'package:flutter_gitser/features/gitser/presentation/pages/detail_page.dart';
import 'package:flutter_gitser/features/gitser/presentation/pages/favorite_page.dart';
import 'package:flutter_gitser/features/gitser/presentation/pages/home_page.dart';
import 'package:flutter_gitser/features/gitser/presentation/pages/splash_page.dart';

class RoutesConfiguration {
  PageRoute getPageRoute({String? routeName, Widget? screen}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => screen!,
    );
  }

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ScreenRoutes.home:
        return getPageRoute(
          routeName: ScreenRoutes.home,
          screen: HomePage(),
        );

      case ScreenRoutes.detail:
        final args = settings.arguments as String;
        return getPageRoute(
          routeName: ScreenRoutes.detail,
          screen: DetailPage(username: args),
        );

      case ScreenRoutes.favorite:
        return getPageRoute(
          routeName: ScreenRoutes.favorite,
          screen: const FavoritePage(),
        );

      case ScreenRoutes.splash:
        return getPageRoute(
          routeName: ScreenRoutes.splash,
          screen: const SplashPage(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No Routes Defined For ${settings.name}'),
            ),
          ),
        );
    }
  }
}
