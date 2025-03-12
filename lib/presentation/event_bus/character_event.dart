import 'package:equatable/equatable.dart';
import 'package:rick_demo_project/domain/entities/character_domain_model.dart';

abstract class Event<T> extends Equatable {
  const Event(this.data);

  final T data;

  @override
  List<Object?> get props => [data];
}

class FavoritesChanged extends Event<CharacterModel> {
  const FavoritesChanged(super.data);
}