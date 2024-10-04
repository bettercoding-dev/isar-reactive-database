import 'dart:math';

import 'package:isar/isar.dart';
import 'package:isar_reactive_database/cake/model/cake.dart';
import 'package:isar_reactive_database/cake/repository/cake_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cake_controller.g.dart';

@riverpod
class CakeController extends _$CakeController {
  static const flavors = ['apple', 'orange', 'chocolate'];

  @override
  Stream<List<Cake>> build() {
    return ref.watch(cakeRepositoryProvider).getAllCakesStream();
  }

  Future<void> delete(Cake cake) async {
    final cakeRepository = ref.read(cakeRepositoryProvider);
    await cakeRepository.deleteCake(cake.id);
  }

  Future<void> edit(Cake cake) async {
    final cakeRepository = ref.read(cakeRepositoryProvider);
    final updatedCake = cake.copyWith(yummyness: cake.yummyness + 1);
    await cakeRepository.updateCake(updatedCake);
  }

  Future<void> add() async {
    final cakeRepository = ref.read(cakeRepositoryProvider);
    final flavorIndex = Random().nextInt(flavors.length - 1);
    final newCake = Cake(
      id: Isar.autoIncrement,
      name: 'My yummy ${flavors[flavorIndex]} cake',
      yummyness: Random().nextInt(10),
    );
    await cakeRepository.insertCake(newCake);
  }

}
