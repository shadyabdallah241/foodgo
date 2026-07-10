import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteNotifier extends Notifier<List<String>> {
  @override
  List<String> build() {
    return [];
  }

  void toggleBurger(String id) {
    final isFavorite = state.contains(id);
    if (!isFavorite) {
      state = [...state, id];
    } else {
      state=state.where((e) => e != id).toList();
    }
  }
}

final favoriteProvider = NotifierProvider<FavoriteNotifier, List<String>>(() {
  return FavoriteNotifier();
});
