import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:tastemix/dummy/dummy.dart';
import 'package:tastemix/view/bottomnavigation/account.dart';
import 'package:tastemix/view/bottomnavigation/favorite.dart';

class Home extends StatefulWidget {
  static final Title = 'salomon_bottom_bar';
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Create a GlobalKey for the Scaffold
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List bottombar = [Home(), Favorite(), SettingsPage(), MyAccount()];
  @override
  Widget build(BuildContext context) {
    var _currentIndex = 0;
    return Scaffold(
      key: _scaffoldKey, // Assign the GlobalKey to the Scaffold
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(15)),
            child: IconButton(
              icon:
                  Icon(Icons.settings), // Change this icon to your desired one
              onPressed: () {
                // Open the drawer using the GlobalKey
                _scaffoldKey.currentState?.openDrawer();
              },
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Perform action when item 1 is clicked
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Perform action when item 2 is clicked
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  ' Food Recipes',
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold, fontSize: 40),
                ),
              ),
            ],
          ),
          Sliderss(
            switchLanguage: (String) {},
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text("North Indian Recipe",
                style: GoogleFonts.akshar(
                    fontWeight: FontWeight.bold, fontSize: 25)),
          )
          Expanded(child: GridView.count(crossAxisCount: 2,
          children: [
            List.generate(4, (index) => null)
          ],))
        ],
      ),
    


      
      
      // Container(
      //   padding: EdgeInsets.all(12.0),
      //   child: CarouselSlider(
      //       items: [
      //         Container(
      //           decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(20),
      //               image: DecorationImage(
      //                 image: AssetImage("assets/images/pizza.jpg"),
      //                 fit: BoxFit.fill,
      //               )),
      //         ),
      //         Container(
      //           decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(20),
      //               image: DecorationImage(
      //                   image: AssetImage("assets/images/image2.jpg"),
      //                   fit: BoxFit.fill)),
      //         ),
      //         Container(
      //           decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(20),
      //               image: DecorationImage(
      //                   image: AssetImage("assets/images/image3.jpg"),
      //                   fit: BoxFit.fill)),
      //         ),
      //         Container(
      //           decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(20),
      //               image: DecorationImage(
      //                   image: AssetImage("assets/images/image4.jpg"),
      //                   fit: BoxFit.fill)),
      //         ),
      //       ],
      //       options: CarouselOptions(
      //           //height: 400
      //           aspectRatio: 16 / 9,
      //           //   viewportFraction: .8,
      //           initialPage: 1, //initial page by default 0
      //           enableInfiniteScroll: true,
      //           autoPlay: true,
      //           autoPlayCurve: Curves.linear,
      //           autoPlayInterval: Duration(seconds: 4),
      //           // enlargeCenterPage: true,
      //           scrollDirection: Axis.horizontal)),
      // ),

      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() {
          _currentIndex = i;
          print(_currentIndex);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => bottombar[i]));
        }),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.purple,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text("Likes"),
            selectedColor: Colors.pink,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }

  void _openSettingsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SettingsPage()),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Text('Settings Page Content'),
      ),
    );
  }
}

void _Homemenu(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Home()),
  );
}
