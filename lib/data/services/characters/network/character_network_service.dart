import 'package:rick_demo_project/data/data_sources/dio_client.dart';
import 'package:rick_demo_project/data/models/api/character_api_model.dart';

abstract class NetworkService{
  Future<List<CharacterApiModel>> getCharacters({int page = 1, int limit = 20});
}

class NetworkServiceImpl implements NetworkService{
  final DioClient _client;

  NetworkServiceImpl(this._client);

  @override
  Future<List<CharacterApiModel>> getCharacters({int page = 1, int limit = 20}) async{
    final List<CharacterApiModel> characters = [];
    final response = await _client.dio.get('character', queryParameters: {'page': page, 'limit': limit});
    for(Map<String, dynamic> element in response.data['results']){
      characters.add(CharacterApiModel.fromJson(element));
    }
    return characters;
  }
}