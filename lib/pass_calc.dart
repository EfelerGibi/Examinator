import 'package:examinator/pagewrapper.dart';
import 'package:flutter/material.dart';
import 'pass_calc_list.dart';
import "pass_hesaplandi.dart";

class PassCalc extends StatelessWidget {
  final TextEditingController _odev = TextEditingController();
  final String title = "Kaçla Geçerim?";
  String _errType = "";
  late final Map _controller = {
    "name": TextEditingController(),
    "vize": {},
    "odev": {},
    "gnotu": TextEditingController(),
    "vizew": TextEditingController(),
    "odevw": _odev,
    "finalw": TextEditingController(),
  };
  PassCalc({Key? key}) : super(key: key);

  bool hesaplamaValidator() {
    for (var i in _controller["vize"].keys) {
      if (double.tryParse(_controller["vize"][i][1].text) == null) {
        _errType = "Vize notunuza lütfen geçerli bir sayı giriniz";
        return false;
      } else if (0 > double.parse(_controller["vize"][i][1].text) ||
          double.parse(_controller["vize"][i][1].text) > 100) {
        _errType = "Vize notunuza lütfen geçerli bir sayı giriniz";
        return false;
      }
    }
    for (var i in _controller["odev"].keys) {
      if (double.tryParse(_controller["odev"][i][1].text) == null) {
        _errType = "Ödev notunuza lütfen geçerli bir sayı giriniz";
        return false;
      } else if (0 >= double.parse(_controller["odev"][i][1].text) ||
          double.parse(_controller["odev"][i][1].text) >= 100) {
        _errType = "Ödev notunuza lütfen geçerli bir sayı giriniz";
        return false;
      }
    }
    if (double.tryParse(_controller["vizew"].text) == null) {
      _errType = "Vize not ağırlığına lütfen geçerli bir sayı giriniz";
      return false;
    } else if (0 >= double.parse(_controller["vizew"].text) ||
        double.parse(_controller["vizew"].text) > 100) {
      _errType = "Vize not ağırlığına lütfen geçerli bir sayı giriniz";
      return false;
    }
    if (double.tryParse(_controller["gnotu"].text) == null) {
      _errType = "Geçer notu hatalı girdiniz";
      return false;
    } else if (0 >= double.parse(_controller["gnotu"].text) ||
        double.parse(_controller["gnotu"].text) > 100) {
      _errType = "Geçer notu hatalı girdiniz";
      return false;
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
              title: Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              backgroundColor: Theme.of(context).colorScheme.background,
            ),
            body: Column(
              children: [
                Expanded(
                  child: CardWrapper(
                    padding: 16,
                    child: PassList(
                      controller: _controller,
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
                                        builder: (context) => PassHesaplandi(
                                              title: "Notlarınız",
                                              controller: _controller,
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
                                            content: Text(_errType,
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
