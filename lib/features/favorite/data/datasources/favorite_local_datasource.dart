import 'package:hive/hive.dart';

abstract class FavoritesLocalDataSource {
  Future<void> cacheFavorites(String item, String boxName);
  Future<bool> isCached(String item, String boxName);
}

class FavoritesLocalDataSourceImpl implements FavoritesLocalDataSource {
  final HiveInterface hive;

  FavoritesLocalDataSourceImpl({required this.hive});

  Future<Box<dynamic>> openHiveBox(String boxName) async {
    final hiveBox = await Hive.openBox(boxName);
    return hiveBox;
  }

  deleteCachedProduct(String item, String boxName) async {
    final openBox = await openHiveBox(boxName);
    openBox.delete(item);
  }

  @override
  cacheFavorites(String item, String boxName) async {
    final openBox = await openHiveBox(boxName);
    bool cache = openBox.containsKey(item);
    if (cache) {
      await deleteCachedProduct(item, boxName);
    } else {
      await addItemToCache(item, boxName);
    }
  }

  Future<void> addItemToCache(String item, String boxName) async {
    final openBox = await openHiveBox(boxName);
    openBox.put(item, true);
  }

  @override
  isCached(String item, String boxName) async {
    final openBox = await openHiveBox(boxName);
    return openBox.containsKey(item);
  }
}
