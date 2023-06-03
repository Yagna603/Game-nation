import 'package:flutter/material.dart';
import '../pages/data.dart';
import '../widgets/scrollable_games_widget.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late double _deviceHeight;
  late double _deviceWidth;

  int? _selectedGame = 0;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _featuredGames(),
          _gradientColorWidget(),
          _topLayerWidget(),
        ],
      ),
    );
  }

  Widget _featuredGames() {

    // @override
    // void initState(){
    //   super.initState();
    //   _selectedGame = 0;
    // }

    return SizedBox(
      height: _deviceHeight * 0.50,
      width: _deviceWidth,
      child: PageView(
        onPageChanged: (index) {
          setState(() {
            _selectedGame = index;
          });
        },
        scrollDirection: Axis.horizontal,
        children: featuredGames.map((game) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(game.coverImage.url),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _gradientColorWidget() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: _deviceHeight * 0.75,
        width: _deviceWidth,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(35, 45, 59, 1.0),
              Colors.transparent,
            ],
            stops: [0.65,1.0],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
      ),
    );
  }

  Widget _topLayerWidget() {
    return Padding(
      padding: EdgeInsets.fromLTRB(_deviceWidth * 0.03, _deviceHeight * 0.02, _deviceWidth * 0.03, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _topBarWidget(),
          SizedBox(height: _deviceHeight * 0.13,),
          _featuredGamesInfoWidget(),
          Padding(
            padding: EdgeInsets.fromLTRB(0, _deviceHeight * 0.01, 0, _deviceHeight * 0.005),
            child: ScrollableGamesWidget(height: _deviceHeight * 0.22, width: _deviceWidth, showTitle: true, gamesData: games),
          ),
          _featuredGameBannerWidget(),
          SizedBox(height: _deviceHeight * 0.005,),
          ScrollableGamesWidget(height: _deviceHeight * 0.22, width: _deviceWidth, showTitle: false, gamesData: games2)
        ],
      ),
    );
  }

  Widget _topBarWidget() {
    return SizedBox(
      height: _deviceHeight * 0.13,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.menu,
            color: Colors.white,
            size: 30,
          ),
          Row(
            children: <Widget>[
              const Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(width: _deviceWidth * 0.03,),
              const Icon(
                Icons.notifications_none,
                color: Colors.white,
                size: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _featuredGamesInfoWidget() {
    return SizedBox(
      height: _deviceHeight * 0.12,
      width: _deviceWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            featuredGames[_selectedGame!].title,
            maxLines: 2,
            style: TextStyle(
              color: Colors.white,
              fontSize: _deviceHeight * 0.04,
            ),
          ),
          SizedBox(height: _deviceHeight * 0.003),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: featuredGames.map((game) {
              double circleRadius = _deviceHeight * 0.004;
              bool isActive = game.title == featuredGames[_selectedGame!].title;
              return Container(
                margin: EdgeInsets.only(right: _deviceWidth * 0.015),
                height: circleRadius * 2,
                width: circleRadius * 2,
                decoration: BoxDecoration(
                    color: isActive ? Colors.green : Colors.grey,
                    borderRadius: BorderRadius.circular(100)
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _featuredGameBannerWidget() {
    return Container(
      height: _deviceHeight * 0.13,
      width: _deviceWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("lib/images/11.jpg"),
        ),
      ),
    );
  }
}

