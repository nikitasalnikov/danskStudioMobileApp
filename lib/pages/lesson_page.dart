import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_page/pages/video_player_widget.dart';
import 'package:video_player/video_player.dart';

class LessonPage extends StatelessWidget {
  const LessonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[200],
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.deepPurple,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const LessonPageBody(),
    );
  }
}

class LessonPageBody extends StatefulWidget {
  const LessonPageBody({Key? key}) : super(key: key);

  @override
  State<LessonPageBody> createState() => _LessonPageBodyState();
}

class _LessonPageBodyState extends State<LessonPageBody> {
  final user = FirebaseAuth.instance.currentUser!;
  VideoPlayerController? controller;
  bool isPlaying = false;
  final asset = 'assets/video/video_message.mp4';

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(asset)
      ..addListener(() => setState(() {}))
      // ..setLooping(true)
      ..initialize().then((_) => controller?.pause());
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        VideoPlayerWidget(controller: controller as VideoPlayerController),
        const SizedBox(height: 20),
        FloatingActionButton(
          onPressed: () async {
            controller?.play();
          },
          child: Text(
            'play'.toUpperCase(),
          ),
        ),
      ],
    );
  }
}
