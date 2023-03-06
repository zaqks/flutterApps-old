import 'package:car_app/profileDb.dart';
import 'package:flutter/material.dart';

import 'colorConv.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18.0, left: 18.0),
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(9.0),
              width: double.infinity,
              height: 170,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My\nProfile",
                    style: TextStyle(fontSize: 40, color: textClr1),
                  ),
                ],
              )),
          Container(
            padding: EdgeInsets.all(25),
            height: 150,
            width: double.infinity,
            color: Colors.red,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.yellow, shape: BoxShape.circle),
                ),
                Text(userName)
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
          SizedBox(
            width: double.infinity,
            height: 75,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(secondaryClr1),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            side: BorderSide(color: textClr1),
                            borderRadius: BorderRadius.circular(9)))),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Change name",
                        style: TextStyle(fontSize: 20.0, color: textClr1),
                      ),
                    ],
                  ),
                )),
          ),
          SizedBox(
            height: 18,
          ),
          SizedBox(
            width: double.infinity,
            height: 75,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(secondaryClr1),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            side: BorderSide(color: textClr1),
                            borderRadius: BorderRadius.circular(9)))),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                      child: Text(
                        "Change Language",
                        style: TextStyle(fontSize: 20.0, color: textClr1),
                      ),
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: 18,
          ),
        ],
      ),
    );
  }
}
