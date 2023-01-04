// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/object_box_models.dart';
import 'package:flutter_application_1/data/providers.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/objectbox.g.dart';
import 'package:flutter_application_1/widgets/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Box<SupplierModel> box = objectBoxStore.supplierModelBox;

Box<ItemsSupplied> box2 = objectBoxStore.itemsSuppliedBox;

User defaultUser = User(username: 'All', email: 'nigelseba123@gmail.com');

final userProvider = StateNotifierProvider<UserProvider, User>((ref) {
  return UserProvider(defaultUser);
});

final rowProvider = StateNotifierProvider<RowProvider, int>((ref) {
  return RowProvider(1);
});

final supplierListProvider =
    StateNotifierProvider<SupllierListProvider, List<SupplierModel>>((ref) {
  return SupllierListProvider(box.getAll());
});

final currentSupplierProvider =
    StateNotifierProvider<CurrentSupplierProvider, SupplierModel>((ref) {
  return CurrentSupplierProvider();
});

final itemListProvider =
    StateNotifierProvider<ItemListProvider, List<ItemsSupplied>>((ref) {
  return ItemListProvider(box2.getAll());
});

class InputScreen extends ConsumerWidget {
  InputScreen({Key? key}) : super(key: key);

  final firstFormKey = GlobalKey<FormState>();

  final secondFormKey = GlobalKey<FormState>();

  final supplierNameController = TextEditingController();

  final invoiceNumberController = TextEditingController();

  final itemsNumberController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget whichRow() {
      int number = ref.watch(rowProvider);
      if (number < 2) {
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: FirstForm(
              formKey: firstFormKey,
              supplierNameController: supplierNameController,
              invoiceNumberController: invoiceNumberController,
              itemsNumberController: itemsNumberController,
            ),
          ),
        );
      } else {
        return SecondForm(
          formKey: secondFormKey,
        );
      }
    }

    return WillPopScope(
      onWillPop: () async {
        ref.read(rowProvider.notifier).firstrow();
        return true;
      },
      child: Scaffold(
        appBar: myInvisibleAppBar,
        backgroundColor: Color(0xFFffffff),
        body: whichRow(),
      ),
    );
  }
}

class FirstForm extends ConsumerWidget {
  const FirstForm({
    Key? key,
    required this.formKey,
    required this.supplierNameController,
    required this.invoiceNumberController,
    required this.itemsNumberController,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController supplierNameController;
  final TextEditingController invoiceNumberController;
  final TextEditingController itemsNumberController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double height = MediaQuery.of(context).size.height;
    User username = ref.watch(userProvider);

    return Form(
        key: formKey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: height * 0.02),
          Text(
            "Let's Start",
            style: TextStyle(fontSize: 40, color: Color(0xFF363f93)),
          ),
          Text(
            "Here",
            style: TextStyle(fontSize: 40, color: Color(0xFF363f93)),
          ),
          SizedBox(height: height * 0.05),
          TextFormField(
            controller: supplierNameController,
            decoration: InputDecoration(labelText: 'Enter Supplier'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please Enter Supplier Name';
              } else {
                return null;
              }
            },
          ),
          SizedBox(height: height * 0.05),
          TextFormField(
            controller: invoiceNumberController,
            decoration: InputDecoration(labelText: 'Enter Invoice Number'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please Enter Invoice Number';
              } else {
                return null;
              }
            },
          ),
          SizedBox(height: height * 0.05),
          TextFormField(
            controller: itemsNumberController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Enter Number Of Items'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please Enter Number of Items';
              } else {
                return null;
              }
            },
          ),
          SizedBox(height: height * 0.06),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Create Entry',
                style: TextStyle(fontSize: 25, color: Color(0xFF363f93)),
              ),
              IconButton(
                icon: Icon(
                  Icons.navigate_next_outlined,
                  size: 40,
                  color: Color(0xFF363f93),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final mySnackBar = SnackBar(
                      content: Text('Submited'),
                      duration: Duration(seconds: 2),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
                    SupplierModel supplier = SupplierModel(
                        supplierName: supplierNameController.text,
                        invoiceNumber: invoiceNumberController.text,
                        numberOfItems: int.parse(itemsNumberController.text));
                    supplier.user.target = username;
                    ref.read(rowProvider.notifier).secondrow();
                    int id =
                        ref.read(supplierListProvider.notifier).add(supplier);
                    ref
                        .read(currentSupplierProvider.notifier)
                        .setItemsNumber(id);
                  }
                },
              )
            ],
          ),
        ]));
  }
}

class SecondForm extends ConsumerWidget {
  const SecondForm({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double height = MediaQuery.of(context).size.height;
    SupplierModel currentSupplier = ref.watch(currentSupplierProvider);
    int itemCount = currentSupplier.numberOfItems;
    final controller = PageController(initialPage: 0);

    return WillPopScope(
      onWillPop: () async {
        bool ifdeleted =
            ref.read(supplierListProvider.notifier).delete(currentSupplier.id);
        return true;
      },
      child: Container(
        height: height * 3,
        width: height * 2,
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: PageView.builder(
            controller: controller,
            itemCount: itemCount,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final itemNameController = TextEditingController();

              final invoicedQuantityController = TextEditingController();

              final receivedQuantityController = TextEditingController();

              final unitController = TextEditingController();

              final commentsController = TextEditingController(text: 'None');
              int index2 = index + 1;
              bool pageEnds() {
                return index2 == itemCount;
              }

              return Form(
                  //key: formKey,

                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: height * 0.04),
                          Text(
                            "Now Enter Item ",
                            style: TextStyle(
                                fontSize: 40, color: Color(0xFF363f93)),
                          ),
                          Text(
                            "${index + 1} Details",
                            style: TextStyle(
                                fontSize: 40, color: Color(0xFF363f93)),
                          ),
                          SizedBox(height: height * 0.02),
                          Column(children: [
                            TextFormField(
                              controller: itemNameController,
                              decoration: InputDecoration(
                                labelText: 'Item Supplied',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Item Name is Required';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(height: height * 0.02),
                            TextFormField(
                              controller: invoicedQuantityController,
                              decoration: InputDecoration(
                                labelText: 'Qty Invoiced',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Quantity In Invoiced is required and Must Be A number';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(height: height * 0.02),
                            TextFormField(
                              controller: unitController,
                              decoration: InputDecoration(
                                labelText: 'Units',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Units is required';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(height: height * 0.02),
                            TextFormField(
                              controller: receivedQuantityController,
                              decoration:
                                  InputDecoration(labelText: 'Qty received'),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Quantity Received is Required and must Be A Number';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(height: height * 0.02),
                            TextFormField(
                              controller: commentsController,
                              decoration: InputDecoration(
                                  labelText: 'Reason For Returns/Comments'),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return null;
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ]),
                          SizedBox(height: height * 0.05),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Complete',
                                style: TextStyle(
                                    fontSize: 25, color: myColorFromARGB),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.navigate_next_outlined,
                                  size: 40,
                                  color: myColorFromARGB,
                                ),
                                onPressed: () {
                                  ItemsSupplied itemSupplied = ItemsSupplied(
                                      itemName: itemNameController.text,
                                      unit: unitController.text,
                                      quantityInvoiced: int.parse(
                                          (invoicedQuantityController.text)),
                                      quantiyReceived: int.parse(
                                          receivedQuantityController.text),
                                      comment: commentsController.text);

                                  itemSupplied.supplier.target =
                                      currentSupplier;

                      
                                  int itemId = ref
                                      .read(itemListProvider.notifier)
                                      .add(itemSupplied);
                                 // print(itemId);
                                  //var ui = (box2.get(itemId));
                                  // SupplierModel? model = ui?.supplier.target;
                                  //  print(model);

                                  // var currrrent =  box.get((box2.get(itemId))?.supplier.targetId);

                                  if (pageEnds()) {
                                    final mySnackBar = SnackBar(
                                      content: Text('Submited'),
                                      duration: Duration(seconds: 2),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(mySnackBar);
                                    Navigator.pop(context);
                                  } else {
                                    controller.nextPage(
                                        duration: Duration(milliseconds: 600),
                                        curve: Curves.easeIn);
                                  }
                                },
                              )
                            ],
                          ),
                        ]),
                  ));
            }),
      ),
    );
  }
}
