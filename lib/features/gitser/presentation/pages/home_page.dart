import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gitser/config/routes/app_router.dart';
import 'package:flutter_gitser/config/routes/screen_routes.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/detail/detail_bloc.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/detail/detail_event.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/home/home_bloc.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/home/home_event.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/home/home_state.dart';
import 'package:flutter_gitser/features/gitser/presentation/widgets/user_card_item.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// class HomePage extends HookWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: _buildBody(),
//       ),
//     );
//   }

//   _buildBody() {
//     return BlocBuilder<HomeBloc, HomeState>(
//       builder: (context, state) {
//         switch (state.runtimeType) {
//           case HomeLoadingState:
//             return const Center(
//               child: CircularProgressIndicator(),
//             );

//           case HomeErrorState:
//             return Center(
//               child: Padding(
//                 padding: const EdgeInsets.all(32.0),
//                 child: Text(
//                   state.error!.message!,
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             );

//           case HomeSuccessState:
//             return HomeContent(
//               listUsers: state.listUsers!,
//               onUserClicked: (String username) {},
//             );

//           default:
//             return const SizedBox();
//         }
//       },
//     );
//   }
// }

class HomePage extends HookWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Container(
              color: Colors.white,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );

          case HomeErrorState:
            print(state.error!.message!);
            return Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    state.error!.message!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
              ),
            );

          case HomeSuccessState:
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                surfaceTintColor: Colors.transparent,
                toolbarHeight: 86.0,
                title: _buildSearchField(context),
              ),
              body: AvailableUserContent(
                listUsers: state.listUsers!,
                onUserClicked: (username) {
                  AppRouter.push(
                    context,
                    ScreenRoutes.detail,
                    arguments: username,
                  );
                  BlocProvider.of<DetailBloc>(context).add(
                    GetDetailUserEvent(username),
                  );
                },
              ),
              floatingActionButton: _buildFavoriteFab(context),
            );

          default:
            return Container(
              color: Colors.white,
              child: const Center(
                child: Text('Default'),
              ),
            );
        }
      },
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16.0),
        prefixIcon: IconButton(
          onPressed: () {
            BlocProvider.of<HomeBloc>(context).add(
              SearchUserEvent(_searchController.text.toString()),
            );
          },
          icon: const Icon(Icons.search_rounded),
        ),
        suffixIcon: _searchController.text.isEmpty
            ? null
            : IconButton(
                onPressed: () {
                  _searchController.clear();
                },
                icon: const Icon(Icons.clear_rounded),
              ),
        hintText: 'Search Users',
        border: UnderlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(50),
        ),
        filled: true,
      ),
    );
  }

  Widget _buildFavoriteFab(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(50.0),
        ),
      ),
      color: Theme.of(context).colorScheme.secondaryContainer,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          AppRouter.push(context, ScreenRoutes.favorite);
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 8.0,
          ),
          child: Icon(Icons.star_rounded),
        ),
      ),
    );
  }
}
