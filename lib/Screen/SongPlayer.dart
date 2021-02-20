import 'package:flutter/material.dart';
import 'package:music_player/music_player.dart';

class SongPage extends StatefulWidget {

  String song_name,link;

  SongPage(this.song_name, this.link);

  @override
  _SongPageState createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
 bool isPlaying=false;
  MusicPlayer musicPlayer;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Initializing the Music Player and adding a single [PlaylistItem]
  Future<void> initPlatformState() async {
    musicPlayer = MusicPlayer();
  }


  @override
  Widget build(BuildContext context) {
    final querydata= MediaQuery.of(context);
    final screenSize=querydata.size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.song_name),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text(widget.song_name,style: TextStyle(fontSize: screenSize.height/20,fontWeight: FontWeight.bold),textDirection: TextDirection.ltr,)),
          FlatButton(
            onPressed: (){
              setState(() {
                isPlaying=true;
              });
              musicPlayer.play(MusicItem(
                trackName: "",
                albumName: '',
                artistName: '',
                url: widget.link,
                duration: Duration(seconds:300),
              ),);
            },
            child: Icon(Icons.play_arrow,size: screenSize.height/4,color: isPlaying ? Colors.blue:Colors.grey,),
          ),

          FlatButton(
            onPressed: (){
              setState(() {
                isPlaying=false;
              });
              musicPlayer.stop();
            },
            child: Icon(Icons.stop,size: screenSize.height/4,color: isPlaying ? Colors.grey:Colors.blue),
          )
        ],
      )
    );
  }
}
