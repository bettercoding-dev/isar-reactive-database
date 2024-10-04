import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'cake.freezed.dart';
part 'cake.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Cake with _$Cake {
  const Cake._();

  const factory Cake({
    required int id,
    required String name,
    required int yummyness,
  }) = _Cake;


  @override
  Id get id => id;

  factory Cake.fromJson(Map<String, dynamic> json) => _$CakeFromJson(json);
}
