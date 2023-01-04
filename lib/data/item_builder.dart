import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/list_tile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/screens/input_screen.dart';
import 'package:intl/intl.dart';
import 'object_box_models.dart';

var dateFormat = DateFormat.yMd();
var timeFormat = DateFormat.Hm();

class MyListView extends ConsumerWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<SupplierModel> supplier = ref.watch(supplierListProvider);

    return ListView.builder(
      reverse: false,
      itemCount: supplier.length,
      itemBuilder: ((BuildContext context, int index) {
        return Mytile(
            dateFormat.format(supplier[index].time),
            supplier[index].supplierName,
            supplier[index].invoiceNumber,
            timeFormat.format(supplier[index].time),
            supplier[index].id);
      }),
    );
  }
}
