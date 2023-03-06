import 'dart:io';

import 'package:car_app/JsonHandler.dart';
import 'package:car_app/WelcomePage.dart';
import 'package:car_app/profileDb.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'HistoryPage.dart';
//import 'ProfilePage.dart';
import 'package:flutter/material.dart';

import "colorConv.dart";
import "HomePage.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  requestPath() async {
    Directory osDir = await getApplicationDocumentsDirectory();
    filePath = "${osDir.path}/userData.json";
    //print(filePath);
  }

  permRequest() async {
    if (Platform.isAndroid) {
      await Permission.storage.request();
    }
  }

  @override
  void initState() {
    permRequest();
    requestPath();

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (File(filePath).existsSync()) {
      Map tmpMp = readMpFromJson();
      if (tmpMp.containsKey("firstTime")) {
        if (!tmpMp["firstTime"] && tmpMp["userName"].length >= 3) {
          firstTime = false;
          userMp = readMpFromJson();
        }
      }
    }
    return MaterialApp(
      home: Container(
        decoration:
            BoxDecoration(gradient: LinearGradient(colors: [bgClr1, bgClr3])),
        child: SafeArea(
          child: firstTime ? RequestPage() : NrmlSeq(),
        ),
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
    );
  }
}

class NrmlSeq extends StatefulWidget {
  const NrmlSeq({super.key});

  @override
  State<NrmlSeq> createState() => _NrmlSeqState();
}

class _NrmlSeqState extends State<NrmlSeq> {
  List<Widget> pages = [
    HomePage(), HistoryPage()
    //, ProfilePage()
  ];
  int navIndx = 0;

  List<BottomNavigationBarItem> navItms = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
    //BottomNavigationBarItem(icon: Icon(Icons.person), label: "Person"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(gradient: LinearGradient(colors: [bgClr1, bgClr3])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: SizedBox(
          height: 63,
          child: BottomNavigationBar(
            currentIndex: navIndx,
            type: BottomNavigationBarType.fixed,
            onTap: ((value) {
              setState(() {
                navIndx = value;
              });

              ;
            }),
            items: navItms,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            selectedIconTheme: IconThemeData(color: secondaryClr3, size: 30),
            unselectedIconTheme: IconThemeData(color: textClr1),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        body: SingleChildScrollView(
          child: pages[navIndx],
        ),
      ),
    );
  }
}
