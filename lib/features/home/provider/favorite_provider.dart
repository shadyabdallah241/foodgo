import 'package:foodgo/core/models/burger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_provider.g.dart';
@riverpod
class Favorite  extends _$Favorite  {
  @override
  Set<int> build() {
    return {};
  }

  void toggleBurger(int burgerId) {

    if (state.contains(burgerId)) {
      state = {...state}..remove(burgerId);
    } else {
      state = {...state, burgerId};
    }
  }

  List<Burger> favoriteBurgers(List<Burger> burgers) {
    final favoriteIds = state;
    final favoriteList = burgers.where(
          (burger) => favoriteIds.contains(int.parse(burger.id)),
    ).toList();
    return favoriteList;
  }


}







