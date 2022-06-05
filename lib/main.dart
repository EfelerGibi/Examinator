import 'package:examinator/multiformpage.dart';
import 'package:flutter/material.dart';
import 'formpage.dart';
import 'pagewrapper.dart';
// import 'testwid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //useMaterial3: true,
        colorSchemeSeed: Colors.grey,
        textTheme: const TextTheme(
            button: TextStyle(color: Colors.grey),
            headline1: TextStyle(color: Colors.grey)),
        //primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        //useMaterial3: true,
        textTheme: const TextTheme(button: TextStyle(color: Colors.white)),
        //primarySwatch: Colors.blue,
        //colorSchemeSeed: Colors.grey,
        scaffoldBackgroundColor: Colors.transparent,
        brightness: Brightness.dark,
        backgroundColor: const Color(0xFF424242),
      ),
      themeMode: ThemeMode.system,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
              child: CardWrapper(
                  infHeight: false,
                  padding: 24,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Wrap(
                        direction: Axis.vertical,
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          const FlutterLogo(
                            size: 72,
                          ),
                          const Text(
                            "Examator",
                            style: TextStyle(
                                //color: Colors.white,
                                fontSize: 42,
                                decoration: TextDecoration.underline),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                              onPressed: () => Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    // ignore: prefer_const_constructors
                                    return MultiFormPage(
                                        // ignore: prefer_const_literals_to_create_immutables
                                        controller: {},
                                        title: "Ortalama Hesapla");
                                  })),
                              child: const Text("Ortalama Hesapla"),
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(200, 40),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(16)))),
                          const SizedBox(
                            height: 16,
                          ),
                          ElevatedButton(
                              onPressed: () => Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    TextEditingController kredi =
                                        TextEditingController();
                                    TextEditingController odev =
                                        TextEditingController();
                                    kredi.text = "1";
                                    odev.text = "0";

                                    return FormPage(
                                      // ignore: prefer_const_literals_to_create_immutables
                                      controller: {},
                                      tekDers: true,
                                      title: 'Tek Ders Hesapla',
                                    );
                                  })),
                              child: const Text("Tek Ders Hesapla"),
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(200, 40),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(16)))),
                        ],
                      ),
                    ],
                  )))),
    );
  }
}
