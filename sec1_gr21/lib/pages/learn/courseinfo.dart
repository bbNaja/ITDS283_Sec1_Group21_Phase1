import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sec1_gr21/components/appbar.dart';
import 'package:sec1_gr21/components/learn/courselength.dart';
import 'package:video_player/video_player.dart';
import 'package:sec1_gr21/components/learn/videoplayer.dart';

class CourseinfoPage extends StatefulWidget {
  const CourseinfoPage({super.key});

  @override
  State<CourseinfoPage> createState() => _CourseinfoState();
}

class _CourseinfoState extends State<CourseinfoPage> {
  List videoInfo = [];
  bool _playarea = false;
  int? selectedIndex;
  VideoPlayerController? _controller;

  Future<void> _onTapVideo(int index) async {
    final url = videoInfo[index]['videoUrl'];

    final oldController = _controller;
    final newController = VideoPlayerController.network(url);

    await newController.initialize();
    await newController.play();

    setState(() {
      selectedIndex = index;
      _playarea = true;
      _controller = newController;
    });

    oldController?.dispose();
  }

  Widget _controlView(BuildContext context) {
    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width,
      color: const Color(0xFF6985e8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.fast_rewind, size: 32, color: Colors.white),
            onPressed: () {
              if (_controller != null) {
                final current = _controller!.value.position;
                _controller!.seekTo(current - const Duration(seconds: 5));
              }
            },
          ),
          const SizedBox(width: 24),
          IconButton(
            icon: Icon(
              _controller?.value.isPlaying ?? false
                  ? Icons.pause
                  : Icons.play_arrow,
              size: 36,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                if (_controller != null) {
                  _controller!.value.isPlaying
                      ? _controller!.pause()
                      : _controller!.play();
                }
              });
            },
          ),
          const SizedBox(width: 24),
          IconButton(
            icon: const Icon(Icons.fast_forward, size: 32, color: Colors.white),
            onPressed: () {
              if (_controller != null) {
                final current = _controller!.value.position;
                _controller!.seekTo(current + const Duration(seconds: 5));
              }
            },
          )
        ],
      ),
    );
  }

  Future<void> _initData() async {
    try {
      final data = await DefaultAssetBundle.of(context)
          .loadString('assets/json/videoinfo.json');
      setState(() {
        videoInfo = json.decode(data);
      });
    } catch (e) {
      debugPrint('Error loading JSON: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NavBar(),
        body: SafeArea(
            child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xff0f17ad).withOpacity(0.8),
            Color(0xFF6985e8).withOpacity(0.9)
          ], begin: const FractionalOffset(0.0, 0.4), end: Alignment.topRight)),
          child: Column(
            children: [
              _playarea == false
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      padding:
                          const EdgeInsets.only(top: 40, left: 30, right: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Knitting',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          //Hour/min each course
                          Courselength(),
                        ],
                      ),
                    )
                  : Column(
                      // Video player
                      children: [
                        Container(
                          height: 220,
                          width: double.infinity,
                          child: Stack(
                            children: [
                              // Video
                              Positioned.fill(
                                child: VideoPlayerBox(
                                  key: ValueKey(selectedIndex),
                                  url: videoInfo[selectedIndex!]['videoUrl'],
                                ),
                              ),
                              // 🔙 Back button on top-left
                              SafeArea(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.6),
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                        icon: const Icon(Icons.arrow_back,
                                            color: Colors.black),
                                        onPressed: () {
                                          setState(() {
                                            _playarea = false;
                                            selectedIndex = null;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        _controlView(context),
                      ],
                    ),
              Expanded(
                  child: Container(
                //use for avaliable space
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(70))),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    SizedBox(width: 30),
                    Text('Circuit 1 ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    Expanded(
                        // Loop
                        child: ListView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            itemCount: videoInfo.length,
                            itemBuilder: (_, int index) {
                              return GestureDetector(
                                onTap: () {
                                  _onTapVideo(index);
                                  debugPrint(index.toString());
                                  setState(() {
                                    if (_playarea == false) {
                                      _playarea = true;
                                    }
                                  });
                                },
                                child: Container(
                                    height: 135,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                                width: 80,
                                                height: 80,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            videoInfo[index]
                                                                ['thumbnail']),
                                                        fit: BoxFit.cover))),
                                            SizedBox(width: 10),
                                            Expanded(
                                                child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  videoInfo[index]["title"],
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(height: 10),
                                                Padding(
                                                    padding:
                                                        EdgeInsets.only(top: 3),
                                                    child: Text(
                                                      videoInfo[index]["time"],
                                                      style: TextStyle(
                                                          color:
                                                              Colors.grey[500]),
                                                    ))
                                              ],
                                            ))
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Divider(
                                          //Underline
                                          thickness: 1,
                                          color: Colors.grey[300],
                                          indent: 10,
                                          endIndent: 10,
                                        ),
                                      ],
                                    )),
                              );
                            }))
                  ],
                ),
              ))
            ],
          ),
        )));
  }
}
