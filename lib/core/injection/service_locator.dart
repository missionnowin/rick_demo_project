import 'package:get_it/get_it.dart';
import 'package:rick_demo_project/data/data_sources/database_client.dart';
import 'package:rick_demo_project/data/data_sources/dio_client.dart';
import 'package:rick_demo_project/data/repositories/characters_repository_impl.dart';
import 'package:rick_demo_project/data/services/characters/database/character_database_service.dart';
import 'package:rick_demo_project/data/services/characters/network/character_network_service.dart';
import 'package:rick_demo_project/domain/repositories/characters_repository.dart';
import 'package:rick_demo_project/domain/usecases/add_character_to_favorite.dart';
import 'package:rick_demo_project/domain/usecases/get_character.dart';
import 'package:rick_demo_project/domain/usecases/get_characters.dart';
import 'package:rick_demo_project/domain/usecases/get_favorite_characters.dart';
import 'package:rick_demo_project/domain/usecases/remove_character_from_favorite.dart';
import 'package:rick_demo_project/presentation/blocs/characters/characters_bloc.dart';
import 'package:rick_demo_project/presentation/blocs/favorite_characters/favorite_characters_bloc.dart';
import 'package:rick_demo_project/presentation/blocs/single_character/single_character_bloc.dart';
import 'package:rick_demo_project/presentation/event_bus/character_event_bus.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setup() async{
  // Register DioClient as a singleton
  final prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<DioClient>(DioClient(prefs));

  // Register DatabaseClient as a singleton
  getIt.registerSingletonAsync<DatabaseClient>(
        () async {
          final client = DatabaseClient();
          // Ensure the database is initialized
          await client.initialize();
          return client;
    },
  );
  // Ensure the database is initialized
  await getIt.isReady<DatabaseClient>();

  // Register services
  getIt.registerFactory<CharacterNetworkService>(
        () => NetworkServiceImpl(getIt<DioClient>()),
  );
  getIt.registerFactory<CharacterDatabaseService>(
        () => DatabaseServiceImpl(getIt<DatabaseClient>()),
  );

  // Register repositories
  getIt.registerFactory<CharactersRepository>(
        () => CharactersRepositoryImpl(
      networkService: getIt<CharacterNetworkService>(),
      databaseService: getIt<CharacterDatabaseService>(),
    ),
  );

  // Register Use Cases
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
  getIt.registerFactory<GetCharacter>(
      () => GetCharacter(getIt<CharactersRepository>())
  );

  // Register Event Bus For Character Blocs
  getIt.registerSingleton<CharacterEventBus>(CharacterEventBus());

  // Register BLoCs
  getIt.registerFactory<CharactersBloc>(
        () => CharactersBloc(
            getCharacters: getIt<GetCharacters>(),
            addCharacterToFavorite: getIt<AddCharacterToFavorite>(),
            removeCharacterFromFavorite: getIt<RemoveCharacterFromFavorite>(),
            eventBus: getIt<CharacterEventBus>()
        ),
  );
  getIt.registerFactory<FavoriteCharactersBloc>(
        () => FavoriteCharactersBloc(
      getFavoriteCharacters: getIt<GetFavoriteCharacters>(),
      addCharacterToFavorite: getIt<AddCharacterToFavorite>(),
      removeCharacterFromFavorite: getIt<RemoveCharacterFromFavorite>(),
      eventBus: getIt<CharacterEventBus>()
    ),
  );
  getIt.registerFactory<SingleCharacterBloc>(
      () => SingleCharacterBloc(
        getCharacter: getIt<GetCharacter>(),
        addCharacterToFavorite: getIt<AddCharacterToFavorite>(),
        removeCharacterFromFavorite: getIt<RemoveCharacterFromFavorite>(),
        eventBus: getIt<CharacterEventBus>(),
      )
  );
}