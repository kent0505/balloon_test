part of 'coins_bloc.dart';

@immutable
sealed class CoinsState {}

final class CoinsInitial extends CoinsState {}

final class CoinsLoadedState extends CoinsState {
  CoinsLoadedState({
    required this.coins,
    required this.canSpin,
  });

  final int coins;
  final bool canSpin;
}
