import '../../theme/box_icons_icons.dart';
import '../../theme/config.dart';
import '../widgets/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;
import 'dart:ui';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: 'Vtkv3-endYc',
      flags: YoutubePlayerFlags(
        controlsVisibleAtStart: true,
        mute: false,
        autoPlay: true,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final youtubePlayer = YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Color(0xFF7F00FF).withOpacity(0.4),
      progressColors: ProgressBarColors(
        playedColor: Color(0xFF7F00FF).withOpacity(0.7),
        handleColor: Color(0xFF7F00FF),
        bufferedColor: Color(0xFFE100FF),
      ),
      onReady: () {
        print('Player is ready.');
      },
    );
    print(_controller.metadata.title);
    return material.Scaffold(
      backgroundColor: Colors().secondColor(1),
      body: SafeArea(
        child: YoutubePlayerBuilder(
          player: youtubePlayer,
          builder: (context, player) {
            return Column(
              children: [
                player,
                Description(
                  height: height - (width / youtubePlayer.aspectRatio),
                  width: width,
                  title: "TedX",
                  time: "5 mins",
                  description: "Context to the video here.",
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({
    Key key,
    @required this.height,
    @required this.width,
    @required this.title,
    @required this.time,
    @required this.description,
  }) : super(key: key);

  final double height;
  final double width;
  final String title;
  final String time;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          height: height - MediaQueryData.fromWindow(window).padding.top,
          child: SingleChildScrollView(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(24, 10, 8, 8.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 4,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(500),
                                      color: Color(0xFF343434),
                                    ),
                                    child: Text(""),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      title,
                                      style: TextStyle(
                                        color: Color(0xFF343434),
                                        fontFamily: 'Red Hat Display',
                                        fontSize: 24,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Icon(BoxIcons.bx_bar_chart_alt_2,
                                        size: 20, color: Color(0xFFADADAD)),
                                  ),
                                  Text(
                                    "Beginner",
                                    style: TextStyle(
                                      color: Color(0xFFADADAD),
                                      fontFamily: 'Red Hat Display',
                                      fontSize: 14,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    time,
                                    style: TextStyle(
                                        color: Color(0xFFADADAD),
                                        fontFamily: 'Red Hat Display',
                                        fontSize: 14),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Icon(
                                      BoxIcons.bx_timer,
                                      size: 20,
                                      color: Color(0xFFADADAD),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              width: width * 0.9,
                              child: Text(
                                description,
                                style: TextStyle(
                                  color: Color(0xFF343434),
                                  fontFamily: 'Red Hat Display',
                                  fontSize: 16,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    right: 30,
                    top: (3 * width) / 4 + 50,
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFABDCFF),
                              Color(0xFF0396FF),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 25,
                              color: Color(0xFF03A9F4).withOpacity(0.4),
                              offset: Offset(0, 4),
                            )
                          ],
                          borderRadius: BorderRadius.circular(500)),
                      child: material.FloatingActionButton(
                          elevation: 0,
                          highlightElevation: 0,
                          backgroundColor: material.Colors.transparent,
                          child: Icon(BoxIcons.bx_play, size: 40),
                          onPressed: () {}),
                    )),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: CardWidget(
            button: true,
            gradient: true,
            height: 60,
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Attempt Test",
                  style: TextStyle(
                      color: material.Colors.white,
                      fontFamily: 'Red Hat Display',
                      fontSize: 18),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(BoxIcons.bx_pencil, color: material.Colors.white),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
