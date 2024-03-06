import 'dart:async';

class CustomTimer {
  late Timer _timer;
  late Duration _duration;
  late Function(int) _onTick;
  late Function() _onTimerStop;
  bool _isActive = false;

  CustomTimer({
    required Function(int) onTick,
    required Function() onTimerStop,
  }) {
    _onTick = onTick;
    _onTimerStop = onTimerStop;
  }

  void start({required Duration duration}) {
    if(!_isActive){
      _duration = duration;
      _isActive = true;
      _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
        if (_duration.inSeconds > 0) {
          _onTick(_duration.inSeconds);
          _duration -= const Duration(milliseconds: 100);
        } else {
          stop();
          _onTimerStop();
        }
      });
    }
    else{
      restart(duration: duration);
    }
  }

  void restart({required Duration duration}) {
    stop();
    _duration = duration;
    start(duration: duration);
  }

  void stop() {
    if (_isActive) {
      _isActive = false;
      _timer.cancel();
    }
  }
}
