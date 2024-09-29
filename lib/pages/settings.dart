import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trpl_tube/Provider/provider.dart';
import 'package:lottie/lottie.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
return Scaffold(
        body: Consumer<UiProvider>(
          builder: (context,  UiProvider notifier, child) {
            return Column(
              children: [
                const SizedBox(height: 20,),
                ListTile(
                  leading: const Icon(Icons.dark_mode),
                  title: const Text('Тёмная тема'),
                  trailing:  Switch(
                    value: notifier.isDark,
                  onChanged: (value) => notifier.changeTheme(),
                  ),
                ),
                const SizedBox(height: 50,),
                Center(
                  child:Column(
                    children: [
                      Lottie.network('https://lottie.host/cd8cfa2c-6ca0-44c0-a71e-739e7033dca4/vg9NjP0dRY.json'),
                      const SizedBox(height: 30,),
                      const Text('Ведутся технические работы...', style: TextStyle(fontSize: 18,),),
                    ],
                  ),
                  ),
              ],
            );
          }
        ),
      );
  }
}
