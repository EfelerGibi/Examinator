import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'form_list.dart';
import 'pagewrapper.dart';
import 'hesapla_button.dart';

class MultiFormPage extends StatefulWidget {
  final bool tekDers;
  final Map controller;
  final String title;
  final Color titleColor;
  final double gap;
  const MultiFormPage(
      {Key? key,
      this.gap = 16,
      this.tekDers = false,
      required this.controller,
      required this.title,
      this.titleColor = const Color(0xFF424242)})
      : super(key: key);

  @override
  State<MultiFormPage> createState() => _MultiFormPageState();
}

class _MultiFormPageState extends State<MultiFormPage> {
  final CarouselController _carouselController = CarouselController();
  void addFirstPage() {
    if (widget.controller.isEmpty) {
      TextEditingController odev = TextEditingController();
      //odev.text = "0";
      Map wid = {
        "name": TextEditingController(),
        "vize": {},
        "odev": {},
        "final": TextEditingController(),
        "vizew": TextEditingController(),
        "odevw": odev,
        "finalw": TextEditingController(),
        "kredi": TextEditingController(),
      };
      var page = CardWrapper(
        child: FormList(controller: wid, gap: 16),
        padding: 16,
      );

      widget.controller[page] = wid;
    }
  }

  void addPage() {
    setState(() {
      TextEditingController odev = TextEditingController();

      //odev.text = "0";

      Map wid = {
        "name": TextEditingController(),
        "vize": {},
        "odev": {},
        "final": TextEditingController(),
        "vizew": TextEditingController(),
        "odevw": odev,
        "finalw": TextEditingController(),
        "kredi": TextEditingController(),
      };
      var page =
          CardWrapper(child: FormList(controller: wid, gap: 16), padding: 16);

      widget.controller[page] = wid;
    });
  }

  void removePage() async {
    if (widget.controller.keys.length != 1) {
      setState(() {
        widget.controller.remove(widget.controller.keys.last);
      });
      await Future.delayed(const Duration(milliseconds: 100), () {});
      _carouselController.previousPage(
          duration: const Duration(milliseconds: 100));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        content: Text(
          "Sayfa Kald??r??ld??",
          style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
        ),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    addFirstPage();
    return PageWrapper(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              centerTitle: true,
              iconTheme: IconThemeData(
                  color: Theme.of(context).textTheme.headline5!.color),
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(16))),
              title: Text(
                widget.title,
                style: Theme.of(context).textTheme.headline5,
              ),
              backgroundColor: Theme.of(context).colorScheme.background,
            ),
            body: Column(
              children: [
                Expanded(
                  child: CarouselSlider(
                      carouselController: _carouselController,
                      options: CarouselOptions(
                          scrollDirection: Axis.horizontal,
                          height: double.infinity,
                          enableInfiniteScroll: false),
                      items: [
                        ...widget.controller.keys,
                        CardWrapper(
                          padding: 16,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.add_circle_rounded,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  onPressed: addPage,
                                ),
                                IconButton(
                                  onPressed: removePage,
                                  icon: Icon(
                                    Icons.remove_circle_rounded,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                )
                              ]),
                        )
                      ]),
                ),
                HesaplaButton(
                  controller: widget.controller,
                )
              ],
            )));
  }
}
