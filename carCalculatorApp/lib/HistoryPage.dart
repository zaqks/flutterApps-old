import 'package:car_app/language.dart';

import 'colorConv.dart';
import 'profileDb.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  //
  //

  historyCard(String price, String cost) {
    return Padding(
      padding: const EdgeInsets.only(top: 9.0, bottom: 9.0),
      child: Container(
        height: (MediaQuery.of(context).size.width - 53) / 3,
        width: double.infinity,
        decoration: BoxDecoration(
            color: secondaryClr1,
            gradient: LinearGradient(colors: [Colors.white70, Colors.white10]),
            borderRadius: BorderRadius.circular(18.0)),
        padding: EdgeInsets.all(9.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              price,
              style: TextStyle(
                  color: textClr1, fontSize: price.length <= 9 ? 30 : 20),
            ),
            Icon(
              userLang == "AR"
                  ? Icons.keyboard_double_arrow_left_sharp
                  : Icons.arrow_right_alt,
              size: 40,
              color: secondaryClr3,
            ),
            Text(
              cost,
              style: TextStyle(
                  color: textClr1, fontSize: price.length <= 9 ? 30 : 20),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: userLang == "AR" ? TextDirection.rtl : TextDirection.ltr,
      child: Padding(
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
                    translate("Conversions\nHistory"),
                    style: TextStyle(fontSize: 40, color: textClr1),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            for (String i in history.keys) historyCard(i, history[i]),
          ],
        ),
      ),
    );
  }
}
