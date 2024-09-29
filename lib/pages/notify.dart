import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:trpl_tube/drawer.dart';

class NotiFicationPage extends StatefulWidget {
  const NotiFicationPage({Key? key}) : super(key: key);

  @override
  State<NotiFicationPage> createState() => NotiFicationPageState();
}

class NotiFicationPageState extends State<NotiFicationPage> {

  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
    backgroundColor: Colors.transparent,
    leading: IconButton(onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HiddenDrawer()));
    },
     icon: const Icon(Icons.arrow_back)),
  ),
        body: Column(
              children: [
                const SizedBox(height: 50,),
                Center(
                  child:Column(
                    children: [
                      const SizedBox(height: 30,),

                      const Text('У вас нет уведомлений', style: TextStyle(fontSize: 18,),),

                      const SizedBox(height: 50,),

                      Lottie.network('https://lottie.host/c5cc6429-6779-40eb-88e6-ef6a754c0f75/JLfDKFLEkd.json'),
                    ],
                  ),
                  ),
              ],
            ),
        );
  }
}