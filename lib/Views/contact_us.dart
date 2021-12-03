import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unesco/Widget/textfield.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUs createState() => _ContactUs();
}

class _ContactUs extends State<ContactUs> {
  bool first = true;
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController subjectController = TextEditingController();

  TextEditingController descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (first) {
      print("23o993 ====continus");
      // if (BlocProvider.of<HomeBloc>(context).state is! HomeBlocLoaded) {

      // }

      first = false;
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              EvaIcons.pin,
              size: 30,
              color: Theme.of(context).accentColor,
            ),
            title: Text(
              "موقعنا",
              style: Theme.of(context).textTheme.headline2,
            ),
            subtitle: Text("العراق - بغداد - الجادرية - قرب تقطع الجامعة"),
          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.mobileAlt,
              size: 30,
              color: Theme.of(context).accentColor,
            ),
            title: Text(
              "تحدث معنا عبر الهاتف",
              style: Theme.of(context).textTheme.headline2,
            ),
            subtitle: Text("رقم الهاتف : 07719999248"),
          ),
          ListTile(
            leading: Icon(
              EvaIcons.email,
              size: 30,
              color: Theme.of(context).accentColor,
            ),
            title: Text(
              "البريد الالكتروني",
              style: Theme.of(context).textTheme.headline2,
            ),
            subtitle: Text("الدعم الفني : info@ifdrt.iq"),
          ),
          Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(
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
                    subtitle: TxFild(
                      title: "البريد الالكتروني",
                      type: "email",
                      msg: ["البريد الالكتروني مطلوب ", "البريد غير صحيح"],
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
                    subtitle: TxFild(
                      title: "الموضوع",
                      type: "name",
                      msg: ["الموضوع  مطلوب ", "مكان العمل غير صحيح"],
                      tcontroller: subjectController,
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
                    subtitle: TxFild(
                      title: "نص الرسالة",
                      type: "name",
                      msg: ["  نص الرسالة مطلوب ", " العمر غير صحيح"],
                      tcontroller: descController,
                      bkColor: Colors.transparent,
                      border_color:
                          Theme.of(context).textTheme.bodyText1!.color,
                      lineType: false,
                      radius: 5,
                      maxline: 5,
                      readonly: false,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            primary: Theme.of(context).accentColor),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        child: Text(" ارسال الرسالة")),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
