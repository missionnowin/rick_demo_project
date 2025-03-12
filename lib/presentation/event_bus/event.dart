import 'package:equatable/equatable.dart';

abstract class Event<T> extends Equatable {
  const Event(this.data);

  final T data;

  @override
  List<Object?> get props => [data];
}