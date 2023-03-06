// "wor":{"EN":"yoo", "FR":"yoo"}
import 'package:car_app/profileDb.dart';

Map language = {
  "Start": {"FR": "Commencer", "AR": "البدأ"},
  "Welcome": {"FR": "Bienvenue", "AR": "مرحبا"},
  "Welcome...": {"FR": "Bienvenue...", "AR": "...مرحبا"},
  "Next": {"FR": "Suivant", "AR": "التالي"},
  "Finish": {"FR": "Finir", "AR": "انهاء"},
  "Calculate": {"FR": "Calculer", "AR": "حساب"},
  "Price": {"FR": "Prix", "AR": "السعر"},
  "Conversions\nHistory": {
    "FR": "Historique\nde calcul",
    "AR": "العمليات\nالسابقة"
  },
  "It will cost you": {"FR": "Ça va vous côuter", "AR": "القيمة الكلية"},
  "Price in": {"FR": "Prix en", "AR": "السعر ب"},
  "TVA cost": {"FR": "Côut TVA", "AR": "رسم القيمة المضافة"},
  "Customs fees": {"FR": "Frais de dédouanement", "AR": "الرسوم الجمركية"},
  "Okay": {"FR": "Ok", "AR": "حسنا"},
  "Select your language": {
    "FR": "Selectionnez votre langue",
    "AR": "اختر لغتك"
  },
  "Enter your name": {"FR": "Entrez votre nom", "AR": "ماهو اسمك"},
  "Enable storage access": {
    "FR": "Autorisez l'accès au stockage",
    "AR": "اسمح بتخزين البيانات"
  },
};

String translate(String wut) {
  String tmp = wut;
  if (userLang != "EN") {
    tmp = language[wut][userLang];
  }
  return tmp;
}
