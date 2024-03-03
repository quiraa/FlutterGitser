import 'package:flutter/material.dart';
import 'package:flutter_gitser/config/routes/screen_routes.dart';
import 'package:flutter_gitser/features/gitser/presentation/screens/detail_screen.dart';
import 'package:flutter_gitser/features/gitser/presentation/screens/favorite_screen.dart';
import 'package:flutter_gitser/features/gitser/presentation/screens/home_screen.dart';
import 'package:flutter_gitser/features/gitser/presentation/screens/splash_screen.dart';

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
          screen: const HomeScreen(),
        );

      case ScreenRoutes.detail:
        final args = settings.arguments as String;
        return getPageRoute(
          routeName: ScreenRoutes.detail,
          screen: DetailScreen(username: args),
        );

      case ScreenRoutes.favorite:
        return getPageRoute(
          routeName: ScreenRoutes.favorite,
          screen: const FavoriteScreen(),
        );

      case ScreenRoutes.splash:
        return getPageRoute(
          routeName: ScreenRoutes.splash,
          screen: const SplashScreen(),
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
