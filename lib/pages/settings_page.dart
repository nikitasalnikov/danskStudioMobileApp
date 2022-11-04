import 'package:flutter/material.dart';
import 'package:login_page/provider/widget_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<WidgetProvider>(context);
    String? value;
    List<String> dropDownMenu = [
      'ru',
      'en',
      'da',
    ];

    return Column(
      children: [
        ListTile(
            leading: Text(
              themeProvider.isDark ? 'Light Theme Mode' : 'Dark Theme Mode',
              style: TextStyle(
                color: themeProvider.isDark ? Colors.black : Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            trailing: Switch.adaptive(
                value: themeProvider.isDarkMode,
                onChanged: (value) {
                  themeProvider.toggleTheme(value);
                  setState(() {
                    themeProvider.isDark = !themeProvider.isDark;
                  });
                })),
        ListTile(
          leading: const Text('Language'),
          trailing: SizedBox(
            width: 100,
            child: DropdownButton<String>(
                icon: const Icon(Icons.arrow_drop_down_outlined),
                value: value,
                items: dropDownMenu.map(buildMenuItem).toList(),
                onChanged: (value) {
                  setState(() {
                    value = value;
                  });
                }),
          ),
        ),
      ],
    );
  }
}

DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
