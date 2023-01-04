// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/constants.dart';
import 'package:flutter_application_1/widgets/details_page_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/object_box_models.dart';
import 'input_screen.dart';

class DetailsPage extends ConsumerWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double height = MediaQuery.of(context).size.height;
    SupplierModel currentSupplier = ref.watch(currentSupplierProvider);
    
    return Scaffold(
      appBar: myInvisibleAppBar,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            // ignore: prefer_const_literals_to_create_immutables
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: 15),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currentSupplier.supplierName,
                        style:
                            TextStyle(fontSize: 30, color: Color(0xFF363f93)),
                      ),
                      SizedBox(height: height * 0.01),
                      Text(
                        currentSupplier.invoiceNumber,
                        style:
                            TextStyle(fontSize: 24, color: Color(0xFF363f93)),
                      ),
                      SizedBox(height: height * 0.03),
                      IconButton(
                          padding: EdgeInsets.only(left: 0),
                          onPressed: (() {
                            ref
                                .read(supplierListProvider.notifier)
                                .delete(currentSupplier.id);
                            Navigator.pop(context);
                          }),
                          icon: Icon(Icons.delete_sweep_rounded))
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(child: DetailsPageBuilder()),
        ],
      ),
    );
  }
}
