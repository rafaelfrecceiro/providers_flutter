import 'package:flutter/material.dart';

class ProviderController extends ChangeNotifier {
  String name = 'Rafael F Santos';
  String imgAvatar =
      'https://store.playstation.com/store/api/chihiro/00_09_000/container/BR/en/99/UP0102-BLUS30855_00-AVARE6LEON000000/0/image?_version=00_09_000&platform=chihiro&bg_color=000000&opacity=100&w=720&h=720';
  String birthDate = '12/12/1986';

  void alterarDados() {
    name = 'Gabriel Schüller Santos';
    birthDate = '27/01/2017';
    notifyListeners();
  }

  void alterarNome() {
    name = 'Xablauzinnnn';
    notifyListeners();
  }
}
