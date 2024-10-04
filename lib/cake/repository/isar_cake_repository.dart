import 'package:isar/isar.dart';
import 'package:isar_reactive_database/cake/model/cake.dart';
import 'package:isar_reactive_database/cake/repository/cake_repository.dart';

class IsarCakeRepository implements CakeRepository {
  final Isar isar;

  const IsarCakeRepository(this.isar);

  @override
  Future deleteCake(int cakeId) => isar.writeTxn(() {
        return isar.cakes.delete(cakeId);
      });

  @override
  Stream<List<Cake>> getAllCakesStream() {
    return isar.cakes.where().watch(fireImmediately: true);
  }

  @override
  Future<int> insertCake(Cake cake) => isar.writeTxn(() {
        return isar.cakes.put(cake);
      });

  @override
  Future updateCake(Cake cake) => isar.writeTxn(() {
        return isar.cakes.put(cake);
      });
}
