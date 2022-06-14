import 'package:flutter/material.dart';
import 'formbox.dart';
import 'multiformbox.dart';

class FormList extends StatelessWidget {
  final bool tekDers;
  final Map controller;
  final double gap;
  const FormList({
    Key? key,
    this.gap = 16,
    this.tekDers = false,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        FormBox(
            inputType: TextInputType.text,
            validator: false,
            maxLength: 50,
            question: "Ders ismini giriniz",
            controller: controller["name"],
            hintText: "Dersin ismi..."),
        SizedBox(
          height: gap,
        ),
        MultiFormBox(
          //hasButton: true,
          //hasFirstField: false,
          hintText: 'Vize Notunuz...',
          question: 'Vize notunuzu giriniz.', controller: controller,
          title: 'vize',
        ),
        SizedBox(
          height: gap,
        ),
        FormBox(
            question: "Final notunuzu giriniz.",
            controller: controller["final"],
            hintText: "Final Notunuz..."),
        SizedBox(
          height: gap,
        ),
        MultiFormBox(
            buttonText: "Ödev Ekle",
            hasButton: true,
            hasFirstField: false,
            hintText: "Ödev Notunuz...",
            question: "Ödev notunuzu giriniz.",
            controller: controller,
            title: 'odev'),
        FormBox(
            question: "Vize not ağırlığını giriniz.",
            controller: controller["vizew"],
            substractController: controller["odevw"],
            changedController: controller["finalw"],
            hintText: "Vize not ağırlığını giriniz."),
        SizedBox(
          height: gap,
        ),
        FormBox(
            question: "Final not ağırlığınız",
            controller: controller["finalw"],
            enabled: false,
            hintText: "Final not ağırlığı..."),
        SizedBox(
          height: gap,
        ),
        if (!tekDers) ...[
          FormBox(
              question: "Dersin kredisini giriniz.",
              controller: controller["kredi"],
              hintText: "Dersin kredisi..."),
          SizedBox(
            height: gap,
          ),
        ]
      ],
    );
  }
}
