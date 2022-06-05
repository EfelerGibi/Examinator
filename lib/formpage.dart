import 'package:flutter/material.dart';
import 'pagewrapper.dart';
import 'formlist.dart';
import 'hesapla_button.dart';

// ignore: must_be_immutable
class FormPage extends StatelessWidget {
  final bool tekDers;
  Map controller;
  final String title;
  final Color titleColor;
  final double gap;
  final List _page = [];
  FormPage(
      {Key? key,
      this.gap = 16,
      this.tekDers = false,
      required this.controller,
      required this.title,
      this.titleColor = const Color(0xFF424242)})
      : super(key: key);

  void addFirstPage() {
    if (controller.isEmpty) {
      TextEditingController odev = TextEditingController();
      TextEditingController kredi = TextEditingController();
      kredi.text = "1";

      //odev.text = "0";

      Map wid = {
        "name": TextEditingController(),
        "vize": {},
        "odev": {},
        "final": TextEditingController(),
        "vizew": TextEditingController(),
        "odevw": odev,
        "finalw": TextEditingController(),
        "kredi": kredi,
      };
      _page.add(CardWrapper(
          child: FormList(
            controller: wid,
            gap: 16,
            tekDers: true,
          ),
          padding: 16));

      controller[_page[0]] = wid;
    }
  }

  @override
  Widget build(BuildContext context) {
    addFirstPage();
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
          body: Column(children: [
            Expanded(child: _page[0]),
            HesaplaButton(
              controller: controller,
              width: 16,
            )
          ])),
    );
  }
}
