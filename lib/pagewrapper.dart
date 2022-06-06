import 'package:flutter/material.dart';

class PageWrapper extends StatelessWidget {
  final Widget child;
  final double padding;

  const PageWrapper({Key? key, required this.child, this.padding = 0})
      : super(key: key);

  Color darken(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lighten(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: const Alignment(-1.0, -1),
              end: const Alignment(1.0, 1),
              colors: [
                darken(Theme.of(context).colorScheme.primary, 0.2),
                lighten(Theme.of(context).colorScheme.primary, 0.2),
              ],
              stops: const [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Container(child: child),
        ));
  }
}

class CardWrapper extends StatelessWidget {
  final Widget child;
  final double padding;
  final Color color;
  final double outerPadding;
  final bool infHeight;
  const CardWrapper(
      {Key? key,
      this.infHeight = true,
      this.outerPadding = 16.0,
      required this.child,
      required this.padding,
      this.color = const Color(0xFF424242)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (infHeight) {
      return Padding(
          padding: EdgeInsets.all(outerPadding),
          child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF424242).withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.circular(16)),
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: child,
              )));
    } else {
      return Padding(
          padding: EdgeInsets.all(padding),
          child: Container(
              // alignment: Axis.vertical,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF424242).withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.circular(16)),
              width: double.infinity,
              child: Padding(padding: EdgeInsets.all(padding), child: child)));
    }
  }
}
