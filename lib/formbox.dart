import 'package:flutter/material.dart';

class FormBox extends StatelessWidget {
  final String question;
  final TextEditingController controller;
  final String hintText;
  final TextEditingController? changedController;

  final bool emptyCheck;
  final Color fieldColor;
  final Color borderColor;
  final bool validator;
  final double padding;
  final TextInputType inputType;
  final int maxLength;
  final bool enabled;
  final TextEditingController? substractController;

  const FormBox(
      {Key? key,
      required this.question,
      required this.controller,
      required this.hintText,
      this.substractController,
      this.maxLength = 5,
      this.changedController,
      this.inputType = TextInputType.number,
      this.padding = 0,
      this.validator = true,
      this.emptyCheck = true,
      this.enabled = true,
      this.fieldColor = Colors.grey,
      this.borderColor = Colors.white})
      : super(key: key);

  notChange(value) {
    if (changedController == null) {
    } else if (substractController != null && substractController!.text != "") {
      if (int.tryParse(value) != null &&
          int.tryParse(substractController!.text) != null) {
        changedController?.text =
            (100 - int.parse(value) - int.parse(substractController!.text))
                .toString();
      } else if (double.tryParse(value) != null &&
          double.tryParse(substractController!.text) != null) {
        changedController?.text = (100 -
                double.parse(value) -
                double.parse(substractController!.text))
            .toString();
      } else {
        changedController?.text = "";
      }
    } else if (substractController!.text == "") {
      if (int.tryParse(value) != null) {
        changedController?.text = (100 - int.parse(value)).toString();
      } else if (double.tryParse(value) != null) {
        changedController?.text = (100 - double.parse(value)).toString();
      } else {
        changedController?.text = "";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: Theme.of(context).textTheme.labelMedium,
        controller: controller,
        onChanged: (value) => {notChange(value)},
        maxLength: maxLength,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (validator) {
            if (value == null || value.isEmpty) {
              if (emptyCheck) {
                return null;
              } else {
                return null;
              }
            } else if (double.tryParse(value) == null) {
              return "Bir sayı giriniz";
            } else if (0.0 > double.parse(value)) {
              return "0'dan Büyük değer giriniz";
            } else if (100 < double.parse(value)) {
              return "100'den küçük değer giriniz.";
            }
          } else {
            if (value == null || value.isEmpty) {
              if (emptyCheck) {
                return null;
              } else {
                return null;
              }
            } else if (!["ff", "na", "dd", "dc", "cc", "cb", "bb", "ba", "aa"]
                .contains(value.toLowerCase())) {
              return "Uygun değer Giriniz";
            }
            return null;
          }
        },
        keyboardType: inputType,
        enabled: enabled,
        decoration: InputDecoration(
            hintStyle: Theme.of(context).textTheme.labelSmall,
            labelStyle: Theme.of(context).textTheme.bodySmall,
            counterText: "",
            labelText: question,
            hintText: hintText,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.onSurface,
                ))));
  }
}
