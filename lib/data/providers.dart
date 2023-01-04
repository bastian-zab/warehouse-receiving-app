import 'package:flutter_application_1/data/object_box_models.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../objectbox.g.dart';

Box<ItemsSupplied> box2 = objectBoxStore.itemsSuppliedBox;
class CurrentSupplierProvider extends StateNotifier<SupplierModel> {
  final Box<SupplierModel> box;
  SupplierModel initial = SupplierModel(
      supplierName: 'supplierName',
      invoiceNumber: 'invoiceNumber',
      numberOfItems: 1);
  CurrentSupplierProvider()
      : box = objectBoxStore.supplierModelBox,
        super(SupplierModel(
            supplierName: 'supplierName',
            invoiceNumber: 'invoiceNumber',
            numberOfItems: 1));

  void setItemsNumber(itemsNumber) {
    SupplierModel? currentItem = box.get(itemsNumber);
    state = currentItem ?? initial;
  }
}

class RowProvider extends StateNotifier<int> {
  RowProvider(int initial) : super(initial);

  void firstrow() {
    state = 1;
  }

  void secondrow() {
    state = 2;
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class UserProvider extends StateNotifier<User> {
  UserProvider(User firstUser) : super(firstUser);
  void setUser(User user) {
    state = user;
  }
}

class SupllierListProvider extends StateNotifier<List<SupplierModel>> {
  final Box<SupplierModel> box;
  SupllierListProvider(List<SupplierModel> initial)
      : box = objectBoxStore.supplierModelBox,
        super(initial);

  void initState() {
    state = box.getAll();
  }

  int add(SupplierModel item) {
    int id = box.put(item);
    state = box.getAll();
    return id;
  }

  bool delete(int item) {
    box.get(item)?.items.forEach((element) {
      box2.remove(element.id);
    });
    bool isDeleted = box.remove(item);
    state = box.getAll();
    return isDeleted;
  }
}

class ItemListProvider extends StateNotifier<List<ItemsSupplied>> {
  final Box<ItemsSupplied> box;
  ItemListProvider(List<ItemsSupplied> initial)
      : box = objectBoxStore.itemsSuppliedBox,
        super(initial);

  void initState() {
    state = box.getAll();
  }

  int add(ItemsSupplied item) {
    int id = box.put(item);
    state = box.getAll();
    return id;
  }

  bool delete(int item) {
    bool isDeleted = box.remove(item);
    state = box.getAll();
    return isDeleted;
  }
}
