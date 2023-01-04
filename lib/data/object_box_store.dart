import 'package:flutter_application_1/data/object_box_models.dart';
import 'package:flutter_application_1/objectbox.g.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;

class ObjectBoxStore {
  late final Store store;

  late final Box<SupplierModel> supplierModelBox;
  late final Box<ItemsSupplied> itemsSuppliedBox;

  late final Stream<Query<SupplierModel>> supllierModelStream;

  ObjectBoxStore._create(this.store) {
    supplierModelBox = Box<SupplierModel>(store);
    itemsSuppliedBox = Box<ItemsSupplied>(store);

    final queryBuilder = supplierModelBox.query()
      ..order(SupplierModel_.time, flags: Order.descending);

    supllierModelStream = queryBuilder.watch(triggerImmediately: true);
  }

  static Future<ObjectBoxStore> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(
        directory: p.join(docsDir.path, "flutter_application_1"));
    return ObjectBoxStore._create(store);
  }
}
