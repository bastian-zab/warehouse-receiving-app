import 'package:objectbox/objectbox.dart';

@Entity()
class SupplierModel {
  int id;
  String supplierName;
  String invoiceNumber;
  DateTime time = DateTime.now();
  int numberOfItems;
  final user = ToOne<User>();
  @Backlink()
  final items = ToMany<ItemsSupplied>();

  SupplierModel(
      {this.id = 0,
      required this.supplierName,
      required this.invoiceNumber,
      required this.numberOfItems});

  @override
  String toString() {
    return "$time,$numberOfItems,$invoiceNumber,$supplierName";
  }
}

@Entity()
class ItemsSupplied {
  int id;
  String itemName;
  String unit;
  int quantityInvoiced;
  int quantiyReceived;
  String? comment;

  final supplier = ToOne<SupplierModel>();

  ItemsSupplied({
    this.id = 0,
    required this.itemName,
    required this.unit,
    required this.quantityInvoiced,
    required this.quantiyReceived,
    this.comment,
  });

  @override
  String toString() {
    return "${supplier.toString()},$id,$itemName, $unit, $quantityInvoiced, $quantiyReceived";
  }
}

@Entity()
class User {
  int id;
  String username;
  String email;
  @Backlink()
  final suppliersCreated = ToMany<SupplierModel>();

  User({this.id = 0, required this.username, required this.email});

  @override
  String toString() {
    return "${suppliersCreated.toString()},$id,$username, $email";
  }
}
