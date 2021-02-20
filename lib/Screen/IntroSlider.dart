import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:The_Mindfulness/Components/assets.dart';
import 'package:The_Mindfulness/Components/swiper_pagination.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'WelcomeScreen.dart';



class IntroSlider extends StatefulWidget {

  static final String id = "intro_sldier";
  @override
  _IntroSliderState createState() => _IntroSliderState();

}

class _IntroSliderState extends State<IntroSlider> {
  final SwiperController  _swiperController = SwiperController();
  final int _pageCount = 3;
  int _currentIndex = 0;
  final List<String> titles = [
    "Meditation Assistant\n \n Helps you with diffrent kind of meditation.\n Relaxes your brain and give inner peace.",
    "Maintains your Schedule and Checklist. \n Timer for Meditation.\n Give Insights about Routine FollowUP  ",
    "Keeps you Connected \nDoctor to Patient Communication \n And Much More......"
  ];

  final List<Color> pageBgs = [
    Colors.blue.shade300,
    Colors.grey.shade600,
    Colors.cyan.shade300
  ];



  @override
  Widget build(BuildContext context){
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Center(child: Container(
            height: screenSize.height/3,
            margin: const EdgeInsets.only(left: 8.0, right: 8.0),
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(5.0)
            ),
          ),),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(child: Swiper(
                index: _currentIndex,
                controller: _swiperController,
                itemCount: _pageCount,
                onIndexChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                loop: false,
                itemBuilder: (context, index){
                  return _buildPage(title: titles[index], icon: images[index+2], pageBg: pageBgs[index]);
                },
                pagination: SwiperPagination(
                    builder: CustomPaginationBuilder(
                        activeSize: Size(10.0, 20.0),
                        size: Size(10.0, 15.0),
                        color: Colors.grey.shade600
                    )
                ),
              )),
              SizedBox(height: 10.0),
              _buildButtons(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButtons(){
    return Container(
      margin: const EdgeInsets.only(right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlatButton(
            textColor: Colors.grey.shade600,
            child: Text("Skip"),
            onPressed: (){
              Navigator.of(context).pushReplacementNamed(WelcomeScreen.id);
            },
          ),
          IconButton(
            icon: Icon(_currentIndex < _pageCount - 1 ? Icons.arrow_forward_ios : FontAwesomeIcons.check),
            onPressed: () async {
              if(_currentIndex < _pageCount - 1)
                _swiperController.next();
              else {

                Navigator.of(context).pushReplacementNamed(WelcomeScreen.id);
              }
            },
          )
        ],
      ),
    );
  }

  Widget _buildPage({String title, String icon, Color pageBg}) {

    final screenSize = MediaQuery.of(context).size;
    final TextStyle titleStyle = TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: screenSize.height/43,
        color: Colors.white
    );
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(16.0, 50.0,16.0,40.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: pageBg
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20.0),
          Text(title, textAlign: TextAlign.center, style: titleStyle,),
          SizedBox(height: 30.0),
          ClipOval(child: Container(
            height: screenSize.height/2.7,
            width: screenSize.width/1.4,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: CachedNetworkImageProvider(icon),
                    fit: BoxFit.cover
                )
            ),
          )),

          // SizedBox(height: screenSize.height/17,),
        ],
      ),
    );
  }
}