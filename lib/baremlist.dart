import 'package:examinator/formbox.dart';
import 'package:flutter/material.dart';

class BaremList extends StatelessWidget {
  final List controllers;

  const BaremList({Key? key, required this.controllers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      backgroundColor: Theme.of(context).focusColor,
      title: Text(
        "Not Baremleri",
        style: TextStyle(color: Theme.of(context).disabledColor),
      ),
      iconColor: Theme.of(context).disabledColor,
      children: [
        BaremForm(
          text: "AA",
          controller: controllers[0],
        ),
        BaremForm(text: "BA", controller: controllers[1]),
        BaremForm(text: "BB", controller: controllers[2]),
        BaremForm(text: "CB", controller: controllers[3]),
        BaremForm(text: "CC", controller: controllers[4]),
        BaremForm(text: "DC", controller: controllers[5]),
        BaremForm(text: "DD", controller: controllers[6]),
        //BaremForm(text: "FF"),
        const SizedBox(
          height: 8,
        ),
        /*  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Baremler"),
              Expanded(
                  child: SizedBox(
                width: double.infinity,
              )),
              Switch(
                  value: baremBool,
                  onChanged: (value) {
                    baremBool = !baremBool;
                    print(baremBool);
                  })
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ) */
      ],
    );
  }
}

class BaremForm extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  BaremForm({Key? key, required this.text, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: Row(
        children: [
          Text(text),
          SizedBox(
            width: 64,
          ),
          Expanded(
            child: FormBox(
                validatorMode: 0,
                question: "Not",
                controller: controller,
                hintText: "Almanız gereken not..."),
          )
        ],
      ),
    );
  }
}
