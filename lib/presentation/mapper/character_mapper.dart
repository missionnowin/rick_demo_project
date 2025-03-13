import 'package:rick_demo_project/domain/entities/character_domain_model.dart';
import 'package:rick_demo_project/presentation/models/character_card_presentation_model.dart';

extension DomainToViewMapper on CharacterModel{
  CharacterCardPresentationModel toPresentationModel(){
    return CharacterCardPresentationModel(
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