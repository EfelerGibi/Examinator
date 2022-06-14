import 'package:examinator/pagewrapper.dart';
import 'package:flutter/material.dart';

class GpaHesaplandi extends StatelessWidget {
  final String title;
  final Map controller;
  final Map _dersler = {};

  GpaHesaplandi({
    Key? key,
    required this.controller,
    required this.title,
  }) : super(key: key);

  String hesaplama() {
    double _ort = 0;
    double _creds = 0;
    // Map<String, double> _scalars = {
    //   "aa": 4.0,
    //   "ba": 3.5,
    //   "bb": 3.0,
    //   "cb": 2.5,
    //   "cc": 2.0,
    //   "dc": 1.5,
    //   "dd": 1.0,
    //   "ff": 0.0,
    //   "na": 0.0
    // };
    List<String> _scalars1 = [
      "aa",
      "ba",
      "bb",
      "cb",
      "cc",
      "cd",
      "dd",
      "ff",
      "na"
    ];
    List<double> _scalars2 = [4.0, 3.5, 3.0, 2.5, 2.0, 1.5, 1.0, 0.0, 0.0];
    // _scalars = Map.unmodifiable(_scalars);
    for (var i in controller.keys) {
      String _sc = controller[i][1][0].text.toLowerCase();
      _creds += double.parse(controller[i][1][1].text);
      _ort += double.parse(controller[i][1][1].text) *
          _scalars2[_scalars1.indexOf(controller[i][1][0].text.toLowerCase())];
    }

    return (_ort / _creds).toStringAsFixed(2);
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
