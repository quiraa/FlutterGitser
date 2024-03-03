import 'package:flutter/material.dart';
import 'package:flutter_gitser/config/routes/app_router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FavoriteScreen extends HookWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        leading: IconButton(
          onPressed: () => AppRouter.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Favorite',
        ),
      ),
    );
  }
}
