import 'package:flutter/cupertino.dart';

import '../models/pack.dart';
import '../repositories/pack_repository.dart';

class PackViewModel with ChangeNotifier {
  final PackRepository _packRepository = PackRepository();
  Pack? _selectedPack;
  List<Pack> packs = [];

  Future<void> loadPacks() async {
    packs.clear();
    _packRepository.loadPacks().then((value) {
      packs.addAll(value);
    });
  }

  Pack? get selectedPack => _selectedPack;
  set setSelectedPack(Pack pack) {
    _selectedPack = pack;
    notifyListeners();
  }

  void clearSelectedPack() {
    _selectedPack = null;
    notifyListeners();
  }
}