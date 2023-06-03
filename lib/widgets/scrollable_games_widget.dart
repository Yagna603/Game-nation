import 'package:flutter/material.dart';
import '../pages/data.dart';

class ScrollableGamesWidget extends StatelessWidget {

  final double height;
  final double width;
  final bool showTitle;
  final List<Game> gamesData;

  ScrollableGamesWidget({required this.height, required this.width, required this.showTitle, required this.gamesData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: gamesData.map((game) {
          return Container(
            height: height,
            width: width * 0.35,
            padding: EdgeInsets.only(right: width * 0.03),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: height * 0.80,
                  width: width * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(game.coverImage.url),
                      ),
                  ),
                ),
                showTitle ? Text(
                  game.title,
                  maxLines: 2,
                  style: TextStyle(color: Colors.white, fontSize: height * 0.08),
                ) : Container(),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
