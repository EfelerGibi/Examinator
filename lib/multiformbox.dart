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

class _MultiFormBoxState extends State<MultiFormBox>
    with AutomaticKeepAliveClientMixin {
  late Map widlist = widget.controller[widget.title];
  int _index = 0;
  bool _addedFirstField = false;

  Widget _removebutton(int index) {
    return IconButton(
      onPressed: () {
        widlist.remove(index);
        if (mounted) setState(() {});
        _index--;
      },
      icon: Icon(Icons.remove_circle_rounded,
          color: Theme.of(context).colorScheme.primary),
    );
  }

  addFirstField() {
    if (widget.hasFirstField && !_addedFirstField) {
      TextEditingController controller = TextEditingController();
      Row trow = Row(
        children: [
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
        ],
      );
      widlist[0] = [trow, controller];
      _addedFirstField = true;
    }
  }

  addField() {
    int _localIndex = _index + 1;
    _index++;

    TextEditingController controller = TextEditingController();

    Row trow = Row(
      children: [
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
        _removebutton(_localIndex)
      ],
    );
    setState(() {
      widlist[_index] = [trow, controller];
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    if (widget.hasFirstField && !_addedFirstField) addFirstField();
    super.build(context);
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
                    Size.fromWidth(MediaQuery.of(context).size.width)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)))),
          ),
          const SizedBox(height: 16)
        ],
        for (var i in widlist.keys.toList()) ...[
          if (0 != i && widlist[i] != null) const SizedBox(height: 16),
          if (widlist[i] != null) widlist[i][0],
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
