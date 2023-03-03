import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_models/game_settings_view_model.dart';
import '../../../view_models/pack_view_model.dart';
import '../../global_components/text/custom_titles.dart';

class PacksListView extends StatelessWidget {
  const PacksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: Provider.of<PackViewModel>(context).getPacks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: CustomMediumTitle(text: 'There is no data'),
            );
          }
          return ListView.separated(
            itemCount: snapshot.data!.length,
            separatorBuilder: (context, index) => const SizedBox(height: 5.0),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Provider.of<GameSettingsViewModel>(context, listen: false)
                    .setPack = snapshot.data![index];
              },
              child: PackItem(
                packName: snapshot.data![index].name,
                isSelected: snapshot.data![index].name ==
                    Provider.of<GameSettingsViewModel>(context)
                        .selectedPack
                        ?.name,
              ),
            ),
          );
        },
      ),
    );
  }
}

class PackItem extends StatelessWidget {
  final String _packName;
  final bool _isSelected;
  const PackItem(
      {required String packName, required bool isSelected, super.key})
      : _packName = packName,
        _isSelected = isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Theme.of(context).primaryColor,
        border: _isSelected
            ? Border.all(color: Theme.of(context).cardColor, width: 2.0)
            : null,
      ),
      child: Center(
        child: Text(
          _packName,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ),
    );
  }
}
