import 'package:rick_demo_project/data/models/api/character_api_model.dart';
import 'package:rick_demo_project/domain/entities/character_domain_model.dart';

extension CharacterApiModelToDomain on CharacterApiModel{
  /// Map CharacterApiModel to CharacterModel, setting default value for favorite: false
  CharacterModel toCharacterModel(){
    return CharacterModel(
      id: id,
      favorite: false,
      status: status,
      species: species,
      type : type,
      gender: gender,
      origin: origin?.name,
      location: location?.name,
      image: image,
      episodes: episodes,
      created: created,
    );
  }
}