import 'package:rick_demo_project/data/models/api/character_api_model.dart';

import 'dio_client.dart';

abstract class NetworkService{
  Future<List<CharacterApiModel>> getCharacters();
}

class NetworkServiceImpl implements NetworkService{
  final DioClient _client;

  NetworkServiceImpl(this._client);

  @override
  Future<List<CharacterApiModel>> getCharacters() async{
    final List<CharacterApiModel> characters = [];
    final response = await _client.dio.get('character');
    for(Map<String, dynamic> element in response.data['results']){
      characters.add(CharacterApiModel.fromJson(element));
    }
    return characters;
  }
}