import 'package:car_app/CalcPage.dart';
import 'package:car_app/JsonHandler.dart';

import 'colorConv.dart';
import 'db.dart';
import 'language.dart';
import 'profileDb.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCurrency = "";
  Map slctdState = {};

  TextEditingController prcCtrl = TextEditingController();

  double inputPrice = 0;

  currencyCard(double d, String currency, String price) {
    return Container(
      height: d,
      width: d,
      decoration: BoxDecoration(
          color: secondaryClr1,
          borderRadius: BorderRadius.circular(9.0),
          gradient: LinearGradient(colors: [Colors.white70, Colors.white12])),
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    side: BorderSide(
                        color: (slctdState[currency]
                                ? secondaryClr3
                                : Colors.transparent
                            //secondaryClr1
                            )),
                    borderRadius: BorderRadius.circular(9.0))),
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.transparent)),
        onPressed: () {
          selectedCurrency = currency;
          for (String i in currencyP.keys) {
            slctdState[i] = false;
          }
          setState(() {
            slctdState[selectedCurrency] = true;
          });

          if (prcCtrl.text != "") {
            String tmp = prcCtrl.text;
            prcCtrl.text = "";

            for (String i in currencyP.keys) {
              if (tmp[tmp.length - 1] == currencySign[i]) {
                tmp = tmp.substring(0, tmp.length - 1);

                break;
              }
            }
            inputPrice = double.parse(tmp);
            prcCtrl.text = tmp + currencySign[currency];
          }
        },
        child: SizedBox(
          height: d,
          width: d,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(),
              Text(
                currency,
                style: TextStyle(
                    fontSize: d / 6,
                    fontWeight: FontWeight.w500,
                    color: textClr1),
              ),
              Text(
                "${price}Da",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: d / 8,
                    color: textClr1),
              ),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    for (var i in currencyP.keys) {
      slctdState[i] = false;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print(
    //    "${MediaQuery.of(context).size.width},${MediaQuery.of(context).size.height}");
    // 850 420
    double x = MediaQuery.of(context).size.width;

    ///currency state

    ///

    return Directionality(
      textDirection: userLang == "AR" ? TextDirection.rtl : TextDirection.ltr,
      child: Padding(
        padding: const EdgeInsets.only(right: 18.0, left: 18.0),
        child: Column(children: [
          Container(
              padding: const EdgeInsets.all(9.0),
              width: double.infinity,
              height: 170,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${translate("Welcome")}\n$userName,",
                    style: TextStyle(fontSize: 40, color: textClr1),
                  )
                ],
              )),
          const SizedBox(
            height: 48,
          ),
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
                  translate("Price"),
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
                    cursorColor: textClr1,
                    controller: prcCtrl,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    style: TextStyle(
                        fontSize: ((x - 53) / 15) * 2, color: textClr1),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          Container(
              width: double.infinity,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    for (String i in currencyP.keys)
                      currencyCard((x - 53) / 3, i, currencyP[i].toString()),
                  ])),
          const SizedBox(
            height: 24.0,
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
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9)))),
                onPressed: () {
                  if (selectedCurrency != "" &&
                      prcCtrl.text != "" &&
                      inputPrice != 0) {
                    double totalCost = 0;
                    double tvaCost = 0;
                    double cfCost = 0;
                    double convPrice = 0;

                    convPrice = inputPrice * currencyP[selectedCurrency];

                    tvaCost = convPrice * vars["TVA"];
                    cfCost = convPrice * vars["CF"];

                    totalCost = convPrice + tvaCost + cfCost;

                    if (history.length > 10) {
                      history.remove(history.keys.last);
                    }
                    //move right

                    Map newH = {};
                    newH[prcCtrl.text] = "${totalCost}Da";

                    for (String i in history.keys) {
                      newH[i] = history[i];
                    }

                    history = newH;

                    userMp["history"] = newH;
                    writeToJson(userMp);

                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) {
                      return CalcPage(
                        cost: totalCost,
                        currency: selectedCurrency,
                        price: inputPrice,
                        convPrice: convPrice,
                        tvaC: tvaCost,
                        cfC: cfCost,
                      );
                    })));
                  }
                },
                child: Text(
                  translate("Calculate"),
                  style: TextStyle(fontSize: 20.0, color: textClr1),
                )),
          )
        ]),
      ),
    );
  }
}
