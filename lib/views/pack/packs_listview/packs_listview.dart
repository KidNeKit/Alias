import 'package:alias/view_models/game_view_model.dart';
import 'package:alias/views/pack/packs_listview/pack_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_models/pack_view_model.dart';

class PacksListView extends StatefulWidget {
  const PacksListView({super.key});

  @override
  State<PacksListView> createState() => _PacksListViewState();
}

class _PacksListViewState extends State<PacksListView> {
  bool _isLoading = true;

  @override
  void initState() {
    Provider.of<PackViewModel>(context, listen: false)
        .loadPacks()
        .then((value) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PackViewModel>(builder: (context, value, child) {
      return Expanded(
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                itemCount: value.packs.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 5.0),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    value.setSelectedPack = value.packs[index];
                    Provider.of<GameViewModel>(context, listen: false).setPack =
                        value.packs[index];
                  },
                  child: PackItem(
                    packName: value.packs[index].name,
                    isSelected:
                        value.packs[index].name == value.selectedPack?.name,
                  ),
                ),
              ),
      );
    });
  }
}
