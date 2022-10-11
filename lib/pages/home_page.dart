import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_page/provider/lessons_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber[200], actions: [
        IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: const Icon(
              Icons.exit_to_app,
              color: Colors.deepPurple,
            ))
      ]),
      body: const ListWidget(),
    );
  }
}

class ListWidget extends StatelessWidget {
  const ListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listLessons = Provider.of<LessonsProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Center(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/lesson_page');
                },
                child: ListTile(
                  leading: const Image(
                    image: AssetImage('assets/images/speaker.gif'),
                  ),
                  title: Text(listLessons.lessons[index]),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemCount: 10),
      ),
    );
  }
}
