import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:trpl_tube/pages/HomePage.dart';
import 'package:trpl_tube/pages/profile.dart';
import 'package:trpl_tube/pages/settings.dart';
import 'package:trpl_tube/pages/notify.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({Key? key}) : super(key: key);

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];

  @override
  void initState() {
    super.initState();

    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'TRPLtube',
          baseStyle: const TextStyle(),
          selectedStyle: const TextStyle(),
        ),
        const HomePage(),
        ),
        ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Настройки',
          baseStyle: const TextStyle(),
          selectedStyle: const TextStyle(),
        ),
        const SettingsPage(),
        ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      screens: _pages,
      backgroundColorMenu: const Color.fromARGB(96, 149, 39, 176),
      initPositionSelected: 0,
      actionsAppBar: [
        IconButton(
  onPressed: () {
            showSearch(
             context: context,
             delegate: CostomSearchDelegate(),
             );
            //search
          },
          icon: const Icon(Icons.search),
          ),
          IconButton(onPressed: () {
            //notify
            Navigator.push(context, MaterialPageRoute(builder: (context) => const NotiFicationPage()));
          },
          icon: const Icon(Icons.notifications),
          ),
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
          }, icon: Image.asset('assets/icons/Bat.png',
          height: 30,
          ),),
      ],
      );
  }
}

class CostomSearchDelegate extends SearchDelegate{
List<String> searchTerms = [
'Звук Дождя',
'Кино Под чай',
'Программирование с нуля',
'Музыка для релакса',
'Обзор нового Айфона',
'Топ 100 мемов 2024 года',
'Обзор мишленовских ресторанов',
'Звёздное небо 4К',
'Что скрывается в бермудском треугольнике?',
'Самые популярные песни с 1990-2024 по годам',
'Как попросить  чат Gpt о создании доклада',
'История средних веков с всеми событиями по годам',
];

  @override
  List<Widget> buildActions(BuildContext context) {
    return[
      IconButton(onPressed: () {
        query = '';
      }, icon: const Icon(Icons.clear),),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
      return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
      },
      );
  }

  @override
  Widget buildResults(BuildContext context) {
      List<String> matchQuery = [];
      for (var video in searchTerms) {
        if (video.toLowerCase().contains(query.toLowerCase())){
          matchQuery.add(video);
        }
      }
      return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      });
  }

 @override
  Widget buildSuggestions(BuildContext context) {
      List<String> matchQuery = [];
      for (var video in searchTerms) {
        if (video.toLowerCase().contains(query.toLowerCase())){
          matchQuery.add(video);
        }
      }
      return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      });
  }
}