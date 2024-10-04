import 'package:isar/isar.dart';
import 'package:isar_reactive_database/cake/model/cake.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'global_providers.g.dart';

@riverpod
Isar isar(IsarRef ref) => throw UnimplementedError();

Future<List<Override>> initProviders() async {
  final overrides = <Override>[];

  final directory = await getApplicationDocumentsDirectory();
  final isar = await Isar.open([CakeSchema], directory: directory.path);

  overrides.add(isarProvider.overrideWithValue(isar));

  return overrides;
}
