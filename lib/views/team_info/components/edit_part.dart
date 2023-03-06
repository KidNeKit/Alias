import 'package:alias/views/global_components/text/custom_titles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_models/teams_view_model.dart';

class EditPart extends StatefulWidget {
  const EditPart({super.key});

  @override
  State<EditPart> createState() => _EditPartState();
}

class _EditPartState extends State<EditPart> {
  late TextEditingController _textController;

  @override
  void initState() {
    _textController = TextEditingController(
        text: Provider.of<TeamsViewModel>(context, listen: false).team?.name ??
            '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 15.0),
        const CustomSmallTitle(text: 'Change team\'s name'),
        const SizedBox(height: 5.0),
        TextField(
          controller: _textController,
          onChanged: (value) =>
              Provider.of<TeamsViewModel>(context, listen: false)
                  .changeTeamName(value),
        ),
      ],
    );
  }
}
