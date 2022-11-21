import 'package:examinator/gpacalc.dart';
import 'package:examinator/multiform_page.dart';
import 'package:examinator/pass_calc.dart';
import 'package:flutter/material.dart';
import 'form_page.dart';
import 'pagewrapper.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'app_theme.dart';
// import 'testwid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
        builder: (ColorScheme? lightColorScheme, ColorScheme? darkColorScheme) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme(lightColorScheme),
        darkTheme: AppTheme.darkTheme(darkColorScheme),
        themeMode: ThemeMode.system,
        home: const MyHomePage(),
      );
    });
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
            padding: 24,
            child: ListView(
              shrinkWrap: true,
              //mainAxisSize: MainAxisSize.min,
              //direction: Axis.vertical,
              //alignment: WrapAlignment.center,
              //crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const FlutterLogo(
                  size: 72,
                ),
                const SizedBox(height: 16),
                Center(
                  child: Text("Examator",
                      style: Theme.of(context).textTheme.displayMedium),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                    onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          // ignore: prefer_const_constructors
                          return MultiFormPage(
                              // ignore: prefer_const_literals_to_create_immutables
                              controller: {}, title: "Ortalama Hesapla");
                        })),
                    child: Text("Ortalama Hesapla",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.w600,
                            wordSpacing: 0.15,
                            fontSize: 16)),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        minimumSize: const Size(200, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)))),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          TextEditingController kredi = TextEditingController();
                          TextEditingController odev = TextEditingController();
                          kredi.text = "1";
                          odev.text = "0";

                          return FormPage(
                            // ignore: prefer_const_literals_to_create_immutables
                            controller: {},
                            tekDers: true,
                            title: 'Tek Ders Hesapla',
                          );
                        })),
                    child: Text("Tek Ders Hesapla",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.w600,
                            wordSpacing: 0.15,
                            fontSize: 16)),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        minimumSize: const Size(200, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)))),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    child: Text("GPA Hesaplama",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.w600,
                            wordSpacing: 0.15,
                            fontSize: 16)),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        minimumSize: const Size(200, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                    onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return GpaCalc(title: "GPA Hesaplama", gap: 16,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  controller: {});
                            },
                          ),
                        )),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    child: Text("Kaçla Geçerim?",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.w600,
                            wordSpacing: 0.15,
                            fontSize: 16)),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        minimumSize: const Size(200, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                    onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return PassCalc();
                            },
                          ),
                        ))
              ],
            ),
          ))),
    );
  }
}
