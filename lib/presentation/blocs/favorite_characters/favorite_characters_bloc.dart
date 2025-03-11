import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'favorite_characters_event.dart';
part 'favorite_characters_state.dart';

class FavoriteCharactersBloc extends Bloc<FavoriteCharactersEvent, FavoriteCharactersState> {
  FavoriteCharactersBloc() : super(FavoriteCharactersInitial()) {
    on<FavoriteCharactersEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
