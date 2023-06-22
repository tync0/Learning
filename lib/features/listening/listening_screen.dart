import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:just_audio/just_audio.dart';

@RoutePage()
class ListeningScreen extends StatefulWidget {
  const ListeningScreen({Key? key}) : super(key: key);

  @override
  _ListeningScreenState createState() => _ListeningScreenState();
}

class _ListeningScreenState extends State<ListeningScreen> {
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  double _sliderValue = 0;
  String _durationString = '';

  setAudio() async {
    await audioPlayer.setAsset('assets/listening.m4a');
    await audioPlayer.load();
    setState(() {
      _durationString = formatTime(audioPlayer.duration ?? Duration.zero);
    });
  }

  @override
  void initState() {
    setAudio();
    audioPlayer.setLoopMode(LoopMode.all);
    audioPlayer.positionStream.listen((position) {
      setState(() {
        _sliderValue = position.inMilliseconds.toDouble();
      });
    });
    audioPlayer.playerStateStream.listen((playerState) {
      if (playerState == PlayerState(true, ProcessingState.completed)) {
        setState(() {
          audioPlayer.stop();
          isPlaying = false;
          _sliderValue = 0;
          audioPlayer.dispose();
        });
      }
    });
    audioPlayer.playingStream.listen((event) {
      isPlaying = event;
    });
    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  final List<String> _sentences = [
    "The weather is nice today.",
    "I enjoy playing the guitar.",
    "She is reading a book.",
    "They went to the beach yesterday.",
    "We are going to have dinner at the restaurant.",
    "He likes to watch movies.",
    "My sister is a teacher.",
    "I have two cats.",
    "He plays basketball every weekend.",
    "The train will arrive in 10 minutes.",
  ];

  final List<bool?> _userAnswers = List<bool?>.filled(10, null);
  int _score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.router.pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Listening",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Listen to the sentence and select true or false:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _sentences.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    margin:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: SvgPicture.asset(
                          "assets/speaking.svg",
                          width: 32,
                          height: 32,
                        ),
                      ),
                      title: Text(
                        _sentences[index],
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Radio<bool>(
                            value: true,
                            groupValue: _userAnswers[index],
                            onChanged: (value) {
                              setState(() {
                                _userAnswers[index] = value;
                              });
                            },
                          ),
                          Text(
                            "True",
                            style: TextStyle(fontSize: 14.sp),
                          ),
                          SizedBox(width: 5.h),
                          Radio<bool>(
                            value: false,
                            groupValue: _userAnswers[index],
                            onChanged: (value) {
                              setState(() {
                                _userAnswers[index] = value;
                              });
                            },
                          ),
                          Text(
                            "False",
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Slider(
              min: 0,
              max: audioPlayer.duration?.inMilliseconds.toDouble() ?? 0,
              value: _sliderValue,
              onChanged: (value) async {
                final position = Duration(milliseconds: value.round());
                await audioPlayer.seek(position);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formatTime(Duration(milliseconds: _sliderValue.round())),
                  style: const TextStyle(color: Colors.black),
                ),
                Text(
                  _durationString,
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () async {
                      if (isPlaying) {
                        await audioPlayer.pause();
                      } else {
                        await audioPlayer.play();
                      }
                    },
                    icon: Icon(
                      color: Colors.grey[800],
                      size: 30,
                      isPlaying ? Icons.pause : Icons.play_arrow,
                    ),
                  ),
                  SizedBox(width: 32.h),
                  ElevatedButton(
                    onPressed: () {
                      int score = 0;
                      for (bool? answer in _userAnswers) {
                        if (answer != null && answer) {
                          score++;
                        }
                      }
                      setState(() {
                        _score = score;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                      textStyle: TextStyle(fontSize: 16.sp),
                      padding: EdgeInsets.symmetric(
                        horizontal: 32.w,
                        vertical: 12.h,
                      ),
                    ),
                    child: const Text("Submit"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Score: $_score/10",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [minutes, seconds].join(':');
  }
}
