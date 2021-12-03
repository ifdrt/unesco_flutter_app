import 'package:flutter/material.dart';

class ButtonOutline extends StatelessWidget {
  late String title;
  Color color;
  double? width;
  double? height;
  void Function() onTapp;
  ButtonOutline(
      {Key? key,
      required this.title,
      required this.onTapp,
      required this.color,
      this.width,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTapp(),
      child: Container(
        alignment: Alignment.center,
        height: height!,
        width: width!,
        decoration: BoxDecoration(
            border: Border.all(color: color, width: 1.3),
            borderRadius: BorderRadius.circular(3)),
        child: Padding(
          padding: EdgeInsets.only(left: 5, right: 5),
          child: Text(
            title,
            style:
                Theme.of(context).textTheme.bodyText1?.copyWith(color: color),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
