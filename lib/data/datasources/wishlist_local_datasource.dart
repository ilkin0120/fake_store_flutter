import 'package:shared_preferences/shared_preferences.dart';

abstract class WishlistLocalDataSource {
  Future<Set<int>> getWishlist();

  Future<void> toggleWishlistItem(int id);
}

class WishlistLocalDataSourceImpl implements WishlistLocalDataSource {
  static const _key = 'wishlist_ids';

  @override
  Future<Set<int>> getWishlist() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_key) ?? [];
    return list.map(int.parse).toSet();
  }

  @override
  Future<void> toggleWishlistItem(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_key) ?? [];
    final set = list.map(int.parse).toSet();
    if (set.contains(id)) {
      set.remove(id);
    } else {
      set.add(id);
    }
    await prefs.setStringList(_key, set.map((e) => e.toString()).toList());
  }
}
