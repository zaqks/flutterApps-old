import 'package:car_app/colorConv.dart';
import 'package:car_app/db.dart';
import 'package:car_app/language.dart';
import 'package:flutter/material.dart';

class CalcPage extends StatefulWidget {
  CalcPage(
      {super.key,
      required this.cost,
      required this.currency,
      required this.price,
      required this.convPrice,
      required this.tvaC,
      required this.cfC});

  double cost = 0;
  String currency = "";
  double price = 0;
  double convPrice = 0;
  double tvaC = 0;
  double cfC = 0;

  @override
  State<CalcPage> createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {
  detailCard(String txt1, String txt2, String txt3) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(4.5),
        child: Container(
          padding: const EdgeInsets.all(9.0),
          width: double.infinity,
          height: 75.0,
          decoration: BoxDecoration(
              color: secondaryClr1,
              borderRadius: BorderRadius.circular(9.0),
              gradient:
                  LinearGradient(colors: [Colors.white70, Colors.white12])),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: TextStyle(color: textClr1, fontSize: 20),
                      children: [
                        TextSpan(text: "$txt1\n"),
                        TextSpan(
                            text: txt2, style: const TextStyle(fontSize: 25)),
                        TextSpan(
                            text: txt3, style: const TextStyle(fontSize: 20))
                      ])),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [bgClr1, bgClr2, bgClr3])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 75.0,
                ),
                SizedBox(
                  child: Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(9.0),
                          width: double.infinity,
                          //height: 170,
                          decoration: BoxDecoration(
                              color: secondaryClr1,
                              borderRadius: BorderRadius.circular(9.0),
                              gradient: LinearGradient(
                                  colors: [Colors.white70, Colors.white12])),
                          child: Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  translate("It will cost you"),
                                  style:
                                      TextStyle(fontSize: 40, color: textClr1),
                                ),
                                const SizedBox(
                                  height: 25.0,
                                ),
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                      text: "${widget.cost}",
                                      style: TextStyle(
                                          fontSize: 45.0,
                                          fontWeight: FontWeight.w500,
                                          foreground: Paint()
                                            ..shader = LinearGradient(colors: [
                                              secondaryClr2,
                                              secondaryClr3
                                            ]).createShader(Rect.fromLTWH(
                                                0, 0, 200, 100)))),
                                  TextSpan(
                                      text: "Da",
                                      style: TextStyle(
                                          fontSize: 35.0, color: secondaryClr3))
                                ])),
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 50.0,
                      ),
                      detailCard("${translate("Price in")} ${widget.currency}",
                          "${widget.price}", currencySign[widget.currency]),
                      detailCard("${translate("Price in")} Da",
                          "${widget.convPrice}", "Da"),
                      detailCard(
                          "${translate("TVA cost")}(${(vars["TVA"] * 100)}%)",
                          "${widget.tvaC}",
                          "Da"),
                      detailCard(
                          "${translate("Customs fees")}(${vars["CF"] * 100}%)",
                          "${widget.cfC}",
                          "Da"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 36,
                ),
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [secondaryClr2, secondaryClr3]),
                      borderRadius: BorderRadius.circular(9.0)),
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
                      },
                      child: Text(
                        translate("Okay"),
                        style: TextStyle(fontSize: 20.0, color: textClr1),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
