import 'package:flutter/material.dart';
import 'formbox.dart';
import 'multiformbox.dart';

class PassList extends StatelessWidget {
  final Map controller;
  final double gap;
  const PassList({
    Key? key,
    this.gap = 16,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        FormBox(
            inputType: TextInputType.text,
            validatorMode: 2,
            maxLength: 50,
            question: "Ders ismini giriniz",
            controller: controller["name"],
            hintText: "Dersin ismi..."),
        SizedBox(
          height: gap,
        ),
        MultiFormBox(
          hintText: 'Vize Notunuz...',
          question: 'Vize notunuzu giriniz.',
          controller: controller,
          title: 'vize',
        ),
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
        FormBox(
            question: "Geçme notu",
            controller: controller["gnotu"],
            hintText: "Geçme Notu..."),
        SizedBox(
          height: gap,
        ),
      ],
    );
  }
}
