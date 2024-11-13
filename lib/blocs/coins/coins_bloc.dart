import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils.dart';

part 'coins_event.dart';
part 'coins_state.dart';

class CoinsBloc extends Bloc<CoinsEvent, CoinsState> {
  CoinsBloc() : super(CoinsInitial()) {
    on<CoinsEvent>(
      (event, emit) => switch (event) {
        GetCoinsEvent() => _getCoins(event, emit),
      },
    );
  }

  void _getCoins(
    GetCoinsEvent event,
    Emitter<CoinsState> emit,
  ) async {
    await getData();
    emit(
      CoinsLoadedState(
        coins: coins,
        canSpin: lastSpin + 43200 < getTimestamp(), // 43200 == 12 hours
      ),
    );
  }
}
