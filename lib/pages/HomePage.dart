import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:like_button/like_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => MyHomePage();
}

class MyHomePage extends State<HomePage> {

Future<void> _handleRefresh() async{
  return await Future.delayed(const Duration(seconds: 2),);
}

  @override
  Widget build(BuildContext context) {
return Scaffold(
        body: SafeArea(
          child: LiquidPullToRefresh(
            onRefresh: _handleRefresh,
            color: const Color.fromARGB(255, 141, 86, 236),
            height: 250,
            animSpeedFactor: 1.5,
            showChildOpacityTransition: true,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                  VideoList(
                    taskName1: 'video_id',
                    taskName2: 'title',
                    taskName3: 'description',
                  ),
                  VideoList(
                    taskName1: 'video_id',
                    taskName2: 'title',
                    taskName3: 'description',
                  ),
                  VideoList(
                    taskName1: 'video_id',
                    taskName2: 'title',
                    taskName3: 'description',
                  ),
                  VideoList(
                    taskName1: 'video_id',
                    taskName2: 'title',
                    taskName3: 'description',
                  ),
                  VideoList(
                    taskName1: 'video_id',
                    taskName2: 'title',
                    taskName3: 'description',
                  ),
                  VideoList(
                    taskName1: 'video_id',
                    taskName2: 'title',
                    taskName3: 'description',
                  ),
                  VideoList(
                    taskName1: 'video_id',
                    taskName2: 'title',
                    taskName3: 'description',
                  ),
                  VideoList(
                    taskName1: 'video_id',
                    taskName2: 'title',
                    taskName3: 'description',
                  ),
                  VideoList(
                    taskName1: 'video_id',
                    taskName2: 'title',
                    taskName3: 'description',
                  ),
                  VideoList(
                    taskName1: 'video_id',
                    taskName2: 'title',
                    taskName3: 'description',
                  ),
                  VideoList(
                    taskName1: 'video_id',
                    taskName2: 'title',
                    taskName3: 'description',
                  ),
                  VideoList(
                    taskName1: 'video_id',
                    taskName2: 'title',
                    taskName3: 'description',
                  ),
                ],
            ),
          ),
        ),
      );
  }
}

class VideoList extends StatelessWidget {

  final String taskName1;
  final String taskName2;
  final String taskName3;

  VideoList({
super.key,
required this.taskName1,
required this.taskName2,
required this.taskName3,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(taskName1,),
                            Text(taskName2,),
                            Text(taskName3,),
                          ],
                        ),
                        SizedBox(width: 20,),
                        LikeButton(size: 25, likeCount: 150, countPostion: CountPostion.bottom,),
                        SizedBox(width: 15,),
                        LikeButton(size: 25, likeCount: 74, countPostion: CountPostion.bottom, likeBuilder: (isTapped) {
                          return Icon(
                            Icons.bookmark,
                            color: isTapped ? Colors.red : Colors.grey,
                            size: 25,
                          );
                        },),
                        SizedBox(width: 15,),
                        LikeButton(size: 25, likeCount: 89, countPostion: CountPostion.bottom, likeBuilder: (isTapped) {
                          return Icon(
                            Icons.share,
                            color: isTapped ? Colors.red : Colors.grey,
                            size: 25,
                          );
                        },),
                      ],
                    ),
                    decoration: BoxDecoration(color: Colors.deepPurple[500],
                    borderRadius: BorderRadius.circular(15)),
                    width: 350,
                                  ),
    );
  }
}