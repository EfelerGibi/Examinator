import 'package:flutter/material.dart';
import 'pagewrapper.dart';

class Hesaplandi extends StatelessWidget {
  final String title;
  final Map controller;
  final Map _dersler = {};

  Hesaplandi({
    Key? key,
    required this.controller,
    required this.title,
  }) : super(key: key);

  double parseBarem(baremController, not) {
    List _gpaList = [4.0, 3.5, 3.0, 2.5, 2.0, 1.5, 1.0, 0.0];
    for (var i in baremController) {
      if (double.parse(i.text) < not) {
        return _gpaList[baremController.indexOf(i)];
      }
    }

    return 0;
  }

  List<String> hesaplama() {
    double ortalama = 0;
    double gpa = 0;
    double kredi = 0;
    for (var values in controller.values) {
      _dersler[values["name"]] = {
        "ortalama": (((parseDouble(values["final"]) *
                    parseDouble(values["finalw"])) +
                (parseDouble(values["vizew"]) * multiOrtala(values["vize"])) +
                (parseDouble(values["odevw"], r: 0.0) *
                    multiOrtala(values["odev"]))) /
            100),
        "kredi": parseDouble(values["kredi"]),
      };
      _dersler[values["name"]]["barem"] =
          parseBarem(values["barem"], _dersler[values["name"]]["ortalama"]);
    }
    for (var ders in _dersler.keys) {
      ortalama += _dersler[ders]["ortalama"] * _dersler[ders]["kredi"];
      gpa += _dersler[ders]["barem"] * _dersler[ders]["kredi"];
      kredi += _dersler[ders]["kredi"];
    }
    return [
      (ortalama / kredi).toStringAsFixed(2),
      (gpa / kredi).toStringAsFixed(2)
    ];
  }

  double parseDouble(value, {r = 1.0}) {
    if (double.tryParse(value.text) != null) {
      return double.parse(value.text);
    }
    return r;
  }

  double multiOrtala(Map value) {
    double toplam = 0;
    int sayi = 0;
    for (var i in value.values) {
      toplam += double.parse(i[1].text);
      sayi++;
    }
    if (sayi != 0) {
      return toplam / sayi;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> hesaplanan = hesaplama();
    return PageWrapper(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              iconTheme: IconThemeData(
                  color: Theme.of(context).textTheme.headline5!.color),
              centerTitle: true,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(16))),
              title: Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              backgroundColor: Theme.of(context).colorScheme.background,
            ),
            body: CardWrapper(
                padding: 24,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        SizedBox(
                          width: 200,
                          height: 200,
                          child: CircularProgressIndicator(
                            strokeWidth: 8,
                            backgroundColor:
                                Theme.of(context).colorScheme.tertiaryContainer,
                            value: (double.parse(hesaplanan[0]) / 100),
                          ),
                        ),
                        Wrap(
                          direction: Axis.vertical,
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text(
                              "Ortalamanız",
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                  fontSize: 16,
                                  decoration: TextDecoration.underline),
                            ),
                            Text(
                              "Genel ortalamanız: " +
                                  hesaplanan[0] +
                                  " " +
                                  hesaplanan[1],
                              style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ))));
  }
}
