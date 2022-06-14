import 'package:examinator/pagewrapper.dart';
import 'package:flutter/material.dart';

class PassHesaplandi extends StatelessWidget {
  final String title;
  final Map controller;

  const PassHesaplandi({
    Key? key,
    required this.controller,
    required this.title,
  }) : super(key: key);

  String hesaplama() {
    return "";
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
