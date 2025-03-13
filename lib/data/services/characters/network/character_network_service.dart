import 'package:rick_demo_project/data/data_sources/dio_client.dart';
import 'package:rick_demo_project/data/models/api/character_api_model.dart';

abstract class CharacterNetworkService{
  Future<List<CharacterApiModel>> getCharacters({int page = 1, int limit = 20});
  Future<CharacterApiModel> getCharacter({required int id});
}

class NetworkServiceImpl implements CharacterNetworkService{
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

  @override
  Future<CharacterApiModel> getCharacter({required int id}) async {
    final response = await _client.dio.get('character/$id');
    return CharacterApiModel.fromJson(response.data);
  }
}