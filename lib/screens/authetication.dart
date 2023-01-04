// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/object_box_models.dart';
import 'package:flutter_application_1/screens/input_screen.dart';
import 'package:flutter_application_1/widgets/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthForm extends ConsumerWidget {
  const AuthForm({
    Key? key,
    required this.formKey,
    required this.userNameController,
    required this.emailController,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController userNameController;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double height = MediaQuery.of(context).size.height;
    // User username = ref.watch(userProvider);

    return Scaffold(
      appBar: myInvisibleAppBar,
      body: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                      controller: userNameController,
                      decoration: InputDecoration(labelText: 'Enter Your Name'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your Name';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: height * 0.05),
                    TextFormField(
                      controller: emailController,
                      decoration:
                          InputDecoration(labelText: 'Enter Your Email'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your Email';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: height * 0.05),
                    SizedBox(height: height * 0.06),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Create Entry',
                          style:
                              TextStyle(fontSize: 25, color: Color(0xFF363f93)),
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
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(mySnackBar);
                              User createdUser = User(
                                  username: userNameController.text,
                                  email: emailController.text);
                              ref
                                  .read(userProvider.notifier)
                                  .setUser(createdUser);
                              Navigator.pop(context);
                            }
                          },
                        )
                      ],
                    ),
                  ]),
            )),
      ),
    );
  }
}
