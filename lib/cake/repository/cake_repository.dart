import 'package:isar_reactive_database/cake/global_providers.dart';
import 'package:isar_reactive_database/cake/model/cake.dart';
import 'package:isar_reactive_database/cake/repository/isar_cake_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cake_repository.g.dart';

@riverpod
CakeRepository cakeRepository(CakeRepositoryRef ref) => IsarCakeRepository(
      ref.watch(isarProvider),
    );

abstract interface class CakeRepository {
  Future<int> insertCake(Cake cake);

  Future updateCake(Cake cake);

  Future deleteCake(int cakeId);

  Stream<List<Cake>> getAllCakesStream();
}
