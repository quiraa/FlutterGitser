import 'package:flutter/material.dart';
import 'package:flutter_gitser/config/routes/app_router.dart';
import 'package:flutter_gitser/config/routes/screen_routes.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SplashPage extends HookWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      void navigateToHome() async {
        await Future.delayed(const Duration(seconds: 2));
        AppRouter.pushAndReplace(context, ScreenRoutes.home);
      }

      navigateToHome();
      return () {};
    }, []);

    return const Scaffold(
      body: Center(
        child: Text('Gitser Flutter'),
      ),
    );
  }
}
