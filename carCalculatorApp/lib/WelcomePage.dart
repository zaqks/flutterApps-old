import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

import 'JsonHandler.dart';
import 'language.dart';
import 'main.dart';
import 'profileDb.dart';
import 'package:flutter/material.dart';

import 'colorConv.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({super.key});

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  createData() {
    //print("file created");

    File(filePath).create(recursive: true).then((value) {
      Map tmpData = {
        "userName": "",
        "history": {},
        "firstTime": true,
        "userLang": "EN"
      };
      writeToJson(tmpData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(gradient: LinearGradient(colors: [bgClr1, bgClr3])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              SizedBox(
                child: Text(
                  translate("Enable storage access"),
                  style: TextStyle(color: textClr1, fontSize: 25.0),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.0),
                    gradient:
                        LinearGradient(colors: [secondaryClr2, secondaryClr3])),
                width: double.infinity,
                height: 75,
                child: ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9)))),
                    onPressed: () async {
                      if (Platform.isAndroid) {
                        var stts = await Permission.storage.status;

                        if (stts.isGranted) {
                          createData();

                          Navigator.pop(context);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SafeArea(child: LanguagePage());
                          }));
                        }
                      } /*else {
                        createData();

                        Navigator.pop(context);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LanguagePage();
                        }));
                      }*/
                    },
                    child: Text(
                      translate("Next"),
                      style: TextStyle(fontSize: 20.0, color: textClr1),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  Map slctnState = {};

  langCard(String txt1) {
    String displayTxt = "";
    switch (txt1[0]) {
      case "F":
        displayTxt = "Français";
        break;
      case "E":
        displayTxt = "English";
        break;
      default:
        displayTxt = "عربي";
        break;
    }

    return Padding(
      padding: const EdgeInsets.all(4.5),
      child: Container(
        //padding: const EdgeInsets.all(9.0),
        width: double.infinity,
        height: 75.0,
        decoration: BoxDecoration(
            border: Border.all(
                color: slctnState[txt1] ? secondaryClr3 : Colors.transparent),
            color: secondaryClr1,
            borderRadius: BorderRadius.circular(9.0),
            gradient: LinearGradient(colors: [Colors.white70, Colors.white12])),
        child: ElevatedButton(
          onPressed: () {
            ////
            ////
            userLang = txt1;

            for (String i in slctnState.keys) {
              slctnState[i] = false;
            }
            slctnState[userLang] = true;

            userMp["userLang"] = userLang;
            writeToJson(userMp);

            setState(() {});

            //print(slctnState);

            ////
          },
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9.0))),
              elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(Colors.transparent)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                displayTxt,
                style: TextStyle(color: textClr1, fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    for (String i in ["AR", "FR", "EN"]) {
      slctnState[i] = false;
    }
    slctnState[userLang] = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration:
            BoxDecoration(gradient: LinearGradient(colors: [bgClr1, bgClr3])),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Column(
                children: [
                  Text(
                    translate("Select your language"),
                    style: TextStyle(color: textClr1, fontSize: 30),
                  ),
                  SizedBox(
                    height: 75,
                  ),
                  langCard("FR"),
                  langCard("AR"),
                  langCard("EN"),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.0),
                    gradient:
                        LinearGradient(colors: [secondaryClr2, secondaryClr3])),
                width: double.infinity,
                height: 75,
                child: ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9)))),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SafeArea(child: WelcomeSeq());
                      }));
                    },
                    child: Text(
                      translate("Next"),
                      style: TextStyle(fontSize: 20.0, color: textClr1),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class WelcomeSeq extends StatefulWidget {
  const WelcomeSeq({super.key});

  @override
  State<WelcomeSeq> createState() => _WelcomeSeqState();
}

class _WelcomeSeqState extends State<WelcomeSeq> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration:
            BoxDecoration(gradient: LinearGradient(colors: [bgClr1, bgClr3])),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Text(
                translate("Welcome..."),
                style: TextStyle(color: textClr1, fontSize: 50),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.0),
                    gradient:
                        LinearGradient(colors: [secondaryClr2, secondaryClr3])),
                width: double.infinity,
                height: 75,
                child: ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9)))),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SafeArea(child: NamePage());
                      }));
                    },
                    child: Text(
                      translate("Start"),
                      style: TextStyle(fontSize: 20.0, color: textClr1),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NamePage extends StatefulWidget {
  const NamePage({super.key});

  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  TextEditingController nameCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width;
    return Container(
      decoration:
          BoxDecoration(gradient: LinearGradient(colors: [bgClr1, bgClr3])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Container(
                height: ((x - 53) / 3) * 1.5,
                width: double.infinity,
                padding: const EdgeInsets.all(18.0),
                decoration: BoxDecoration(
                  color: secondaryClr1,
                  borderRadius: BorderRadius.circular(9.0),
                  gradient:
                      LinearGradient(colors: [Colors.white70, Colors.white10]),
                  //border: Border.all(color: secondaryClr1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      translate("Enter your name"),
                      style: TextStyle(
                          fontSize: ((x - 53) / 15) * 1.25, color: textClr1),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: secondaryClr3),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(9.0)),
                      width: double.infinity,
                      //height: ((x - 53) / 9) * 1.5,
                      child: TextField(
                        maxLength: 12,
                        cursorColor: textClr1,
                        controller: nameCtrl,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(9),
                          counterStyle: TextStyle(color: secondaryClr3),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                            fontSize: ((x - 53) / 15) * 1.5, color: textClr1),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.0),
                    gradient:
                        LinearGradient(colors: [secondaryClr2, secondaryClr3])),
                width: double.infinity,
                height: 75,
                child: ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9)))),
                    onPressed: () {
                      if (nameCtrl.text.length >= 3) {
                        userName = nameCtrl.text;
                        firstTime = false;

                        userMp["firstTime"] = firstTime;
                        userMp["userName"] = userName;
                        writeToJson(userMp);

                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => NrmlSeq())));
                      }
                    },
                    child: Text(
                      translate("Finish"),
                      style: TextStyle(fontSize: 20.0, color: textClr1),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
