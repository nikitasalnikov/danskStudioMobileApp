import 'package:flutter/material.dart';
import 'package:login_page/const/consts.dart';
import 'package:login_page/provider/widget_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listLessons = Consts.lessons;
    int index = 0;
    final model = context.watch<WidgetProvider>();

    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Center(
        child: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                model.addArr(index);
                Navigator.of(context)
                    .pushNamed('/lesson_page', arguments: index);
              },
              leading: const Image(
                image: AssetImage('assets/images/speaker.gif'),
              ),
              title: Text(
                listLessons[index],
                style: AppStyle.textStyle.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemCount: listLessons.length,
        ),
      ),
    );
  }
}
