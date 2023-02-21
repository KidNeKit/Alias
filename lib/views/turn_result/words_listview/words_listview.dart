import 'package:alias/resources/colors.dart';
import 'package:alias/view_models/turn_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: primaryColor,
      ),
      child: Row(
        children: [
          Text(
            _word,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const Spacer(),
          Icon(_isAnswered ? Icons.thumb_up : Icons.thumb_down),
        ],
      ),
    );
  }
}
