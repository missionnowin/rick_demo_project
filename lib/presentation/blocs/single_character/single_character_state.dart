part of 'single_character_bloc.dart';

@immutable
sealed class SingleCharacterState {}

final class SingleCharacterInitial extends SingleCharacterState {

}

class SingleCharacterLoaded extends SingleCharacterState {
  final CharacterModel character;

  SingleCharacterLoaded(this.character);
}

final class SingleCharacterLoading extends SingleCharacterState{

}

final class SingleCharacterError extends SingleCharacterState {
  final String message;

  SingleCharacterError(this.message);
}

class SingleCharacterTogglingError extends SingleCharacterLoaded {
  final String message;

  SingleCharacterTogglingError(super.character, this.message);
}

