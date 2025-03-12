import 'dart:async';
import 'event.dart';

final class CharacterEventBus{
  final _favoritesStreamController = StreamController<Event>.broadcast();

  Stream<T> on<T>() => _favoritesStreamController.stream.where((event) => event is T).cast<T>();

  void notifyFavoritesChanged(Event event) {
    _favoritesStreamController.add(event);
  }

  void dispose() {
    _favoritesStreamController.close();
  }
}