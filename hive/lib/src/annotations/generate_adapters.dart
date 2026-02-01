import 'package:meta/meta.dart';

/// Annotation to generate TypeAdapters for the given [specs]
@immutable
class GenerateAdapters {
  /// Constructor
  // coverage:ignore-start
  const GenerateAdapters(
    this.specs, {
    this.firstTypeId = 0,
    this.reservedTypeIds = const {},
    this.codecs = const {},
  });
  // coverage:ignore-end

  /// The classes to generate TypeAdapters for
  final List<AdapterSpec> specs;

  /// The first typeId to use
  final int firstTypeId;

  /// Reserved type ids
  ///
  /// These type ids will be skipped during generation
  final Set<int> reservedTypeIds;

  /// Custom codecs for specific types.
  ///
  /// This allows you to define how third-party types (like immutable collections)
  /// should be serialized and deserialized.
  ///
  /// The keys are the types to handle, and the values are codec instances.
  /// A codec class must implement `encode` and `decode` methods.
  ///
  /// Example:
  /// ```dart
  /// class IListCodec {
  ///   const IListCodec();
  ///
  ///   IList<T> decode<T>(BinaryReader reader, Object data) => (data as List<dynamic>).cast<T>().lockUnsafe;
  ///
  ///   Object? encode<T>(BinaryWriter writer, IList<T> obj) => obj.unlockView;
  /// }
  /// ```
  final Map<Type, Object> codecs;
}

/// Configuration that specifies the generation of a TypeAdapter
@immutable
class AdapterSpec<T> {
  /// Constructor
  // coverage:ignore-start
  const AdapterSpec({this.ignoredFields = const {}});
  // coverage:ignore-end

  /// Fields that should be ignored
  ///
  /// This should only be used to simplify migrations from `HiveType`
  /// annotations. Model classes should only contain fields to be persisted.
  final Set<String> ignoredFields;
}
