import 'package:built_collection/built_collection.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:meta/meta.dart';

@GenerateAdapters(
  [
    AdapterSpec<ClassSpec1>(),
    AdapterSpec<ClassSpec2>(),
    AdapterSpec<ClassSpec3>(),
    AdapterSpec<ClassSpec4>(),
    AdapterSpec<EnumSpec>(),
  ],
  firstTypeId: 50,
  codecs: {
    IList: IListCodec(),
    ISet: ISetCodec(),
    IMap: IMapCodec(),
    BuiltList: BuiltListCodec(),
    BuiltSet: BuiltSetCodec(),
    BuiltMap: BuiltMapCodec(),
  },
)
part 'hive_adapters.g.dart';

@immutable
class ClassSpec1 {
  final int value;
  final int value2;

  const ClassSpec1(this.value, this.value2);
}

@immutable
class ClassSpec2 {
  final String value;
  final String value2;
  final Iterable<String> iterable;
  final Set<String> set;
  final List<String> list;

  final IList<String> iList;
  final ISet<String> iSet;
  final IMap<String, String> iMap;

  final BuiltList<String> builtList;
  final BuiltSet<String> builtSet;
  final BuiltMap<String, String> builtMap;

  const ClassSpec2(
    this.value,
    this.value2,
    this.iterable,
    this.set,
    this.list,
    this.iList,
    this.iSet,
    this.iMap,
    this.builtList,
    this.builtSet,
    this.builtMap,
  );
}

class ClassSpec3 {
  int? value;
}

class ClassSpec4<T extends Object> {}

enum EnumSpec {
  value1,
  value2;

  EnumSpec get getter => EnumSpec.value2;
}

class IListCodec {
  const IListCodec();

  IList<T> decode<T>(BinaryReader reader, Object data) =>
      (data as List<dynamic>).cast<T>().lockUnsafe;

  Object? encode<T>(BinaryWriter writer, IList<T> obj) => obj.unlockView;
}

class ISetCodec {
  const ISetCodec();

  ISet<T> decode<T>(BinaryReader reader, Object data) =>
      (data as Set<dynamic>).cast<T>().lockUnsafe;

  Object? encode<T>(BinaryWriter writer, ISet<T> obj) => obj.unlockView;
}

class IMapCodec {
  const IMapCodec();

  IMap<K, V> decode<K, V>(BinaryReader reader, Object data) =>
      (data as Map<dynamic, dynamic>).cast<K, V>().lockUnsafe;

  Object? encode<K, V>(BinaryWriter writer, IMap<K, V> obj) => obj.unlockView;
}

class BuiltListCodec {
  const BuiltListCodec();

  BuiltList<T> decode<T>(BinaryReader reader, Object data) =>
      (data as List<dynamic>).cast<T>().build();

  Object? encode<T>(BinaryWriter writer, BuiltList<T> obj) => obj.asList();
}

class BuiltSetCodec {
  const BuiltSetCodec();

  BuiltSet<T> decode<T>(BinaryReader reader, Object data) =>
      (data as Set<dynamic>).cast<T>().build();

  Object? encode<T>(BinaryWriter writer, BuiltSet<T> obj) => obj.asSet();
}

class BuiltMapCodec {
  const BuiltMapCodec();

  BuiltMap<K, V> decode<K, V>(BinaryReader reader, Object data) =>
      (data as Map<dynamic, dynamic>).cast<K, V>().build();

  Object? encode<K, V>(BinaryWriter writer, BuiltMap<K, V> obj) => obj.asMap();
}
