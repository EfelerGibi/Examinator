import 'package:examinator/hesaplandi.dart';
import 'package:flutter/material.dart';

class HesaplaButton extends StatelessWidget {
  final double width;
  final Map controller;
  const HesaplaButton({Key? key, required this.controller, this.width = 48})
      : super(key: key);

  bool hesaplamaValidator() {
    double weights = 0;

    for (var i in controller.values) {
      weights = 0;
      for (var j in i.keys) {
        if (j != "name" && i[j] is TextEditingController) {
          if (j == "odev") {
          } else if (j == "odevw" &&
              i[j].text != null &&
              double.tryParse(i[j].text) == null) {
          } else if (double.tryParse(i[j].text) == null) {
            return false;
          } else if (double.parse(i[j].text) > 100) {
            return false;
          } else if (j == "odevw" || j == "finalw" || j == "vizew") {
            weights += double.parse(i[j].text);
          }
        } else if (i[j] is Map) {
          for (var k in i[j].values) {
            if (double.tryParse(k[1].text) == null) {
              return false;
            }
          }
        }
      }
    }
    //print(weights);
    if (weights == 100) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(width, 12, width, 24),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            onPressed: () {
              if (hesaplamaValidator()) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Hesaplandi(
                              title: "Notlarınız",
                              controller: controller,
                            )));
              } else {
                showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                            backgroundColor: const Color(0xFF424242),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            title: const Text("Hatalı giriş yaptınız.",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            content: const Text(
                                'Girdilerinizi bir daha kontrol edip tekrar hesaplayınız.',
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Tamam'),
                                child: const Text('Tamam'),
                              )
                            ]));
              }
            }, //hesaplamaPress
            child: const Text("Hesapla"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.grey[800]),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))))),
      ),
    );
  }
}
