import 'package:flutter/cupertino.dart';

import '../models/pack.dart';
import '../repositories/pack_repository.dart';

class PackViewModel with ChangeNotifier {
  final PackRepository _packRepository = PackRepository();
  List<Pack> packs = [];

  Future<void> loadPacks() async {
    packs.clear();
    await _packRepository.loadPacks().then((value) {
      packs.addAll(value);
    });
  }
}
