import 'package:examinator/pagewrapper.dart';
import 'package:flutter/material.dart';
import 'gpa_calc_list.dart';
import "gpa_hesaplandi.dart";

// ignore: must_be_immutable
class GpaCalc extends StatelessWidget {
  Map controller = {};
  final String title;
  final double gap;
  String? _errType;
  GpaCalc(
      {Key? key,
      required this.title,
      required this.gap,
      required this.controller})
      : super(key: key);

  bool hesaplamaValidator() {
    for (var i in controller.values) {
      if (!["ff", "na", "dd", "dc", "cc", "cb", "bb", "ba", "aa"]
          .contains(i[1][0].text.toLowerCase())) {
        _errType = "Harf notunuzu kontrol ediniz.";
        return false;
      } else if (double.tryParse(i[1][1].text) == null) {
        _errType = "Dersin kredisini kontrol ediniz.";
        return false;
      }
    }
    return true;
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
              title: Text(title, style: Theme.of(context).textTheme.headline5),
              backgroundColor: Theme.of(context).colorScheme.background,
            ),
            body: Column(
              children: [
                Expanded(
                  child: CardWrapper(
                    padding: 16,
                    child: GpaList(
                      controller: controller,
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
                    child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              if (hesaplamaValidator()) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => GpaHesaplandi(
                                              title: "Notlarınız",
                                              controller: controller,
                                            )));
                              } else {
                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                            backgroundColor: Theme.of(context)
                                                .colorScheme
                                                .background,
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(16))),
                                            title: const Text(
                                                "Hatalı giriş yaptınız.",
                                                style: TextStyle(
                                                    //color: Colors.white,
                                                    )),
                                            content: Text(_errType!,
                                                style: const TextStyle(
                                                    //color: Colors.white,
                                                    )),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    context, 'Tamam'),
                                                child: const Text('Tamam'),
                                              )
                                            ]));
                              }
                            },
                            child: Text(
                              "Hesapla",
                              style: Theme.of(context).textTheme.button,
                            ),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Theme.of(context).colorScheme.background),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16)))))))
              ],
            )));
  }
}
