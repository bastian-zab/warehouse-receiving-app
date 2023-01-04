// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_sync_flutter_libs/objectbox_sync_flutter_libs.dart';

import 'data/object_box_models.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 1214637038111339090),
      name: 'ItemsSupplied',
      lastPropertyId: const IdUid(7, 7238183386309068682),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 7150850615673416194),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 7145306410727263840),
            name: 'itemName',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 242074728378721339),
            name: 'unit',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 7220025901553407883),
            name: 'quantityInvoiced',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 5315278694993120644),
            name: 'quantiyReceived',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 5328328453887673831),
            name: 'comment',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 7238183386309068682),
            name: 'supplierId',
            type: 11,
            flags: 520,
            indexId: const IdUid(1, 8355174203231401303),
            relationTarget: 'SupplierModel')
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 6469326845105966576),
      name: 'SupplierModel',
      lastPropertyId: const IdUid(7, 8884566698556816359),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 6143653269920370599),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 2233089826204595323),
            name: 'supplierName',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 295696631565148272),
            name: 'invoiceNumber',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 3558616524775972592),
            name: 'time',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 269377303124948415),
            name: 'numberOfItems',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 8884566698556816359),
            name: 'userId',
            type: 11,
            flags: 520,
            indexId: const IdUid(2, 7289169758365130611),
            relationTarget: 'User')
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[
        ModelBacklink(name: 'items', srcEntity: 'ItemsSupplied', srcField: '')
      ]),
  ModelEntity(
      id: const IdUid(3, 1939456326678490921),
      name: 'User',
      lastPropertyId: const IdUid(3, 5387347194651226501),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 6079878126506430733),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 3310595329688064981),
            name: 'username',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 5387347194651226501),
            name: 'email',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[
        ModelBacklink(
            name: 'suppliersCreated', srcEntity: 'SupplierModel', srcField: '')
      ])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(3, 1939456326678490921),
      lastIndexId: const IdUid(2, 7289169758365130611),
      lastRelationId: const IdUid(2, 6119954765374434372),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [6447559215067229043],
      retiredRelationUids: const [2142948565191975652, 6119954765374434372],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    ItemsSupplied: EntityDefinition<ItemsSupplied>(
        model: _entities[0],
        toOneRelations: (ItemsSupplied object) => [object.supplier],
        toManyRelations: (ItemsSupplied object) => {},
        getId: (ItemsSupplied object) => object.id,
        setId: (ItemsSupplied object, int id) {
          object.id = id;
        },
        objectToFB: (ItemsSupplied object, fb.Builder fbb) {
          final itemNameOffset = fbb.writeString(object.itemName);
          final unitOffset = fbb.writeString(object.unit);
          final commentOffset =
              object.comment == null ? null : fbb.writeString(object.comment!);
          fbb.startTable(8);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, itemNameOffset);
          fbb.addOffset(2, unitOffset);
          fbb.addInt64(3, object.quantityInvoiced);
          fbb.addInt64(4, object.quantiyReceived);
          fbb.addOffset(5, commentOffset);
          fbb.addInt64(6, object.supplier.targetId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = ItemsSupplied(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              itemName: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              unit: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, ''),
              quantityInvoiced:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0),
              quantiyReceived:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0),
              comment: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 14));
          object.supplier.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 16, 0);
          object.supplier.attach(store);
          return object;
        }),
    SupplierModel: EntityDefinition<SupplierModel>(
        model: _entities[1],
        toOneRelations: (SupplierModel object) => [object.user],
        toManyRelations: (SupplierModel object) => {
              RelInfo<ItemsSupplied>.toOneBacklink(7, object.id,
                  (ItemsSupplied srcObject) => srcObject.supplier): object.items
            },
        getId: (SupplierModel object) => object.id,
        setId: (SupplierModel object, int id) {
          object.id = id;
        },
        objectToFB: (SupplierModel object, fb.Builder fbb) {
          final supplierNameOffset = fbb.writeString(object.supplierName);
          final invoiceNumberOffset = fbb.writeString(object.invoiceNumber);
          fbb.startTable(8);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, supplierNameOffset);
          fbb.addOffset(2, invoiceNumberOffset);
          fbb.addInt64(4, object.time.millisecondsSinceEpoch);
          fbb.addInt64(5, object.numberOfItems);
          fbb.addInt64(6, object.user.targetId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = SupplierModel(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              supplierName: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              invoiceNumber: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, ''),
              numberOfItems:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 14, 0))
            ..time = DateTime.fromMillisecondsSinceEpoch(
                const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0));
          object.user.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 16, 0);
          object.user.attach(store);
          InternalToManyAccess.setRelInfo(
              object.items,
              store,
              RelInfo<ItemsSupplied>.toOneBacklink(7, object.id,
                  (ItemsSupplied srcObject) => srcObject.supplier),
              store.box<SupplierModel>());
          return object;
        }),
    User: EntityDefinition<User>(
        model: _entities[2],
        toOneRelations: (User object) => [],
        toManyRelations: (User object) => {
              RelInfo<SupplierModel>.toOneBacklink(7, object.id,
                      (SupplierModel srcObject) => srcObject.user):
                  object.suppliersCreated
            },
        getId: (User object) => object.id,
        setId: (User object, int id) {
          object.id = id;
        },
        objectToFB: (User object, fb.Builder fbb) {
          final usernameOffset = fbb.writeString(object.username);
          final emailOffset = fbb.writeString(object.email);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, usernameOffset);
          fbb.addOffset(2, emailOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = User(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              username: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              email: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, ''));
          InternalToManyAccess.setRelInfo(
              object.suppliersCreated,
              store,
              RelInfo<SupplierModel>.toOneBacklink(
                  7, object.id, (SupplierModel srcObject) => srcObject.user),
              store.box<User>());
          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [ItemsSupplied] entity fields to define ObjectBox queries.
class ItemsSupplied_ {
  /// see [ItemsSupplied.id]
  static final id =
      QueryIntegerProperty<ItemsSupplied>(_entities[0].properties[0]);

  /// see [ItemsSupplied.itemName]
  static final itemName =
      QueryStringProperty<ItemsSupplied>(_entities[0].properties[1]);

  /// see [ItemsSupplied.unit]
  static final unit =
      QueryStringProperty<ItemsSupplied>(_entities[0].properties[2]);

  /// see [ItemsSupplied.quantityInvoiced]
  static final quantityInvoiced =
      QueryIntegerProperty<ItemsSupplied>(_entities[0].properties[3]);

  /// see [ItemsSupplied.quantiyReceived]
  static final quantiyReceived =
      QueryIntegerProperty<ItemsSupplied>(_entities[0].properties[4]);

  /// see [ItemsSupplied.comment]
  static final comment =
      QueryStringProperty<ItemsSupplied>(_entities[0].properties[5]);

  /// see [ItemsSupplied.supplier]
  static final supplier = QueryRelationToOne<ItemsSupplied, SupplierModel>(
      _entities[0].properties[6]);
}

/// [SupplierModel] entity fields to define ObjectBox queries.
class SupplierModel_ {
  /// see [SupplierModel.id]
  static final id =
      QueryIntegerProperty<SupplierModel>(_entities[1].properties[0]);

  /// see [SupplierModel.supplierName]
  static final supplierName =
      QueryStringProperty<SupplierModel>(_entities[1].properties[1]);

  /// see [SupplierModel.invoiceNumber]
  static final invoiceNumber =
      QueryStringProperty<SupplierModel>(_entities[1].properties[2]);

  /// see [SupplierModel.time]
  static final time =
      QueryIntegerProperty<SupplierModel>(_entities[1].properties[3]);

  /// see [SupplierModel.numberOfItems]
  static final numberOfItems =
      QueryIntegerProperty<SupplierModel>(_entities[1].properties[4]);

  /// see [SupplierModel.user]
  static final user =
      QueryRelationToOne<SupplierModel, User>(_entities[1].properties[5]);
}

/// [User] entity fields to define ObjectBox queries.
class User_ {
  /// see [User.id]
  static final id = QueryIntegerProperty<User>(_entities[2].properties[0]);

  /// see [User.username]
  static final username = QueryStringProperty<User>(_entities[2].properties[1]);

  /// see [User.email]
  static final email = QueryStringProperty<User>(_entities[2].properties[2]);
}