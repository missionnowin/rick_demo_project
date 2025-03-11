part of 'characters_bloc.dart';

@immutable
sealed class CharactersState {}

final class CharactersInitial extends CharactersState {}

final class CharactersLoading extends CharactersState {}

class CharactersLoaded extends CharactersState {
  final List<CharacterPresentationModel> favoriteCharacters;

  CharactersLoaded(this.favoriteCharacters);
}

class CharactersError extends CharactersState {
  final String message;

  CharactersError({required this.message});
}