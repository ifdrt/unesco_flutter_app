import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:unesco/data/Model/home_model.dart';
import 'package:unesco/data/dataProvider/func.dart';

class NewsDetailsView extends StatelessWidget {
  const NewsDetailsView({
    Key? key,
    required this.data,
  }) : super(key: key);

  final ArticlesModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(3),
                          topRight: Radius.circular(3)),
                      child: Image(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(data.photo!)))),
              Align(
                alignment: Alignment.topCenter,
                child: ListTile(
                  trailing: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.cancel_outlined,
                        color: Colors.white,
                        size: 30,
                      )),
                  leading: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 30,
                      )),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text(
              Funct.getTime(data.createdAt!),
              style: Theme.of(context).textTheme.bodyText1,
            ),
            subtitle: Text(
              data.longDescription!,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.all(40),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    primary: Theme.of(context).accentColor),
                onPressed: () {},
                child: Text("قراءة التالي")),
          )
        ],
      ),
    );
  }
}
