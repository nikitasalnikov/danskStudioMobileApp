import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_page/const/consts.dart';
import 'package:login_page/pages/video_player_widget.dart';
import 'package:video_player/video_player.dart';

class LessonPage extends StatelessWidget {
  const LessonPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final index = ModalRoute.of(context)?.settings.arguments;
    final String text = Consts.lessons[index as int];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          text,
          // Consts.lessons[index as int],
          style: AppStyle.textStyle.copyWith(
            color: Colors.deepPurple,
          ),
        ),
        centerTitle: true,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            LessonPageBody(
              index: index,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: ListViewWidget(
                index: index,
                text: text,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LessonPageBody extends StatefulWidget {
  final int index;
  const LessonPageBody({Key? key, required this.index}) : super(key: key);

  @override
  State<LessonPageBody> createState() => _LessonPageBodyState();
}

class _LessonPageBodyState extends State<LessonPageBody> {
  final user = FirebaseAuth.instance.currentUser!;
  VideoPlayerController? controller;
  final assets = Consts.assets;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.asset(assets[widget.index])
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

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({Key? key, required this.index, required this.text})
      : super(key: key);
  final index;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 25),
      child: Column(
        children: [
          Card(
            color: const Color.fromARGB(255, 240, 241, 239),
            margin: const EdgeInsets.only(top: 10, bottom: 20),
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    Consts.questions[index],
                    style: AppStyle.textStyle,
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 180,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: Consts.answers[index].length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CheckBoxWidget(
                              index: index,
                            ),
                            title: Text(
                              Consts.answers[0][index],
                              style: AppStyle.textStyle.copyWith(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
          Card(
            color: const Color.fromARGB(255, 240, 241, 239),
            margin: const EdgeInsets.only(bottom: 20),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 25,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    Consts.questions2[index],
                    style: AppStyle.textStyle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 180,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: Consts.answers[index].length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            horizontalTitleGap: 5,
                            leading: CheckBoxWidget(
                              index: index,
                            ),
                            title: Text(
                              Consts.answers[1][index],
                              style: AppStyle.textStyle.copyWith(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
          Card(
            color: const Color.fromARGB(255, 240, 241, 239),
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    Consts.questions3[index],
                    style: AppStyle.textStyle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 180,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: Consts.answers[index].length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CheckBoxWidget(
                              index: index,
                            ),
                            title: Text(Consts.answers[2][index]),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 25),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 106, 121, 111),
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: Offset(1, 5),
                ),
              ],
              color: const Color.fromARGB(255, 91, 235, 165),
              borderRadius: BorderRadius.circular(25),
            ),
            width: 150,
            child: InkWell(
              child: Text(
                'Ok',
                style: AppStyle.textStyle.copyWith(
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                ),
                textAlign: TextAlign.center,
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({
    Key? key,
    required this.index,
  }) : super(key: key);
  final index;

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        shape: CircleBorder(),
        value: value,
        onChanged: (value) {
          setState(() {
            this.value = value!;
          });
        });
  }
}
