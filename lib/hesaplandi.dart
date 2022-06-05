import 'package:flutter/material.dart';
import 'pagewrapper.dart';

class Hesaplandi extends StatelessWidget {
  final String title;
  final Color titleColor;
  final Map controller;
  final Map _dersler = {};

  Hesaplandi(
      {Key? key,
      required this.controller,
      required this.title,
      this.titleColor = const Color(0xFF424242)})
      : super(key: key);

  String hesaplama() {
    double ortalama = 0;
    double kredi = 0;
    for (var values in controller.values) {
      _dersler[values["name"]] = {
        "ortalama": (((parseDouble(values["final"]) *
                    parseDouble(values["finalw"])) +
                (parseDouble(values["vizew"]) * multiOrtala(values["vize"])) +
                (parseDouble(values["odevw"], r: 0.0) *
                    multiOrtala(values["odev"]))) /
            100),
        "kredi": parseDouble(values["kredi"])
      };
    }
    for (var ders in _dersler.keys) {
      ortalama += _dersler[ders]["ortalama"] * _dersler[ders]["kredi"];
      kredi += _dersler[ders]["kredi"];
    }
    return (ortalama / kredi).toStringAsFixed(2);
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
    return PageWrapper(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              centerTitle: true,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(16))),
              title: Text(
                title,
                style: Theme.of(context).textTheme.headline1,
              ),
              backgroundColor: Theme.of(context).colorScheme.background,
            ),
            body: CardWrapper(
                padding: 24,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Ortalamanız",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 42,
                          decoration: TextDecoration.underline),
                    ),
                    Text(
                      "Genel ortalamanız: " + hesaplama(),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    )
                  ],
                ))));
  }
}
