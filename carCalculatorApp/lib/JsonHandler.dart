import 'dart:convert';
import 'dart:io';

String filePath = "";

Map readMpFromJson() {
  final File file = File(filePath);

  String strFile = file.readAsStringSync();
  Map jsonFile = jsonDecode(strFile);
  return jsonFile;
}

//update
writeToJson(Map jsMp) {
  final File file = File(filePath);

  file.writeAsStringSync(jsonEncode(jsMp));
}


//void main() {
  //read data
//  final File file = File(filePath);

  //String strFile = file.readAsStringSync();
  //Map jsonFile = jsonDecode(strFile);

  //print(jsonFile);
  //write data

  //jsonFile["nya"] = "bla";
  //file.writeAsStringSync(jsonEncode(jsonFile));
//}
