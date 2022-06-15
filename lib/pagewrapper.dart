import 'package:flutter/material.dart';

class PageWrapper extends StatelessWidget {
  final Widget child;
  final double padding;

  const PageWrapper({Key? key, required this.child, this.padding = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: const Alignment(-1.0, -1),
              end: const Alignment(1.0, 1),
              colors: [
                Theme.of(context).colorScheme.tertiaryContainer,
                Theme.of(context).colorScheme.secondary,
              ],
              stops: const [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Container(
          child: child,
          margin: EdgeInsets.all(padding),
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
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(padding),
        ),
        margin: EdgeInsets.all(padding),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: child,
        ),
      ),
    );
  }
}
