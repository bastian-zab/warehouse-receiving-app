// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/item_builder.dart';
import 'package:flutter_application_1/data/object_box_store.dart';
import 'package:flutter_application_1/screens/authetication.dart';
import 'package:flutter_application_1/screens/details_screen.dart';
import 'package:flutter_application_1/screens/input_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:is_first_run/is_first_run.dart';

late ObjectBoxStore objectBoxStore;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectBoxStore = await ObjectBoxStore.create();
  //bool firstCall = await IsFirstRun.isFirstCall();

  runApp(const ProviderScope(child: MyApp()));
}

String greeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Morning';
  }
  if (hour < 17) {
    return 'Afternoon';
  }
  return 'Evening';
}

Future<bool> firstcall() async {
  bool myValue = await IsFirstRun.isFirstCall();
  return myValue;
}

var usersList = ['All', 'Bastian', 'Morgan'];
final authFormKey = GlobalKey<FormState>();
final userNameController = TextEditingController();
final emailController = TextEditingController();

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Hello, Bastian!'),
        '/secondroute': (context) => InputScreen(),
        '/thirdroute': (context) => DetailsPage(),
        '/fourthroute': (context) => AuthForm(
            formKey: authFormKey,
            userNameController: userNameController,
            emailController: emailController),
      },
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String username = ref.watch(userProvider).username;
    final double height = MediaQuery.of(context).size.height;
    return FutureBuilder(
        future: firstcall(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            bool state = snapshot.data as bool;
            return state
                ? AuthForm(
                    formKey: authFormKey,
                    userNameController: userNameController,
                    emailController: emailController)
                : Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.white12,
                      foregroundColor: Color(0xFF363f93),
                      elevation: 0,
                    ),
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 21),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Good ${greeting()}",
                                    style: TextStyle(
                                        fontSize: 30, color: Color(0xFF363f93)),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, '/fourthroute');
                                    },
                                    style: ButtonStyle(
                                        alignment: Alignment.topLeft,
                                        side: MaterialStateProperty.all(
                                            BorderSide.none),
                                        padding: MaterialStateProperty.all(
                                            EdgeInsetsDirectional.only(
                                                start: 0))),
                                    child: Text(
                                      // ignore: unnecessary_string_interpolations
                                      username,
                                      style: TextStyle(
                                          fontSize: 27,
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xFF363f93)),
                                    ),
                                  ),
                                  SizedBox(height: height * 0.025),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const MyListTile(),
                        Expanded(child: MyListView()),
                      ],
                    ),

                    floatingActionButton: FloatingActionButton(
                      backgroundColor: Color(0xFF363f93),
                      onPressed: () {
                        Navigator.pushNamed(context, '/secondroute');
                      },
                      tooltip: 'Add Entry',
                      child: const Icon(
                        Icons.add,
                      ),
                    ), // This trailing comma makes auto-formatting nicer for build methods.
                  );
          }

          // Displaying LoadingSpinner to indicate waiting state
          return Center(
            child: CircularProgressIndicator(),
          );
        }));

    /* Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white12,
        foregroundColor: Color(0xFF363f93),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: 21),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Good ${greeting()}",
                      style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/fourthroute');
                      },
                      style: ButtonStyle(
                          alignment: Alignment.topLeft,
                          side: MaterialStateProperty.all(BorderSide.none),
                          padding: MaterialStateProperty.all(
                              EdgeInsetsDirectional.only(start: 0))),
                      child: Text(
                        // ignore: unnecessary_string_interpolations
                        username,
                        style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF363f93)),
                      ),
                    ),
                    SizedBox(height: height * 0.025),
                  ],
                ),
              ),
            ],
          ),
          const MyListTile(),
          Expanded(child: MyListView()),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF363f93),
        onPressed: () {
          Navigator.pushNamed(context, '/secondroute');
        },
        tooltip: 'Add Entry',
        child: const Icon(
          Icons.add,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );*/
  }
}

class MyListTile extends StatelessWidget {
  const MyListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 107,
      textColor: Color(0xFF363f93),
      leading: Padding(
        padding: EdgeInsets.only(top: 13.0, left: 3.0),
        child: Column(
          children: [
            Text(
              "Date",
              textScaleFactor: 1.01,
            ),
            Text(
              "Created",
              textScaleFactor: 1.01,
            ),
          ],
        ),
      ),
      title: Text("Supplier"),
      subtitle: Text("Invoice No."),
      trailing: IconButton(
        onPressed: null,
        padding: EdgeInsets.only(top: 5.0),
        alignment: Alignment.topLeft,
        icon: Icon(
          Icons.format_indent_increase_outlined,
          color: Color(0xFF363f93),
        ),
      ),
    );
  }
}
