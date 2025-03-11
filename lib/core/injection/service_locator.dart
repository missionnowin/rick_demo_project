import 'package:get_it/get_it.dart';
import 'package:rick_demo_project/data/repositories/characters_repository_impl.dart';
import 'package:rick_demo_project/data/services/database/database_client.dart';
import 'package:rick_demo_project/data/services/database/database_service.dart';
import 'package:rick_demo_project/data/services/network/dio_client.dart';
import 'package:rick_demo_project/data/services/network/network_service.dart';
import 'package:rick_demo_project/domain/repositories/characters_repository.dart';
import 'package:rick_demo_project/domain/usecases/add_character_to_favorite.dart' show AddCharacterToFavorite;
import 'package:rick_demo_project/domain/usecases/get_characters.dart';
import 'package:rick_demo_project/domain/usecases/get_favorite_characters.dart';
import 'package:rick_demo_project/domain/usecases/remove_character_from_favorite.dart';
import 'package:rick_demo_project/presentation/view_models/character_view_model.dart';
import 'package:rick_demo_project/presentation/view_models/favorite_character_view_model.dart';

final getIt = GetIt.instance;

Future<void> setup() async{
  // Register DioClient as a singleton
  getIt.registerSingleton<DioClient>(DioClient());
  // Register DatabaseClient as a singleton
  getIt.registerSingletonAsync<DatabaseClient>(
        () async {
      final client = DatabaseClient();
      // Ensure the database is initialized
      return client;
    },
  );

  //Register services
  getIt.registerFactory<NetworkService>(
        () => NetworkServiceImpl(getIt<DioClient>()),
  );
  getIt.registerFactory<DatabaseService>(
        () => DatabaseServiceImpl(getIt<DatabaseClient>()),
  );

  //Register repositories
  getIt.registerFactory<CharactersRepository>(
        () => CharactersRepositoryImpl(
      networkService: getIt<NetworkService>(),
      databaseService: getIt<DatabaseService>(),
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

  //Register ViewModels
  getIt.registerFactory<CharacterViewModel>(
        () => CharacterViewModel(
            getCharacters: getIt<GetCharacters>(),
            addCharacterToFavorite: getIt<AddCharacterToFavorite>(),
            removeCharacterFromFavorite: getIt<RemoveCharacterFromFavorite>()),
  );
  getIt.registerFactory<FavoriteCharacterViewModel>(
        () => FavoriteCharacterViewModel(
      getFavoriteCharacters: getIt<GetFavoriteCharacters>(),
      addCharacterToFavorite: getIt<AddCharacterToFavorite>(),
      removeCharacterFromFavorite: getIt<RemoveCharacterFromFavorite>(),
    ),
  );

  await getIt.allReady();
}