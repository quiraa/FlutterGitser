import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gitser/config/routes/routes_config.dart';
import 'package:flutter_gitser/config/routes/screen_routes.dart';
import 'package:flutter_gitser/di/injection.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/detail/detail_bloc.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/detail/followers/followers_bloc.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/detail/following/following_bloc.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/detail/repository/repository_bloc.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/home/home_bloc.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/home/home_event.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDependency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => injection()..add(const GetAllUsersEvent()),
        ),
        BlocProvider<DetailBloc>(create: (context) => injection()),
        BlocProvider<FollowersBloc>(create: (context) => injection()),
        BlocProvider<FollowingBloc>(create: (context) => injection()),
        BlocProvider<RepositoryBloc>(create: (context) => injection()),
      ],
      child: MaterialApp(
        title: 'Flutter Gitser',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: ScreenRoutes.splash,
        onGenerateRoute: RoutesConfiguration().onGenerateRoute,
      ),
    );
  }
}
