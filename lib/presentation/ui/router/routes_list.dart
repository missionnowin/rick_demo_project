import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_demo_project/core/injection/service_locator.dart';
import 'package:rick_demo_project/presentation/blocs/characters/characters_bloc.dart';
import 'package:rick_demo_project/presentation/blocs/favorite_characters/favorite_characters_bloc.dart';
import 'package:rick_demo_project/presentation/blocs/single_character/single_character_bloc.dart';
import 'package:rick_demo_project/presentation/ui/pages/characters_page.dart';
import 'package:rick_demo_project/presentation/ui/pages/favorites_page.dart';
import 'package:rick_demo_project/presentation/ui/pages/single_character_page.dart';
import 'package:rick_demo_project/presentation/ui/widgets/common/custom_navigation_bar.dart';


final List<RouteBase> routesList = [
  StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) => CustomNavigationBar(navigationShell: navigationShell),
    branches: [
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: '/characters',
            builder: (context, state) => BlocProvider(
              create: (context) => getIt<CharactersBloc>()..add(FetchCharactersEvent()),
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
                create: (context) => getIt<FavoriteCharactersBloc>()..add(FetchFavoriteCharactersEvent()),
                child: const FavoritesPage(),
              ),
            )
          ]
      ),
    ]
  ),
  GoRoute(
    path: '/character/:id',
    builder: (context, state) {
      final characterId = int.parse(state.pathParameters['id']!);
      return BlocProvider(
        create: (context) => getIt<SingleCharacterBloc>()..add(FetchSingleCharacterEvent(characterId)),
        child: SingleCharacterPage(characterId: characterId),
      );
    },
  ),
];