// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class MydetailsTile extends ConsumerWidget {
  const MydetailsTile(this.item, this.unit, this.quantityInvoiced,
      this.quantityReceived, this.comment, this.id,
      {super.key});
  final String item;
  final String unit;
  final int quantityInvoiced;
  final int quantityReceived;
  final String comment;
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.fromLTRB(6, 8, 2, 6),
      shadowColor: const Color(0xFF363f93),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(18))),
      child: ListTile(
        isThreeLine: true,
        minLeadingWidth: 120,
        leading: Padding(
          padding: const EdgeInsets.only(top: 16.4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 0.5, right: 6),
                child: Text(
                  'Qty Invoiced/Receievd:',
                  style: TextStyle(),
                ),
              ),
              Text(
                'Comments:',
                style: const TextStyle(),
              ),
            ],
          ),
        ),
        title: Text(
          item,
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$quantityInvoiced/$quantityReceived $unit'),
            Text(comment),
          ],
        ),
        trailing: IconButton(
          onPressed: () {
            null;
          },
          padding: const EdgeInsets.only(top: 5.0),
          alignment: Alignment.topLeft,
          icon: const Icon(
            Icons.add_chart_sharp,
            //olor: Colors.purple,
          ),
        ),
      ),
    );
  }
}
