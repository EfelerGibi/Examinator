import 'package:examinator/pagewrapper.dart';
import 'package:flutter/material.dart';

class PassHesaplandi extends StatelessWidget {
  final String title;
  final Map controller;
  final Map _dersler = {};

  PassHesaplandi({
    Key? key,
    required this.controller,
    required this.title,
  }) : super(key: key);

  String hesaplama() {
    double ortalama = 0;
    double kredi = 0;

    _dersler[controller["name"]] = {
      "final": (((100 * parseDouble(controller["gnotu"]) -
              (parseDouble(controller["vizew"]) *
                  multiOrtala(controller["vize"])) -
              (parseDouble(controller["odevw"], r: 0.0) *
                  multiOrtala(controller["odev"]))) /
          parseDouble(controller["finalw"])))
    };

    // for (var ders in _dersler.keys) {
    //   ortalama += _dersler[ders]["final"] * _dersler[ders]["kredi"];
    //   kredi += _dersler[ders]["kredi"];
    // }
    return (_dersler[controller["name"]]["final"]).toStringAsFixed(2);
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
                  children: [
                    Text(
                      "Almanız Gereken Not",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 42,
                          decoration: TextDecoration.underline),
                    ),
                    Text(
                      "Finalden " + hesaplama() + " almanız gerekiyor.",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    )
                  ],
                ))));
  }
}
