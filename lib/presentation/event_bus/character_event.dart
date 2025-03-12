import 'package:rick_demo_project/domain/entities/character_domain_model.dart';
import 'event.dart';

class FavoritesChanged extends Event<CharacterModel> {
  const FavoritesChanged(super.data);
}