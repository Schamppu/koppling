import 'package:client/features/authentication/manager/auth_manager.dart';
import 'package:client/features/koppling/classes/game_koppling.dart';
import 'package:client/features/koppling/functions/correct_words.dart';
import 'package:client/features/koppling/functions/lose_life.dart';
import 'package:client/features/koppling/manager/koppling_manager.dart';
import 'package:client/features/networking/functions/networking.dart';
import 'package:client/features/networking/functions/urls.dart';
import 'package:client/features/toasts/functions/toast_functions.dart';
import 'package:client/features/words/classes/words.dart';
import 'package:flutter/material.dart';

/// Checks the selected words against the correct answers.
Future<void> checkWords({
  required GameKoppling gameKoppling,
  required List<Word> words,
}) async {
  int totalMatches = 0;
  Words? correctWordGroup;
  for (final group in gameKoppling.words) {
    int matches = 0;
    List<String> strings = group.words.map((w) => w.word).toList();
    for (final word in words) {
      final str = word.word;
      if (strings.contains(str)) {
        matches++;
      }
    }
    if (totalMatches < matches) {
      totalMatches = matches;
    }
    if (matches == group.words.length) {
      correctWordGroup = group;
      break;
    }
  }

  if (totalMatches < 3) {
    await loseLife();
    await net.post(
      kopplingsUpdateEndpoint,
      data: {
        'user': auth.state.username,
        'koppling': koppling.toKoppling.toJson(),
      },
    );
    showSuccess(
      title: 'Incorrect',
      message: 'Try again, you can do it!',
      icon: Icons.close,
      iconColor: Colors.redAccent,
    );
  } else if (totalMatches == 3) {
    await loseLife();
    await net.post(
      kopplingsUpdateEndpoint,
      data: {
        'user': auth.state.username,
        'koppling': koppling.toKoppling.toJson(),
      },
    );
    showSuccess(
      title: 'Almost there!',
      message: 'You got 3 correct! Can you find the last one?',
      icon: Icons.warning,
      iconColor: Colors.amberAccent,
    );
  } else if (correctWordGroup != null) {
    await correctWords(words: correctWordGroup);
    await net.post(
      kopplingsUpdateEndpoint,
      data: {
        'user': auth.state.username,
        'koppling': koppling.toKoppling.toJson(),
      },
    );
    showSuccess(
      title: 'Correct!',
      message: 'You selected the right words! 💃',
      icon: Icons.favorite,
      iconColor: Colors.pinkAccent,
    );
  }
}
