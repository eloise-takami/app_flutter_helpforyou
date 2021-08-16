import 'package:flutter/material.dart';

class PlayerStatus {
  final double progress;
  final bool isPlaying;
  final bool canResume;

  PlayerStatus({
    this.progress = 0.0,
    this.isPlaying = false,
    this.canResume = false,
  });

  PlayerStatus copyWith({
    double? progress,
    bool? isPlaying,
  }) {
    return PlayerStatus(
      progress: progress ?? this.progress,
      isPlaying: isPlaying ?? this.isPlaying,
    );
  }
}

class PlayerController {
  final statusNotifier = ValueNotifier<PlayerStatus>(PlayerStatus());

  PlayerStatus get status => statusNotifier.value;
  set status(PlayerStatus status) => statusNotifier.value = status;

  void pause() {
    status = status.copyWith(isPlaying: false);
  }

  void play() {
    status = status.copyWith(isPlaying: true);
  }

  void setProgress(double p) {
    status = status.copyWith(progress: p);
  }
}
