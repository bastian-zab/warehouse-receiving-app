// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/input_screen.dart';
import 'package:flutter_application_1/widgets/details_tile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/object_box_models.dart';

class DetailsPageBuilder extends ConsumerWidget {
  const DetailsPageBuilder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SupplierModel currentSupplier = ref.watch(currentSupplierProvider);
    int itemCount = currentSupplier.items.length;
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: ((BuildContext context, int index) {
        return MydetailsTile(
            currentSupplier.items[index].itemName,
            currentSupplier.items[index].unit,
            currentSupplier.items[index].quantityInvoiced,
            currentSupplier.items[index].quantiyReceived,
            currentSupplier.items[index].comment ?? 'None',
            currentSupplier.items[index].id);
      }),
    );
  }
}
