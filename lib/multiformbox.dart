import 'package:flutter/material.dart';
import 'formbox.dart';

class MultiFormBox extends StatefulWidget {
  const MultiFormBox(
      {Key? key,
      required this.title,
      required this.controller,
      required this.hintText,
      required this.question,
      this.buttonText = "placeholder",
      this.hasButton = false,
      this.hasFirstField = true,
      this.fieldColor = Colors.grey,
      this.borderColor = Colors.white})
      : super(key: key);
  final String question;
  final String hintText;
  final bool hasButton;
  final String buttonText;
  final bool hasFirstField;
  final Color fieldColor;
  final Color borderColor;
  final Map controller;
  final String title;

  @override
  State<MultiFormBox> createState() => _MultiFormBoxState();
}

class _MultiFormBoxState extends State<MultiFormBox> {
  late Map widlist = widget.controller[widget.title];
  bool _addedFirstField = false;

  addFirstField() {
    //print("aff was called");
    if (widget.hasFirstField) {
      TextEditingController controller = TextEditingController();
      List<Widget> newWid = [
        Expanded(
          child: FormBox(
              question: widget.question,
              hintText: widget.hintText,
              fieldColor: widget.fieldColor,
              borderColor: widget.borderColor,
              controller: controller),
        ),
        const SizedBox(
          width: 10,
        ),
        IconButton(
          onPressed: addField,
          icon: Icon(Icons.add_circle_rounded,
              color: Theme.of(context).colorScheme.primary),
        )
      ];
      Row trow = Row(
        children: newWid,
      );
      widlist[trow] = [newWid[0], controller];
      _addedFirstField = true;
    }
  }

  addField() {
    //print("want to add field");
    setState(() {
      TextEditingController controller = TextEditingController();
      //print("1");
      List<Widget> newWid = [
        Expanded(
          child: FormBox(
              question: widget.question,
              hintText: widget.hintText,
              fieldColor: widget.fieldColor,
              borderColor: widget.borderColor,
              controller: controller),
        ),
        const SizedBox(
          width: 10,
        )
      ];
      //print("2");
      Row trow = Row(
        children: newWid,
      );
      //print("3");
      widlist[trow] = [newWid[0], controller];
      //print("4");
      newWid.add(IconButton(
        onPressed: () {
          setState(() {
            widlist.remove(trow);
            //self.dispose();
          });
        },
        icon: Icon(Icons.remove_circle_rounded,
            color: Theme.of(context).colorScheme.primary),
      ));
      //print(widlist);
    });
  }

  // removeField(self) {
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    if (!_addedFirstField) addFirstField();
    return Column(
      children: <Widget>[
        if (widget.hasButton) ...[
          ElevatedButton(
            onPressed: addField,
            child: Text(widget.buttonText,
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.primary),
                fixedSize: MaterialStateProperty.all<Size>(
                    const Size.fromWidth(312312)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)))),
          ),
          const SizedBox(height: 16)
        ],
        for (var i in widlist.keys.toList()) ...[
          if (widlist.keys.toList()[0] != i) const SizedBox(height: 16),
          i,
          if (widget.hasButton && i == widlist.keys.toList().last) ...[
            const SizedBox(
              height: 16,
            ),
            FormBox(
                question: "Ödev not ağırlığını giriniz.",
                controller: widget.controller["odevw"],
                hintText: "Ödev not ağırlığını giriniz."),
            const SizedBox(
              height: 16,
            ),
          ],
        ]
      ],
    );
  }
}
