import 'package:examinator/pagewrapper.dart';
import 'package:flutter/material.dart';
import 'gpa_calc_list.dart';

class GpaCalc extends StatelessWidget {
  Map controller = {};
  final String title;
  final double gap;
  GpaCalc(
      {Key? key,
      required this.title,
      required this.gap,
      required this.controller})
      : super(key: key);

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
                            onPressed: () {},
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
