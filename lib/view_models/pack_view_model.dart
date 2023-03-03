import 'package:flutter/material.dart';

import '../models/pack.dart';
import '../repositories/pack_repository.dart';

class PackViewModel with ChangeNotifier {
  final PackRepository _packRepository = PackRepository();
  List<Pack> packs = [];

  Future<List<Pack>> getPacks() async {
    return await _packRepository.getPacks();
  }
}
