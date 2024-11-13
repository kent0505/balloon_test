part of 'coins_bloc.dart';

@immutable
sealed class CoinsEvent {}

class GetCoinsEvent extends CoinsEvent {}
