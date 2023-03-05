import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_models/turn_view_model.dart';
import '../../global_components/text/custom_titles.dart';

class WordsListView extends StatelessWidget {
  const WordsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<TurnViewModel>(
        builder: (context, value, child) => ListView.separated(
          itemBuilder: (context, index) => WordItem(
            word: value.shownWords[index],
            isAnswered: value.correctWords.contains(
              value.shownWords[index],
            ),
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 5.0),
          itemCount: value.shownWords.length,
        ),
      ),
    );
  }
}

class WordItem extends StatelessWidget {
  final String _word;
  final bool _isAnswered;
  const WordItem({required String word, required bool isAnswered, super.key})
      : _word = word,
        _isAnswered = isAnswered;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 7.0,
        horizontal: 20.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Theme.of(context).primaryColor,
      ),
      child: Row(
        children: [
          CustomMediumTitle(text: _word),
          const Spacer(),
          _buildThumbIcon(_word, context),
        ],
      ),
    );
  }

  Widget _buildThumbIcon(String word, BuildContext context) {
    return Consumer<TurnViewModel>(
      builder: (context, value, child) => GestureDetector(
        onTap: () {
          value.thumbUpPressed(word);
        },
        child: Icon(
          _isAnswered ? Icons.thumb_up : Icons.thumb_up_alt_outlined,
          color: Theme.of(context).cardColor,
        ),
      ),
    );
  }
}
