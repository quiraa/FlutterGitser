// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_gitser/config/routes/app_router.dart';
import 'package:flutter_gitser/config/routes/screen_routes.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SplashScreen extends HookWidget {
  const SplashScreen({Key? key}) : super(key: key);

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

    return Scaffold(
      body: Center(
        child: const Text(
          'Gitser Flutter',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
