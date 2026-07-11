import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodgo/features/customize/model/extra.dart';

class ExtrasNotifier extends StateNotifier<List<Extras>> {
  ExtrasNotifier() : super([]);
  bool toggleExtra(Extras extra) {

    final extraIsAdded = state.any((e) => e.id == extra.id);

    if (extraIsAdded) {
      state = state.where((e) => e.id != extra.id).toList();
      return false;
    } else {
      state = [...state, extra];
      return true;
    }
  }


}

final extrasProvider = StateNotifierProvider<ExtrasNotifier, List<Extras>>(
  (ref) => ExtrasNotifier(),
);
