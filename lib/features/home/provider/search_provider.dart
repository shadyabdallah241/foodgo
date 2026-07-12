import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodgo/core/models/burger.dart';
import 'package:foodgo/features/home/data/burgers.dart';

class SearchNotifier extends StateNotifier<List<Burger>> {

  SearchNotifier() : super(burgers);
  void search(String query) {
    if (query.isEmpty) {
      state = burgers;
    } else {
      state =burgers.where((burger) =>burger.name.toLowerCase().contains(query.toLowerCase()) ).toList();
    }
  }
}

final searchProvider = StateNotifierProvider<SearchNotifier,List<Burger>>((
  ref,
) {
  return SearchNotifier();
});
