import 'package:get_it/get_it.dart';
import 'package:rick_demo_project/data/repositories/characters_repository_impl.dart';
import 'package:rick_demo_project/data/services/database/database_client.dart';
import 'package:rick_demo_project/data/services/database/database_service.dart';
import 'package:rick_demo_project/data/services/network/dio_client.dart';
import 'package:rick_demo_project/data/services/network/network_service.dart';
import 'package:rick_demo_project/domain/repositories/characters_repository.dart';
import 'package:rick_demo_project/domain/usecases/add_character_to_favorite.dart';
import 'package:rick_demo_project/domain/usecases/get_characters.dart';
import 'package:rick_demo_project/domain/usecases/get_favorite_characters.dart';
import 'package:rick_demo_project/domain/usecases/remove_character_from_favorite.dart';
import 'package:rick_demo_project/presentation/blocs/characters/characters_bloc.dart';
import 'package:rick_demo_project/presentation/blocs/favorite_characters/favorite_characters_bloc.dart';

final getIt = GetIt.instance;

Future<void> setup() async{
  // Register DioClient as a singleton
  getIt.registerSingleton<DioClient>(DioClient());

  // Register DatabaseClient as a singleton
  getIt.registerSingletonAsync<DatabaseClient>(
        () async {
          final client = DatabaseClient();
          await client.initialize(); // Ensure the database is initialized
          return client;
    },
  );
  // Ensure the database is initialized
  await getIt.isReady<DatabaseClient>();

  /// Register services
  getIt.registerFactory<NetworkService>(
        () => NetworkServiceImpl(getIt<DioClient>()),
  );
  getIt.registerFactory<DatabaseService>(
        () => DatabaseServiceImpl(getIt<DatabaseClient>()),
  );

  /// Register repositories
  getIt.registerFactory<CharactersRepository>(
        () => CharactersRepositoryImpl(
      networkService: getIt<NetworkService>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );

  /// Register Use Cases
  getIt.registerFactory<GetCharacters>(
        () => GetCharacters(getIt<CharactersRepository>()),
  );
  getIt.registerFactory<GetFavoriteCharacters>(
        () => GetFavoriteCharacters(getIt<CharactersRepository>()),
  );
  getIt.registerFactory<AddCharacterToFavorite>(
        () => AddCharacterToFavorite(getIt<CharactersRepository>()),
  );
  getIt.registerFactory<RemoveCharacterFromFavorite>(
        () => RemoveCharacterFromFavorite(getIt<CharactersRepository>()),
  );

  ///Register BLoCs
  getIt.registerFactory<CharactersBloc>(
        () => CharactersBloc(
            getCharacters: getIt<GetCharacters>(),
            addCharacterToFavorite: getIt<AddCharacterToFavorite>(),
            removeCharacterFromFavorite: getIt<RemoveCharacterFromFavorite>()),
  );
  getIt.registerFactory<FavoriteCharactersBloc>(
        () => FavoriteCharactersBloc(
      getFavoriteCharacters: getIt<GetFavoriteCharacters>(),
      addCharacterToFavorite: getIt<AddCharacterToFavorite>(),
      removeCharacterFromFavorite: getIt<RemoveCharacterFromFavorite>(),
    ),
  );
}