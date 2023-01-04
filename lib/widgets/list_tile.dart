// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/input_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Mytile extends ConsumerWidget {
  final String supplierName;
  final String invoiceNumber;
  final String day;
  final String time;
  final int id;

  const Mytile(
      this.day, this.supplierName, this.invoiceNumber, this.time, this.id,
      {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: EdgeInsets.fromLTRB(6, 8, 2, 6),
      shadowColor: Color(0xFF363f93),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(18))),
      child: ListTile(
        minLeadingWidth: 100,
        leading: Padding(
          padding: EdgeInsets.only(top: 13.4),
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  time,
                  style: const TextStyle(),
                  textScaleFactor: 1.05,
                ),
              ),
              Text(
                day,
                textScaleFactor: 1.05,
                style: const TextStyle(),
              ),
            ],
          ),
        ),
        title: Text(
          supplierName,
        ),
        subtitle: Text(invoiceNumber),
        trailing: IconButton(
          onPressed: (() {
            ref.read(currentSupplierProvider.notifier).setItemsNumber(id);
            Navigator.pushNamed(context, '/thirdroute');
          }),
          padding: EdgeInsets.only(top: 5.0),
          alignment: Alignment.topLeft,
          icon: Icon(
            Icons.content_paste_go_rounded,
          ),
        ),
      ),
    );
  }
}
