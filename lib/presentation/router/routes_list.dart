import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_demo_project/core/injection/service_locator.dart';
import 'package:rick_demo_project/presentation/ui/pages/characters_page.dart';
import 'package:rick_demo_project/presentation/ui/pages/favorites_page.dart';

import '../blocs/characters/characters_bloc.dart';
import '../blocs/favorite_characters/favorite_characters_bloc.dart';
import '../ui/widgets/common/custom_navigation_bar.dart';

final List<RouteBase> routesList = [
  StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) => CustomNavigationBar(navigationShell: navigationShell),
    branches: [
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: '/characters',
            builder: (context, state) => BlocProvider(
              create: (context) => getIt<CharactersBloc>(),
              child: const CharactersPage(),
            ),
          )
        ]
      ),
      StatefulShellBranch(
          routes: [
            GoRoute(
                path: '/favorites',
              builder: (context, state) => BlocProvider(
                create: (context) => getIt<FavoriteCharactersBloc>(),
                child: const FavoritesPage(),
              ),
            )
          ]
      ),
    ]
  )
];