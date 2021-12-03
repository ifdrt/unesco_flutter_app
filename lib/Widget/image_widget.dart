import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Img extends StatelessWidget {
  late String url;
  BoxFit? boxFit;
  late double size;
  Widget? errorWidget;
  Widget? placeholder;
  Img(
      {required this.url,
      this.boxFit,
      this.errorWidget,
      required this.size,
      this.placeholder});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fadeInDuration: Duration(milliseconds: 200),
      placeholderFadeInDuration: Duration(milliseconds: 0),

      placeholder: (context, url) => placeholder != null
          ? placeholder!
          : Container(
              height: size,
              width: size,
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child:
                  Center(child: Image.asset("assets/images/about-img.jpeg"))),
      imageUrl: false ? "https://www.sqorebda3.com/vb/attachments/15652/" : url,
//   imageBuilder: (context, imageProvider) => Container(
      //   decoration: BoxDecoration(
      //     image: DecorationImage(
      //         image: imageProvider,
      //         fit: BoxFit.cover,
      //         colorFilter:
      //             ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
      //   ),
      // ),

      fit: boxFit ?? BoxFit.fill,
      errorWidget: (context, url, error) =>
          errorWidget ??
          Container(
            color: Colors.transparent,
            alignment: Alignment.center,
            child: Icon(
              EvaIcons.info,
              size: 30,
            ),
          ),
    );
  }
}
