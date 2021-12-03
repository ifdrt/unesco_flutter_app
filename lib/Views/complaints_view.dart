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

  String title = "تقديم شكوى";
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
                    " ومع بعضهم، كما تحكم علاقتهم بالدولة والالتزامات التي تقع على كاهل الدولة نحوهم." +
                        "يُلزم قانون حقوق الإنسان الحكومات بالقيام بتصرفات محددة، ويمنعها من القيام بتصرفات أخرى. وثمة مسؤوليات على الأفراد أيضاً: فمن خلال استخدامهم لحقوقهم الإنسانية، يجب عليهم أن يحترموا حقوق الآخرين. ولا يحق لأي حكومة أو جماعة أو فرد القيام بأي شيء ينتهك حقوق الآخرين" +
                        "عالمية الحقوق وعدم قابليتها للتصرف" +
                        "إن حقوق الإنسان هي حقوق عالمية وغير قابلة للتصرف. فهي حق لكل الناس وفي كل مكان في العالم. وليس بوسع أي أحد أن يتخلى عنها طوعاً، كما لا يمكن للأخرين سلبها من أي شخص" +
                        "عدم القابلية للتجزئة" +
                        "إن حقوق الإنسان غير قابلة للتجزئة. وسواء أكانت حقوقاً مدنية أو سياسية أو اقتصادية أو اجتماعية أو ثقافية، فهي جميعاً حقوق متأصلة في كرامة كل كائن إنساني. وتبعاً لذلك، فإنها جميعاً تتمتع بوضع متساوٍ كحقوق. وليس ثمة شيء يدعى حقاً ’صغيراً‘، وليس ثمة تراتبية في حقوق الإنسان" +
                        "ترابط الحقوق وتشابكها وتعزيز بعضها بعضاً" +
                        "غالباً ما يعتمد إعمال أحد الحقوق، كلياً أو جزئياً، على إعمال الحقوق الأخرى. فمثلاً، قد يعتمد إعمال الحق في الصحة على إعمال الحق في التعليم أو الحق في الوصول إلى المعلومات." +
                        "المساواة وعدم التمييز" +
                        "جميع الأفراد متساوون ككائنات إنسانية بحكم الكرامة المتأصلة في الكائن الإنساني. ويحق لكل الناس التمتع بحقوق الإنسان دون تمييز من أي نوع، من قبيل التمييز على أساس العرق أو اللون أو الجنس أو الأصل الإثني أو العمر أو اللغة أو الدين أو الرأي السياسي وغيره من الآراء، أو الأصل الوطني أو الاجتماعي، أو الإعاقة، أو الملكية، أو مكان الولادة، أو أي وضع آخر، وحسبما توضح الهيئات المنشأة بموجب اتفاقيات حقوق الإنسان." +
                        "المشاركة وإشمال الجميع" +
                        "يحق لكل شخص ولجميع الناس المشاركة الفاعلة والحرة والجدية في التنمية المدنية والسياسية والاقتصادية والاجتماعية والثقافية التي يمكن إعمال حقوق الإنسان والحريات الأساسية من خلالها، والمساهمة في هذه التنمية والتمتع بها." +
                        "المساءلة وسيادة القانون",
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
                        title: "فشل",
                        msg: "فشل ارسال الشكوى",
                        icon: Icon(FontAwesomeIcons.timesCircle),
                        context: context);
                  } else if (s.status == 3) {
                    AlertDilogg.showM(
                        title: "فشل",
                        msg: "فشل ارسال الاسئلة",
                        icon: Icon(FontAwesomeIcons.timesCircle),
                        context: context);
                  } else if (s.status == 1) {
                    id = s.id;
                    setState(() {
                      title = "يرجى الاجابة على الاسئلة";
                    });
                    // await AlertDilogg.showM(
                    //     title: "نجاح",
                    //     msg: "تم ارسال الشكوى",
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
                        title: "نجاح",
                        msg: "تم ارسال الاسئلة",
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
                      title: "فشل",
                      msg: " خطاء في الاتصال",
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
                            child: Text("اسم المشتكية",
                                style: Theme.of(context).textTheme.subtitle1),
                          ),
                          subtitle: TxFild(
                            title: "الاسم الكامل",
                            type: "name",
                            msg: ["الاسم مطلوب ", "الاسم الكامل"],
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
                            child: Text("رقم الهاتف",
                                style: Theme.of(context).textTheme.subtitle1),
                          ),
                          subtitle: TxFild(
                            title: "رقم الهاتف",
                            type: "phone",
                            msg: ["رقم الهاتف مطلوب ", " ادخل رقم صحيح"],
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
                            child: Text("البريد الالكتروني",
                                style: Theme.of(context).textTheme.subtitle1),
                          ),
                          subtitle: TxFild(
                            title: "البريد الالكتروني",
                            type: "email",
                            msg: [
                              "البريد الالكتروني مطلوب ",
                              "البريد غير صحيح"
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
                            child: Text("مكان العمل",
                                style: Theme.of(context).textTheme.subtitle1),
                          ),
                          subtitle: TxFild(
                            title: "مكان العمل",
                            type: "name",
                            msg: [" مكان العمل مطلوب ", "مكان العمل غير صحيح"],
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
                            child: Text("العمر",
                                style: Theme.of(context).textTheme.subtitle1),
                          ),
                          subtitle: TxFild(
                            title: "العمر",
                            type: "number",
                            msg: ["  العمر مطلوب ", " العمر غير صحيح"],
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
                            child: Text("السابق")),
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
                            child: Text(" التالي")),
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
                                child: Text("المهنة",
                                    style:
                                        Theme.of(context).textTheme.subtitle1),
                              ),
                              subtitle: TxFild(
                                title: "المهنة",
                                type: "name",
                                msg: ["المهنة مطلوب ", "المهنة الكامل"],
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
                                child: Text("الاختصاص",
                                    style:
                                        Theme.of(context).textTheme.subtitle1),
                              ),
                              subtitle: TxFild(
                                title: "الاختصاص",
                                type: "name",
                                msg: [" الاختصاص مطلوب ", " ادخل رقم صحيح"],
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
                                child: Text("نوع الشكوى",
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
                                msg: ["اختر نوع الشكوى", "please write think "],
                                bkColor: Theme.of(context).cardColor,
                                border_color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                                lineType: false,
                                radius: 3,
                                readonly: false,
                                data: nav.orderType,
                                hint: "نوع الشكوى",
                                value: type,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ListTile(
                              title: Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text("تاريخ الحادثة او الاعتداء",
                                    style:
                                        Theme.of(context).textTheme.subtitle1),
                              ),
                              subtitle: TxFild(
                                title: "yy -mm - dd",
                                type: "name",
                                msg: [
                                  "  التاريخ مطلوب ",
                                  "مكان العمل غير صحيح"
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
                                child: Text("مكان الحادث او الاعتداء",
                                    style:
                                        Theme.of(context).textTheme.subtitle1),
                              ),
                              subtitle: TxFild(
                                title: "مكان الحادث او الاعتداء",
                                type: "name",
                                msg: ["  المكان مطلوب ", " العمر غير صحيح"],
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
                                child: Text("السابق")),
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
                                child: Text(" التالي")),
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
          child: Text("حدث خطاء في الاتصال  \n اعد المحاولة",
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
                                child: Text("الحالة الزوجية",
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
                                  "اختر  الحالة الزوجية",
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
                                hint: "الحالة الزوجية ",
                                value: selected_marige,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ListTile(
                              title: Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text("الديانة",
                                    style:
                                        Theme.of(context).textTheme.subtitle1),
                              ),
                              subtitle: DropField(
                                enable: true,
                                type: "",
                                onChange: (query) {
                                  select_eligion = query;
                                },
                                msg: ["اختر الديانة", "please write think "],
                                bkColor: Theme.of(context).cardColor,
                                border_color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                                lineType: false,
                                radius: 3,
                                readonly: false,
                                data: nav.infoModel!.religion,
                                hint: "الديانة",
                                value: select_eligion,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ListTile(
                              title: Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text("القومية",
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
                                msg: ["اختر  القومية", "please write think "],
                                bkColor: Theme.of(context).cardColor,
                                border_color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                                lineType: false,
                                radius: 3,
                                readonly: false,
                                data: nav.infoModel!.nationalism,
                                hint: "القومية",
                                value: selected_national,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ListTile(
                              title: Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text("الجنسية",
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
                                msg: ["اختر  الجنسية", "please write think "],
                                bkColor: Theme.of(context).cardColor,
                                border_color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                                lineType: false,
                                radius: 3,
                                readonly: false,
                                data: nav.infoModel!.nationality,
                                hint: "الجنسية",
                                value: selected_civil,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ListTile(
                              subtitle: TxFild(
                                title: "نص الشكوى",
                                type: "name",
                                msg: ["النص  مطلوب ", "الاسم الكامل"],
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
                                child: Text("السابق")),
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
                                child: Text(" ارسال")),
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
                                            title: Text("نعم"),
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
                                            title: Text("كلا"),
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
                        //         "هل ترغب المشتكية بتسجيل الشكوى ضمن دائرة الشرطة المعنية والقضاء المختص (تأكيد بنعم او لا) إذا كانت الإجابة (لا) يرجى بيان السبب ليتسنى لنا اتخاذ تدابير أخرى مناسبة."),
                        //     subtitle: Row(children: [
                        //       Expanded(
                        //         child: RadioListTile(
                        //             title: Text("نعم"),
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
                        //             title: Text("كلا"),
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
                        //       "هل ترغب المشتكية بالحصول على مساعدة من جهات أخرى؟ يرجى ذكرها اذا كانت الإجابة نعم"),
                        //   subtitle: Row(
                        //     children: [
                        //       Expanded(
                        //         child: RadioListTile(
                        //             title: Text("نعم"),
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
                        //             title: Text("كلا"),
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
                        //       "هل تقبل المشتكية بتقديم شهادة حية او مكتوبة فيما لو تبنت جهة دولية بلاغها؟ اذا كانت الإجابة (نعم) سيتم التواصل معكم من قبل الجهة المدافعة."),
                        //   subtitle: Row(
                        //     children: [
                        //       Expanded(
                        //         child: RadioListTile(
                        //             title: Text("نعم"),
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
                        //             title: Text("كلا"),
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
                      //       child: Text("السابق")),
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
                                    title: "تنبيه",
                                    msg: "يجب الاجابة على جميع الاسئلة",
                                    icon: Icon(FontAwesomeIcons.infoCircle),
                                    context: context);
                              }
                            },
                            child: Text("ارسال")),
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
                                  "وثائق او صور او روابط الكترونية او مقاطع فيديو توثق الحادثة او الاعتداء",
                                  style: Theme.of(context).textTheme.subtitle1),
                            ),
                            subtitle: Row(
                              children: [
                                ButtonOutline(
                                    width: 80,
                                    height: 30,
                                    title: " اضافة ملف",
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
                            child: Text("السابق")),
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
                            child: Text(" ارسال الشكوى")),
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
                              "تم تقديم الشكوى بنجاح",
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
                            title = "تقديم شكوى";
                          });
                          pageController.animateToPage(0,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.fastOutSlowIn);
                        },
                        child: Text(" انهاء")),
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
