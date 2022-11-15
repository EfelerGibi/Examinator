import 'package:examinator/pagewrapper.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GpaHesaplandi extends StatelessWidget {
  final String title;
  final Map controller;
  double? _rawValue = 0;

  GpaHesaplandi({
    Key? key,
    required this.controller,
    required this.title,
  }) : super(key: key);

  String hesaplama() {
    double _ort = 0;
    double _creds = 0;
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
      _creds += double.parse(controller[i][1][1].text);
      _ort += double.parse(controller[i][1][1].text) *
          _scalars2[_scalars1.indexOf(controller[i][1][0].text.toLowerCase())];
    }

    if (_creds != 0) {
      _rawValue = (_ort / _creds);
      return (_rawValue!).toStringAsFixed(2) +
          " " +
          _scalars1[_scalars2.indexOf((((_ort / _creds) * 2).round() / 2))]
              .toUpperCase();
    } else {
      return 0.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    String hesaplanan = hesaplama();
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
                    Stack(alignment: AlignmentDirectional.center, children: [
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: CircularProgressIndicator(
                          strokeWidth: 8,
                          backgroundColor:
                              Theme.of(context).colorScheme.tertiaryContainer,
                          value: (_rawValue! / 4),
                        ),
                      ),
                      Wrap(
                        direction: Axis.vertical,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        alignment: WrapAlignment.center,
                        children: [
                          Text(
                            "Ortalamanız",
                            style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                                fontSize: 16,
                                decoration: TextDecoration.underline),
                          ),
                          Text(
                            "Genel ortalamanız: " + hesaplanan,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                          )
                        ],
                      ),
                    ]),
                  ],
                ))));
  }
}
