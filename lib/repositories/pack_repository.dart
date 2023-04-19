import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/pack.dart';

class PackRepository {
  static const Set<String> _packNames = {
    'first',
    'footballers',
  };

  Future<List<Pack>> getPacks() async {
    List<Pack> packs = [];
    for (var jsonPack in _packNames) {
      final String response =
          await rootBundle.loadString('assets/json_packs/$jsonPack.json');
      final data = await json.decode(response);
      Pack pack = Pack.fromJson(data);
      packs.add(pack);
    }
    return packs;
  }
}
