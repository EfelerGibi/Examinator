import 'package:flutter/material.dart';
import 'formbox.dart';

// ignore: must_be_immutable
class GpaList extends StatefulWidget {
  GpaList({Key? key, this.gap = 16, required this.controller})
      : super(key: key);
  final double gap;
  Map controller;

  @override
  State<GpaList> createState() => _GpaListState();
}

class _GpaListState extends State<GpaList> {
  //late final Map _widlist = widget.controller;
  int _index = 0;
  bool _addedFirstField = false;

  void addFirstField() {
    if (!_addedFirstField) {
      final TextEditingController _firstcontroller = TextEditingController();
      final TextEditingController _firstKrediController =
          TextEditingController();
      widget.controller[0] = [
        Row(
          children: [
            Expanded(
              child: FormBox(
                  inputType: TextInputType.text,
                  validatorMode: 2,
                  maxLength: 2,
                  question: "Dersin Harf Notu",
                  controller: _firstcontroller,
                  hintText: "Dersinizin notu..."),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: FormBox(
                  question: "Dersin Kredisi",
                  controller: _firstKrediController,
                  hintText: "Dersinizin kredisi..."),
            ),
            const SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: addField,
              icon: Icon(Icons.add_circle_rounded,
                  color: Theme.of(context).colorScheme.primary),
            )
          ],
        ),
        [_firstcontroller, _firstKrediController]
      ];
      _addedFirstField = true;
    }
  }

  void addField() {
    _index++;
    int _localindex = _index;
    TextEditingController controller = TextEditingController();
    TextEditingController krediController = TextEditingController();
    Row trow = Row(
      children: [
        Expanded(
          child: FormBox(
              validatorMode: 1,
              inputType: TextInputType.text,
              maxLength: 2,
              question: "Dersin Notu",
              controller: controller,
              hintText: "Dersinizin notu..."),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: FormBox(
              question: "Dersin Kredisi",
              controller: krediController,
              hintText: "Dersinizin Kredisi..."),
        ),
        const SizedBox(
          width: 10,
        ),
        IconButton(
          onPressed: () {
            widget.controller.remove(_localindex);
            _index--;
            setState(() {});
          },
          icon: Icon(Icons.remove_circle_rounded,
              color: Theme.of(context).colorScheme.primary),
        )
      ],
    );
    widget.controller[_localindex] = [
      trow,
      [controller, krediController]
    ];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    addFirstField();
    return ListView(
      children: [
        for (var i in widget.controller.keys) ...[
          widget.controller[i]?[0],
          SizedBox(
            height: widget.gap,
          )
        ]
      ],
    );
  }
}
