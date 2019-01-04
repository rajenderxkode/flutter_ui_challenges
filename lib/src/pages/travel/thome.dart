import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/src/pages/travel/tdestination.dart';

class TravelHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Hello Raj Kumar,", style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold
                      )),
                      Text("Where do you want to go?",style: TextStyle(
                        color: Colors.grey.shade700
                      ),)
                    ],
                  ),
                  CircleAvatar(backgroundImage: AssetImage('assets/img/7.jpg'), radius: 40,)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
              child: Material(
                elevation: 5.0,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Find destination",
                    prefixIcon: Icon(Icons.location_on),
                    border: InputBorder.none
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (_) => DestinationPage()
                ));
              },
              child: _buildFeaturedItem(image: 'assets/travel/kathmandu1.jpg', title: "Kathmandu", subtitle: "90 places worth to visit")),
            _buildFeaturedItem(image: 'assets/travel/fewalake.jpg',title: "Pokhara", subtitle: "40 places worth to visit"),
            _buildItem(title: "Jomsom"),
            _buildItem(title: "Palpa"),
            _buildItem(title: "Namche"),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.location_searching),
            title: Text("Discover")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            title: Text("Popular")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text("Settings")
          ),
        ],
      ),
    );
  }

  Widget _buildItem({String title}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        elevation: 5.0,
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Text(title, style: TextStyle(
            fontSize: 20.0,
          )),
        ),
      ),
    );
  }

  Container _buildFeaturedItem({String image, String title, String subtitle}) {
    return Container(
            padding: EdgeInsets.only(left:16.0, top: 8.0, right: 16.0, bottom: 16.0),
            child: Material(
              elevation: 5.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.asset(image, fit: BoxFit.cover,)),
                  Positioned(
                    right: 10.0,
                    top: 10.0,
                    child: IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.favorite_border, color: Colors.white),
                    ),
                  ),
                  Positioned(
                    bottom: 20.0,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal:16.0,vertical: 8.0),
                      color: Colors.black.withOpacity(0.7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(title, style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold
                          )),
                          Text(subtitle, style: TextStyle(
                            color: Colors.white
                          ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}