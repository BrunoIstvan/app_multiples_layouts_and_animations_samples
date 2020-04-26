import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPlayerPage extends StatefulWidget {
  @override
  _AudioPlayerPageState createState() => _AudioPlayerPageState();
}

// enum StatusSong { PLAYING, PAUSED, STOPPED }

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  Duration _duration = new Duration();
  Duration _position = new Duration();
  AudioPlayer _audioPlayer;
  AudioCache _audioCache;
  AudioPlayerState _state;
  String _durationText = '00:00';
  String _positionText = '00:00';
  bool _enablePlayButton = true;
  bool _enablePauseButton = false;
  bool _enableStopButton = false;

  @override
  void initState() {
    super.initState();
    _state = AudioPlayerState.STOPPED;
    _initPlayer();
  }

  void _initPlayer() {
    _audioPlayer = new AudioPlayer();
    _audioCache = AudioCache(fixedPlayer: _audioPlayer);

    _audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() {
        _duration = d;
        var minD = _duration.inMinutes.toString().padLeft(2, '0');
        var secD = _duration.inSeconds.toString().padLeft(2, '0');
        _durationText = '$minD:$secD';
      });
    });
    _audioPlayer.onAudioPositionChanged.listen((Duration p) {
      setState(() {
        _position = p;
      });
    });
    _audioPlayer.onPlayerStateChanged.listen((AudioPlayerState state) {
      switch (state) {
        case AudioPlayerState.PLAYING:
          setState(() {
            _enablePauseButton = true;
            _enableStopButton = true;
            _enablePlayButton = false;
          });
          break;
        case AudioPlayerState.STOPPED:
          setState(() {
            _enablePauseButton = false;
            _enableStopButton = false;
            _enablePlayButton = true;
          });
          break;
        case AudioPlayerState.PAUSED:
          setState(() {
            _enablePauseButton = false;
            _enableStopButton = true;
            _enablePlayButton = true;
          });
          break;
        default:
          setState(() {
            _enablePauseButton = false;
            _enableStopButton = false;
            _enablePlayButton = true;
            _duration = Duration();
            _position = Duration();
          });
      }
    });
    _audioPlayer.onPlayerCompletion.listen((event) {
      setState(() {
        _state = AudioPlayerState.STOPPED;
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(),
      ),
      onWillPop: () {
        _stopSongIfRunnig();
        return new Future(() => true);
      },
    );
  }

  _stopSongIfRunnig() {
    if (_audioPlayer.state == AudioPlayerState.PLAYING ||
        _audioPlayer.state == AudioPlayerState.PAUSED) {
      _audioPlayer.stop();
    }
  }

  Widget _buildSlider() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Slider(
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            _seekToSecond(value.toInt());
            value = value;
          });
        },
      ),
    );
  }

  void _seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);

    _audioPlayer.seek(newDuration);
  }

  Center _buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Icon(Icons.play_arrow),
                onPressed: _enablePlayButton ? _play : null,
              ),
              FlatButton(
                child: Icon(Icons.pause),
                onPressed: _enablePauseButton ? _pause : null,
              ),
              FlatButton(
                child: Icon(Icons.stop),
                onPressed: _enableStopButton ? _stop : null,
              ),
              SizedBox(height: 20),
            ],
          ),
          _buildSlider(),
          _buildPositionAndDurationValue(),
        ],
      ),
    );
  }

  _buildPositionAndDurationValue() {
    var minP = _position.inMinutes.toString().padLeft(2, '0');
    var secP = _position.inSeconds.toString().padLeft(2, '0');
    _positionText = '$minP:$secP';

    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '$_positionText',
            textAlign: TextAlign.left,
          ),
          Text(
            '$_durationText',
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('AudioPlayer'),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          _stopSongIfRunnig();
          Navigator.pop(context);
        },
      ),
    );
  }

  void _play() async {
    if (_state == AudioPlayerState.STOPPED) {
      AudioPlayer result = await _audioCache.play('audios/audio.mp3');
      if (result.state == AudioPlayerState.PLAYING) {
        setState(() {
          _state = AudioPlayerState.PLAYING;
        });
      }
      print('Play: $result');
    } else if (_state == AudioPlayerState.PAUSED) {
      int result = await _audioPlayer.resume();
      if (result == 1) {
        setState(() {
          _state = AudioPlayerState.PLAYING;
        });
      }
      print('Play: $result');
    }
  }

  void _pause() async {
    int result = await _audioPlayer.pause();
    if (result == 1) {
      setState(() {
        _state = AudioPlayerState.PAUSED;
      });
    }
    print('Pause: $result');
  }

  void _stop() async {
    if (_state == AudioPlayerState.PLAYING ||
        _state == AudioPlayerState.PAUSED) {
      int result = await _audioPlayer.stop();
      if (result == 1) {
        setState(() {
          _state = AudioPlayerState.STOPPED;
          _duration = Duration();
          _position = Duration();
        });
      }
      print('Stop: $result');
    }
  }
}
