import 'dart:convert';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:provider/provider.dart';
import 'package:unesco/Provider/navigator_provide.dart';
import 'package:unesco/Provider/theme_provider.dart';
import 'package:unesco/Widget/alert_dailog.dart';
import 'package:unesco/Widget/button_outline.dart';
import 'package:unesco/Widget/drop_down.dart';
import 'package:unesco/Widget/image_widget.dart';
import 'package:unesco/Widget/textfield.dart';
import 'package:unesco/bussines_logic/home_bloc/home_bloc_b.dart';
import 'package:unesco/bussines_logic/submit_bloc/submit_bloc_b.dart';
import 'package:unesco/data/Model/report_submit.dart';
import 'package:unesco/data/dataProvider/main_info.dart';

import 'home.dart';
import 'slid_view.dart';

class ShakwaView extends StatefulWidget {
  @override
  _ShakwaView createState() => _ShakwaView();
}

class _ShakwaView extends State<ShakwaView> {
  bool first = true;
  PageController pageController = new PageController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController workplaceController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  TextEditingController jopController = TextEditingController();
  TextEditingController spacialController = TextEditingController();
  TextEditingController textController = TextEditingController();
  TextEditingController placeeOfaccedentController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  int id = -1;
  String? type;

  String? selected_marige;

  String? select_eligion;

  String? selected_national;

  String? selected_civil;
  final f = GlobalKey<FormState>();

  int page = 0;

  String title = "?????????? ????????";
  @override
  Widget build(BuildContext context) {
    final navigatProv = Provider.of<NavigateProv>(context);
    final theme = Provider.of<ThemeUtils>(context);
    if (first) {
      navigatProv.getInfo();

      pageController = PageController(
        initialPage: 0,
      )..addListener(() {
          setState(() {
            page = pageController.page!.toInt();
          });
        });
      first = false;
    }
    return theme.status == 0
        ? Container(
            child: ListView(
              children: [
                Container(
                    height: 150,
                    width: 150,
                    child: Image.asset("assets/images/logo.png")),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    " ?????? ???????????? ?????? ???????? ?????????????? ?????????????? ?????????????????????? ???????? ?????? ?????? ???????? ???????????? ??????????." +
                        "?????????? ?????????? ???????? ?????????????? ???????????????? ?????????????? ?????????????? ???????????? ?????????????? ???? ???????????? ?????????????? ????????. ???????? ???????????????? ?????? ?????????????? ??????????: ?????? ???????? ?????????????????? ?????????????? ???????????????????? ?????? ?????????? ???? ?????????????? ???????? ??????????????. ?????? ?????? ?????? ?????????? ???? ?????????? ???? ?????? ???????????? ?????? ?????? ?????????? ???????? ??????????????" +
                        "???????????? ???????????? ???????? ???????????????? ????????????" +
                        "???? ???????? ?????????????? ???? ???????? ???????????? ???????? ?????????? ????????????. ?????? ???? ?????? ?????????? ?????? ???? ???????? ???? ????????????. ???????? ???????? ???? ?????? ???? ?????????? ???????? ???????????? ?????? ???? ???????? ?????????????? ?????????? ???? ???? ??????" +
                        "?????? ???????????????? ??????????????" +
                        "???? ???????? ?????????????? ?????? ?????????? ??????????????. ?????????? ?????????? ???????????? ?????????? ???? ???????????? ???? ???????????????? ???? ???????????????? ???? ?????????????? ?????? ???????????? ???????? ???????????? ???? ?????????? ???? ???????? ????????????. ???????????? ?????????? ?????????? ???????????? ?????????? ???????? ???????????? ??????????. ???????? ?????? ?????? ???????? ???????? ???????????????????? ???????? ?????? ?????????????? ???? ???????? ??????????????" +
                        "?????????? ???????????? ???????????????? ???????????? ?????????? ??????????" +
                        "???????????? ???? ?????????? ?????????? ?????? ?????????????? ?????????? ???? ?????????????? ?????? ?????????? ???????????? ????????????. ?????????????? ???? ?????????? ?????????? ???????? ???? ?????????? ?????? ?????????? ???????? ???? ?????????????? ???? ???????? ???? ???????????? ?????? ??????????????????." +
                        "???????????????? ???????? ??????????????" +
                        "???????? ?????????????? ?????????????? ?????????????? ?????????????? ???????? ?????????????? ???????????????? ???? ???????????? ????????????????. ???????? ?????? ?????????? ???????????? ?????????? ?????????????? ?????? ?????????? ???? ???? ???????? ???? ???????? ?????????????? ?????? ???????? ?????????? ???? ?????????? ???? ?????????? ???? ?????????? ???????????? ???? ?????????? ???? ?????????? ???? ?????????? ???? ?????????? ?????????????? ?????????? ???? ?????????????? ???? ?????????? ???????????? ???? ???????????????????? ???? ???????????????? ???? ???????????????? ???? ???????? ???????????????? ???? ???? ?????? ???????? ???????????? ???????? ?????????????? ?????????????? ?????????? ???????????????? ???????? ??????????????." +
                        "???????????????? ???????????? ????????????" +
                        "?????? ?????? ?????? ???????????? ?????????? ???????????????? ?????????????? ???????????? ?????????????? ???? ?????????????? ?????????????? ?????????????????? ?????????????????????? ?????????????????????? ?????????????????? ???????? ???????? ?????????? ???????? ?????????????? ???????????????? ???????????????? ???? ?????????????? ?????????????????? ???? ?????? ?????????????? ?????????????? ??????." +
                        "???????????????? ???????????? ??????????????",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              ],
            ),
          )
        : navigatProv.infoLoading
            ? Center(
                child: Container(
                    alignment: Alignment.center,
                    width: 50,
                    height: 50,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).accentColor,
                      ),
                    )),
              )
            : BlocConsumer<SubmitBloc, SubmitBlocState>(listener: (c, s) async {
                if (s is SubmitBlocLoaded) {
                  if (s.status == 0) {
                    AlertDilogg.showM(
                        title: "??????",
                        msg: "?????? ?????????? ????????????",
                        icon: Icon(FontAwesomeIcons.timesCircle),
                        context: context);
                  } else if (s.status == 3) {
                    AlertDilogg.showM(
                        title: "??????",
                        msg: "?????? ?????????? ??????????????",
                        icon: Icon(FontAwesomeIcons.timesCircle),
                        context: context);
                  } else if (s.status == 1) {
                    id = s.id;
                    setState(() {
                      title = "???????? ?????????????? ?????? ??????????????";
                    });
                    // await AlertDilogg.showM(
                    //     title: "????????",
                    //     msg: "???? ?????????? ????????????",
                    //     icon: Icon(
                    //       FontAwesomeIcons.checkCircle,
                    //       color: Colors.green,
                    //     ),
                    //     context: context);
                    pageController.animateToPage(page < 5 ? page + 1 : 0,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.fastOutSlowIn);
                  } else if (s.status == 2) {
                    setState(() {
                      title = "";
                    });
                    await AlertDilogg.showM(
                        title: "????????",
                        msg: "???? ?????????? ??????????????",
                        icon: Icon(
                          FontAwesomeIcons.checkCircle,
                          color: Colors.green,
                        ),
                        context: context);

                    pageController.animateToPage(5,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.fastOutSlowIn);
                  }
                } else if (s is SubmitBlocError) {
                  AlertDilogg.showM(
                      title: "??????",
                      msg: " ???????? ???? ??????????????",
                      icon: Icon(FontAwesomeIcons.timesCircle),
                      context: context);
                }
              }, builder: (context, s) {
                return LoadingOverlay(
                  isLoading: s is SubmitBlocLoding,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            title,
                            style:
                                Theme.of(context).textTheme.headline2!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Expanded(
                        child: PageView.builder(
                            physics: new NeverScrollableScrollPhysics(),
                            controller: pageController,
                            itemCount: 6,
                            itemBuilder: (c, i) {
                              return Container(
                                child: i == 0
                                    ? pageFirst(i, context)
                                    : i == 1
                                        ? pageSecond(i, context, navigatProv)
                                        : i == 2
                                            ? pageThird(i, context, navigatProv)
                                            : i == 3
                                                ? pageFour(
                                                    i, context, navigatProv)
                                                : i == 4
                                                    ? pageFive(i, context)
                                                    : pageEnd(i, context,
                                                        navigatProv),
                              );
                            }),
                      ),
                    ],
                  ),
                );
              });
  }

  Form pageFirst(int i, BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 11,
                child: Card(
                  margin: EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text("?????? ????????????????",
                                style: Theme.of(context).textTheme.subtitle1),
                          ),
                          subtitle: TxFild(
                            title: "?????????? ????????????",
                            type: "name",
                            msg: ["?????????? ?????????? ", "?????????? ????????????"],
                            tcontroller: nameController,
                            bkColor: Colors.transparent,
                            border_color:
                                Theme.of(context).textTheme.bodyText1!.color,
                            lineType: false,
                            radius: 5,
                            readonly: false,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text("?????? ????????????",
                                style: Theme.of(context).textTheme.subtitle1),
                          ),
                          subtitle: TxFild(
                            title: "?????? ????????????",
                            type: "phone",
                            msg: ["?????? ???????????? ?????????? ", " ???????? ?????? ????????"],
                            tcontroller: phoneController,
                            bkColor: Colors.transparent,
                            border_color:
                                Theme.of(context).textTheme.bodyText1!.color,
                            lineType: false,
                            radius: 5,
                            readonly: false,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text("???????????? ????????????????????",
                                style: Theme.of(context).textTheme.subtitle1),
                          ),
                          subtitle: TxFild(
                            title: "???????????? ????????????????????",
                            type: "email",
                            msg: [
                              "???????????? ???????????????????? ?????????? ",
                              "???????????? ?????? ????????"
                            ],
                            tcontroller: emailController,
                            bkColor: Colors.transparent,
                            border_color:
                                Theme.of(context).textTheme.bodyText1!.color,
                            lineType: false,
                            radius: 5,
                            readonly: false,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text("???????? ??????????",
                                style: Theme.of(context).textTheme.subtitle1),
                          ),
                          subtitle: TxFild(
                            title: "???????? ??????????",
                            type: "name",
                            msg: [" ???????? ?????????? ?????????? ", "???????? ?????????? ?????? ????????"],
                            tcontroller: workplaceController,
                            bkColor: Colors.transparent,
                            border_color:
                                Theme.of(context).textTheme.bodyText1!.color,
                            lineType: false,
                            radius: 5,
                            readonly: false,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text("??????????",
                                style: Theme.of(context).textTheme.subtitle1),
                          ),
                          subtitle: TxFild(
                            title: "??????????",
                            type: "number",
                            msg: ["  ?????????? ?????????? ", " ?????????? ?????? ????????"],
                            tcontroller: ageController,
                            bkColor: Colors.transparent,
                            border_color:
                                Theme.of(context).textTheme.bodyText1!.color,
                            lineType: false,
                            radius: 5,
                            readonly: false,
                          ),
                        )
                      ],
                    ),
                  ),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                primary: Theme.of(context).accentColor),
                            onPressed: null,
                            child: Text("????????????")),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                primary: Theme.of(context).accentColor),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                pageController.animateToPage(
                                    page < 5 ? page + 1 : 0,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.fastOutSlowIn);
                              }
                            },
                            child: Text(" ????????????")),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                )),
          ],
        ));
  }

  Widget pageSecond(int i, BuildContext context, NavigateProv nav) {
    final _formKey = GlobalKey<FormState>();
    return nav.infoModel == null || nav.infoModel?.reportTypes == null
        ? reload(nav)
        : Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    flex: 11,
                    child: Card(
                      margin: EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            ListTile(
                              title: Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text("????????????",
                                    style:
                                        Theme.of(context).textTheme.subtitle1),
                              ),
                              subtitle: TxFild(
                                title: "????????????",
                                type: "name",
                                msg: ["???????????? ?????????? ", "???????????? ????????????"],
                                tcontroller: jopController,
                                bkColor: Colors.transparent,
                                border_color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                                lineType: false,
                                radius: 5,
                                readonly: false,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ListTile(
                              title: Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text("????????????????",
                                    style:
                                        Theme.of(context).textTheme.subtitle1),
                              ),
                              subtitle: TxFild(
                                title: "????????????????",
                                type: "name",
                                msg: [" ???????????????? ?????????? ", " ???????? ?????? ????????"],
                                tcontroller: spacialController,
                                bkColor: Colors.transparent,
                                border_color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                                lineType: false,
                                radius: 5,
                                readonly: false,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ListTile(
                              title: Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text("?????? ????????????",
                                    style:
                                        Theme.of(context).textTheme.subtitle1),
                              ),
                              subtitle: DropField(
                                enable: true,
                                type: "",
                                onChange: (query) {
                                  print(query);
                                  try {
                                    type = query;
                                  } catch (e) {
                                    type = "0";
                                  }
                                },
                                msg: ["???????? ?????? ????????????", "please write think "],
                                bkColor: Theme.of(context).cardColor,
                                border_color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                                lineType: false,
                                radius: 3,
                                readonly: false,
                                data: nav.orderType,
                                hint: "?????? ????????????",
                                value: type,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ListTile(
                              title: Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text("?????????? ?????????????? ???? ????????????????",
                                    style:
                                        Theme.of(context).textTheme.subtitle1),
                              ),
                              subtitle: TxFild(
                                title: "yy -mm - dd",
                                type: "name",
                                msg: [
                                  "  ?????????????? ?????????? ",
                                  "???????? ?????????? ?????? ????????"
                                ],
                                tcontroller: dateController,
                                bkColor: Colors.transparent,
                                border_color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                                lineType: false,
                                radius: 5,
                                readonly: true,
                                onClick: () =>
                                    _selectsData(context, dateController),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ListTile(
                              title: Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text("???????? ???????????? ???? ????????????????",
                                    style:
                                        Theme.of(context).textTheme.subtitle1),
                              ),
                              subtitle: TxFild(
                                title: "???????? ???????????? ???? ????????????????",
                                type: "name",
                                msg: ["  ???????????? ?????????? ", " ?????????? ?????? ????????"],
                                tcontroller: placeeOfaccedentController,
                                bkColor: Colors.transparent,
                                border_color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                                lineType: false,
                                radius: 5,
                                readonly: false,
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    primary: Theme.of(context).accentColor),
                                onPressed: () {
                                  pageController.animateToPage(
                                      page > 0 ? page - 1 : 0,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.fastOutSlowIn);
                                },
                                child: Text("????????????")),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    primary: Theme.of(context).accentColor),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    pageController.animateToPage(
                                        page < 5 ? page + 1 : 0,
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.fastOutSlowIn);
                                  }
                                },
                                child: Text(" ????????????")),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    )),
              ],
            ));
  }

  Center reload(NavigateProv nav) => Center(
        child: InkWell(
          onTap: () => nav.getInfo(),
          child: Text("?????? ???????? ???? ??????????????  \n ?????? ????????????????",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1),
        ),
      );

  Widget pageThird(int i, BuildContext context, NavigateProv nav) {
    final _formKey = GlobalKey<FormState>();
    return nav.infoModel == null || nav.infoModel?.nationalism == null
        ? reload(nav)
        : Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    flex: 11,
                    child: Card(
                      margin: EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            ListTile(
                              title: Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text("???????????? ??????????????",
                                    style:
                                        Theme.of(context).textTheme.subtitle1),
                              ),
                              subtitle: DropField(
                                enable: true,
                                type: "",
                                onChange: (query) {
                                  print(query);
                                  selected_marige = query;
                                },
                                msg: [
                                  "????????  ???????????? ??????????????",
                                  "please write think "
                                ],
                                bkColor: Theme.of(context).cardColor,
                                border_color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                                lineType: false,
                                radius: 3,
                                readonly: false,
                                data: nav.infoModel!.status,
                                hint: "???????????? ?????????????? ",
                                value: selected_marige,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ListTile(
                              title: Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text("??????????????",
                                    style:
                                        Theme.of(context).textTheme.subtitle1),
                              ),
                              subtitle: DropField(
                                enable: true,
                                type: "",
                                onChange: (query) {
                                  select_eligion = query;
                                },
                                msg: ["???????? ??????????????", "please write think "],
                                bkColor: Theme.of(context).cardColor,
                                border_color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                                lineType: false,
                                radius: 3,
                                readonly: false,
                                data: nav.infoModel!.religion,
                                hint: "??????????????",
                                value: select_eligion,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ListTile(
                              title: Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text("??????????????",
                                    style:
                                        Theme.of(context).textTheme.subtitle1),
                              ),
                              subtitle: DropField(
                                enable: true,
                                type: "",
                                onChange: (query) {
                                  print(query);
                                  selected_national = query;
                                },
                                msg: ["????????  ??????????????", "please write think "],
                                bkColor: Theme.of(context).cardColor,
                                border_color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                                lineType: false,
                                radius: 3,
                                readonly: false,
                                data: nav.infoModel!.nationalism,
                                hint: "??????????????",
                                value: selected_national,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ListTile(
                              title: Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text("??????????????",
                                    style:
                                        Theme.of(context).textTheme.subtitle1),
                              ),
                              subtitle: DropField(
                                enable: true,
                                type: "",
                                onChange: (query) {
                                  print(query);
                                  selected_civil = query;
                                },
                                msg: ["????????  ??????????????", "please write think "],
                                bkColor: Theme.of(context).cardColor,
                                border_color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                                lineType: false,
                                radius: 3,
                                readonly: false,
                                data: nav.infoModel!.nationality,
                                hint: "??????????????",
                                value: selected_civil,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ListTile(
                              subtitle: TxFild(
                                title: "???? ????????????",
                                type: "name",
                                msg: ["????????  ?????????? ", "?????????? ????????????"],
                                tcontroller: textController,
                                bkColor: Colors.transparent,
                                border_color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                                lineType: false,
                                radius: 5,
                                maxline: 5,
                                readonly: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    primary: Theme.of(context).accentColor),
                                onPressed: () {
                                  pageController.animateToPage(
                                      page > 0 ? page - 1 : 0,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.fastOutSlowIn);
                                },
                                child: Text("????????????")),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    primary: Theme.of(context).accentColor),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    var reporttype = "0";
                                    reporttype = nav.infoModel!.reportTypes!
                                        .where((w) => w.title == type)
                                        .first
                                        .id
                                        .toString();
                                    var report = ReportSubmitModel(
                                        name: nameController.text,
                                        phone: phoneController.text,
                                        email: emailController.text,
                                        workAddress: workplaceController.text,
                                        age: ageController.text,
                                        occupation: jopController.text,
                                        specialization: spacialController.text,
                                        reportType: reporttype,
                                        addressAssault:
                                            placeeOfaccedentController.text,
                                        maritalStatus: selected_marige,
                                        religion: select_eligion,
                                        nationalism: selected_national,
                                        nationality: selected_civil,
                                        url: "http//:",
                                        dateAssault: dateController.text,
                                        description: textController.text);
                                    BlocProvider.of<SubmitBloc>(context).add(
                                        Submiteport(report: report.toJson()));
                                    // pageController.animateToPage(
                                    //     page < 5 ? page + 1 : 0,
                                    //     duration: Duration(milliseconds: 500),
                                    //     curve: Curves.fastOutSlowIn);
                                  }
                                },
                                child: Text(" ??????????")),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    )),
              ],
            ));
  }

  Form pageFour(int i, BuildContext context, NavigateProv nav) {
    final _formKey = GlobalKey<FormState>();
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 11,
                child: Card(
                    margin: EdgeInsets.all(10),
                    child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: ListView.builder(
                            itemCount: nav.infoModel!.questions!.length,
                            itemBuilder: (c, i) {
                              return ListTile(
                                  title: Text(nav
                                      .infoModel!.questions![i].title!
                                      .toString()),
                                  subtitle: Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Theme.of(context)
                                                    .scaffoldBackgroundColor))),
                                    child: Row(children: [
                                      Expanded(
                                        child: RadioListTile(
                                            title: Text("??????"),
                                            value: 1,
                                            // selected: nav.infoModel!
                                            //             .questions![i].notes !=
                                            //         null
                                            //     ? (nav.infoModel!.questions![i]
                                            //             .notes ==
                                            //         1)
                                            //     : false,
                                            groupValue: nav.infoModel!
                                                .questions![i].notes!,
                                            onChanged: (a) {
                                              nav.infoModel!.questions![i]
                                                  .notes = a;
                                              nav.notifyListeners();
                                            }),
                                      ),
                                      Expanded(
                                        child: RadioListTile(
                                            title: Text("??????"),
                                            // selected: nav.infoModel!
                                            //             .questions![i].notes !=
                                            //         null
                                            //     ? (nav.infoModel!.questions![i]
                                            //             .notes ==
                                            //         1)
                                            //     : true,
                                            value: 0,
                                            groupValue: nav
                                                .infoModel!.questions![i].notes,
                                            onChanged: (a) {
                                              nav.infoModel!.questions![i]
                                                  .notes = a;
                                              nav.notifyListeners();
                                            }),
                                      )
                                    ]),
                                  ));
                            })
                        // ListTile(
                        //     title: Text(
                        //         "???? ???????? ???????????????? ???????????? ???????????? ?????? ?????????? ???????????? ?????????????? ?????????????? ???????????? (?????????? ???????? ???? ????) ?????? ???????? ?????????????? (????) ???????? ???????? ?????????? ???????????? ?????? ?????????? ???????????? ???????? ????????????."),
                        //     subtitle: Row(children: [
                        //       Expanded(
                        //         child: RadioListTile(
                        //             title: Text("??????"),
                        //             value: 1,
                        //             //selected: r1,
                        //             groupValue: r2,
                        //             onChanged: (a) {
                        //               print(a);
                        //               setState(() {
                        //                 r2 = 1;
                        //               });
                        //             }),
                        //       ),
                        //       Expanded(
                        //         child: RadioListTile(
                        //             title: Text("??????"),
                        //             // selected: !r1,
                        //             value: 0,
                        //             groupValue: r2,
                        //             onChanged: (a) {
                        //               setState(() {
                        //                 r2 = 0;
                        //               });
                        //             }),
                        //       )
                        //     ])),
                        // Divider(),
                        // ListTile(
                        //   title: Text(
                        //       "???? ???????? ???????????????? ?????????????? ?????? ???????????? ???? ???????? ?????????? ???????? ?????????? ?????? ???????? ?????????????? ??????"),
                        //   subtitle: Row(
                        //     children: [
                        //       Expanded(
                        //         child: RadioListTile(
                        //             title: Text("??????"),
                        //             value: 1,
                        //             //selected: r1,
                        //             groupValue: r3,
                        //             onChanged: (a) {
                        //               print(a);
                        //               setState(() {
                        //                 r3 = 1;
                        //               });
                        //             }),
                        //       ),
                        //       Expanded(
                        //         child: RadioListTile(
                        //             title: Text("??????"),
                        //             // selected: !r1,
                        //             value: 0,
                        //             groupValue: r3,
                        //             onChanged: (a) {
                        //               setState(() {
                        //                 r3 = 0;
                        //               });
                        //             }),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        // Divider(),
                        // ListTile(
                        //   title: Text(
                        //       "???? ???????? ???????????????? ???????????? ?????????? ?????? ???? ???????????? ???????? ???? ???????? ?????? ?????????? ?????????????? ?????? ???????? ?????????????? (??????) ???????? ?????????????? ???????? ???? ?????? ?????????? ????????????????."),
                        //   subtitle: Row(
                        //     children: [
                        //       Expanded(
                        //         child: RadioListTile(
                        //             title: Text("??????"),
                        //             value: 1,
                        //             //selected: r1,
                        //             groupValue: r4,
                        //             onChanged: (a) {
                        //               print(a);
                        //               setState(() {
                        //                 r4 = 1;
                        //               });
                        //             }),
                        //       ),
                        //       Expanded(
                        //         child: RadioListTile(
                        //             title: Text("??????"),
                        //             // selected: !r1,
                        //             value: 0,
                        //             groupValue: r4,
                        //             onChanged: (a) {
                        //               setState(() {
                        //                 r4 = 0;
                        //               });
                        //             }),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        // ])

                        ))),
            Expanded(
                flex: 1,
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      // Expanded(
                      //   child: ElevatedButton(
                      //       style: ElevatedButton.styleFrom(
                      //           shape: RoundedRectangleBorder(
                      //               borderRadius: BorderRadius.circular(10)),
                      //           primary: Theme.of(context).accentColor),
                      //       onPressed: () {
                      //         pageController.animateToPage(
                      //             page > 0 ? page - 1 : 0,
                      //             duration: Duration(milliseconds: 500),
                      //             curve: Curves.fastOutSlowIn);
                      //       },
                      //       child: Text("????????????")),
                      // ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                primary: Theme.of(context).accentColor),
                            onPressed: () {
                              if (_formKey.currentState!.validate() &&
                                  nav.infoModel!.questions!
                                          .where((w) => w.notes == -1)
                                          .toList()
                                          .length ==
                                      0) {
                                var question = '{"report_id": $id,';

                                nav.infoModel!.questions!.forEach((element) {
                                  question +=
                                      "\"${element.name}\":\"${element.notes}\",";
                                });
                                question =
                                    question.substring(0, question.length - 1);
                                question += "}";
                                var questjson = json.decode(question);

                                BlocProvider.of<SubmitBloc>(context)
                                    .add(SubmitQuestion(question: questjson));
                              } else {
                                AlertDilogg.showM(
                                    title: "??????????",
                                    msg: "?????? ?????????????? ?????? ???????? ??????????????",
                                    icon: Icon(FontAwesomeIcons.infoCircle),
                                    context: context);
                              }
                            },
                            child: Text("??????????")),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                )),
          ],
        ));
  }

  Form pageFive(int i, BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 11,
                child: Card(
                    margin: EdgeInsets.all(10),
                    child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: ListView(padding: EdgeInsets.zero, children: [
                          const SizedBox(
                            height: 10,
                          ),
                          ListTile(
                            title: Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Text(
                                  "?????????? ???? ?????? ???? ?????????? ?????????????????? ???? ?????????? ?????????? ???????? ?????????????? ???? ????????????????",
                                  style: Theme.of(context).textTheme.subtitle1),
                            ),
                            subtitle: Row(
                              children: [
                                ButtonOutline(
                                    width: 80,
                                    height: 30,
                                    title: " ?????????? ??????",
                                    onTapp: () {},
                                    color: Theme.of(context).accentColor),
                              ],
                            ),
                          ),
                        ])))),
            Expanded(
                flex: 1,
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                primary: Theme.of(context).accentColor),
                            onPressed: () {
                              pageController.animateToPage(
                                  page > 0 ? page - 1 : 0,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.fastOutSlowIn);
                            },
                            child: Text("????????????")),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                primary: Theme.of(context).accentColor),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                pageController.animateToPage(
                                    page < 6 ? page + 1 : 0,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.fastOutSlowIn);
                              }
                            },
                            child: Text(" ?????????? ????????????")),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                )),
          ],
        ));
  }

  Widget pageEnd(int i, BuildContext context, NavigateProv nav) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            flex: 11,
            child: Card(
                margin: EdgeInsets.all(10),
                child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ListTile(
                          title: Center(
                              child: Icon(
                            EvaIcons.checkmarkCircle,
                            color: Colors.green,
                            size: 70,
                          )),
                          subtitle: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "???? ?????????? ???????????? ??????????",
                              style: Theme.of(context).textTheme.subtitle1,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    )))),
        Expanded(
            flex: 1,
            child: Container(
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            primary: Theme.of(context).accentColor),
                        onPressed: () {
                          nav.infoModel!.questions!.forEach((element) {
                            element.notes = -1;
                          });
                          nameController.clear();
                          phoneController.clear();
                          emailController.clear();
                          workplaceController.clear();
                          ageController.clear();
                          jopController.clear();
                          spacialController.clear();

                          placeeOfaccedentController.clear();
                          selected_marige = null;
                          select_eligion = null;
                          selected_national = null;
                          selected_civil = null;

                          dateController.clear();
                          textController.clear();
                          setState(() {
                            title = "?????????? ????????";
                          });
                          pageController.animateToPage(0,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.fastOutSlowIn);
                        },
                        child: Text(" ??????????")),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            )),
      ],
    );
  }

  DateTime? seledate;

  Future<void> _selectsData(
      BuildContext context, TextEditingController txc) async {
    DateTime? picked = await showDatePicker(
      context: context,
      locale: const Locale("ar", "AR"),
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
                primary: Theme.of(context).accentColor,
                onPrimary: Colors.white,
                surface: Theme.of(context).primaryColor,
                onSurface: Theme.of(context).textTheme.subtitle1!.color!,
                onBackground: Colors.green),
            dialogBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        setState(() {
          txc.text = picked.toString().split(" ")[0];
        });

        seledate = picked;
      });
    }
  }
}
