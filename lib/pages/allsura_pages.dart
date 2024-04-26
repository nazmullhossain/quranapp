import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quranapp/widget/utils_widget.dart';



class SimpleExampleApp extends StatefulWidget {
  const SimpleExampleApp();

  @override
  SimpleExampleAppState createState() => SimpleExampleAppState();
}

class SimpleExampleAppState extends State<SimpleExampleApp> {
  late AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    super.initState();

    // Create the audio player.
    player = AudioPlayer();

    // Set the release mode to keep the source after playback has completed.
    player.setReleaseMode(ReleaseMode.stop);

    // Start the player as soon as the app is displayed.
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await player.setSource(AssetSource('mp/001.mp3'));
      await player.resume();
    });
  }

  @override
  void dispose() {
    // Release all sources and dispose the player.
    player.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Hide the status bar when this screen is shown
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(

          flexibleSpace: Image(
            image: AssetImage('images/app.png',),
height: 80,
            fit: BoxFit.fill,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(

          child: ListView.builder(
            shrinkWrap: true,
              itemCount: GlobalVarriable.items3.length,
              itemBuilder: (context,index){
            return Container(
              child: Image.asset(GlobalVarriable.items3[index].image),
            );
          }),),

          Container(
              color: Color(0xff0C7F91),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.share,color: Colors.white,)),
                    Row(
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.file_copy,color: Colors.white,)),
                        IconButton(onPressed: (){}, icon: Icon(Icons.search,color: Colors.white,)),
                      ],
                    )
                    ],
                  ),
                  PlayerWidget(player: player),
                ],
              )),
        ],
      ),
    );
  }
}

// The PlayerWidget is a copy of "/lib/components/player_widget.dart".
//#region PlayerWidget

class PlayerWidget extends StatefulWidget {
  final AudioPlayer player;

  const PlayerWidget({
    required this.player,
    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return _PlayerWidgetState();
  }
}

class _PlayerWidgetState extends State<PlayerWidget> {
  PlayerState? _playerState;
  Duration? _duration;
  Duration? _position;

  StreamSubscription? _durationSubscription;
  StreamSubscription? _positionSubscription;
  StreamSubscription? _playerCompleteSubscription;
  StreamSubscription? _playerStateChangeSubscription;

  bool get _isPlaying => _playerState == PlayerState.playing;

  bool get _isPaused => _playerState == PlayerState.paused;

  String get _durationText => _duration?.toString().split('.').first ?? '';

  String get _positionText => _position?.toString().split('.').first ?? '';

  AudioPlayer get player => widget.player;

  @override
  void initState() {
    super.initState();
    // Use initial values from player
    _playerState = player.state;
    player.getDuration().then(
          (value) => setState(() {
        _duration = value;
      }),
    );
    player.getCurrentPosition().then(
          (value) => setState(() {
        _position = value;
      }),
    );
    _initStreams();
  }

  @override
  void setState(VoidCallback fn) {
    // Subscriptions only can be closed asynchronously,
    // therefore events can occur after widget has been disposed.
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    _playerCompleteSubscription?.cancel();
    _playerStateChangeSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    return

  Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [

              IconButton(
                key: const Key('pause_button'),
                onPressed: _isPlaying ? _pause : null,
                iconSize: 48.0,
                icon: const Icon(Icons.arrow_left),
                color: color,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(50.0), // Rounded border
                ),
                child: IconButton(
                  key: const Key('play_button'),
                  onPressed: _isPlaying ? null : _play,
                  iconSize: 48.0,
                  icon: const Icon(Icons.play_arrow),
                  color: color,
                ),
              ),
              IconButton(
                key: const Key('stop_button'),
                onPressed: _isPlaying || _isPaused ? _stop : null,
                iconSize: 48.0,
                icon: const Icon(Icons.arrow_right),
                color: color,
              ),


            ],
          ),
          Slider(
            activeColor: Colors.white,
            onChanged: (value) {
              final duration = _duration;
              if (duration == null) {
                return;
              }
              final position = value * duration.inMilliseconds;
              player.seek(Duration(milliseconds: position.round()));
            },
            value: (_position != null &&
                _duration != null &&
                _position!.inMilliseconds > 0 &&
                _position!.inMilliseconds < _duration!.inMilliseconds)
                ? _position!.inMilliseconds / _duration!.inMilliseconds
                : 0.0,
          ),
          Text(
            _position != null
                ? '$_positionText / $_durationText'
                : _duration != null
                ? _durationText
                : '',
            style: const TextStyle(fontSize: 16.0,color: Colors.white),
          ),
        ],
      );

  }

  void _initStreams() {
    _durationSubscription = player.onDurationChanged.listen((duration) {
      setState(() => _duration = duration);
    });

    _positionSubscription = player.onPositionChanged.listen(
          (p) => setState(() => _position = p),
    );

    _playerCompleteSubscription = player.onPlayerComplete.listen((event) {
      setState(() {
        _playerState = PlayerState.stopped;
        _position = Duration.zero;
      });
    });

    _playerStateChangeSubscription =
        player.onPlayerStateChanged.listen((state) {
          setState(() {
            _playerState = state;
          });
        });
  }

  Future<void> _play() async {
    await player.resume();
    setState(() => _playerState = PlayerState.playing);
  }

  Future<void> _pause() async {
    await player.pause();
    setState(() => _playerState = PlayerState.paused);
  }

  Future<void> _stop() async {
    await player.stop();
    setState(() {
      _playerState = PlayerState.stopped;
      _position = Duration.zero;
    });
  }
}

//#endregion