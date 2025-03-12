import 'package:rick_demo_project/domain/entities/character_domain_model.dart';
import 'package:rick_demo_project/presentation/models/character_presentation_model.dart';

extension DomainToViewMapper on CharacterModel{
  CharacterPresentationModel toPresentationModel(){
    return CharacterPresentationModel(
        id: id,
        name: name,
        favorite: favorite,
        image: image,
        status: status,
        species: species,
        location: location
    );
  }
}