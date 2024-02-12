// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';

// final List<String> imgList = [
//   'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
//   'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
//   'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
//   'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
//   'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
//   'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
// ];

// void main() => runApp(CarouselDemo());

// final themeMode = ValueNotifier(2);

// class CarouselDemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//       builder: (context, value, g) {
//         return MaterialApp(
//           initialRoute: '/',
//           darkTheme: ThemeData.dark(),
//           themeMode: ThemeMode.values.toList()[value as int],
//           debugShowCheckedModeBanner: false,
//           routes: {
//             '/': (ctx) => CarouselDemoHome(),
//             '/basic': (ctx) => BasicDemo(),
//           },
//         );
//       },
//       valueListenable: themeMode,
//     );
//   }
// }

// class DemoItem extends StatelessWidget {
//   final String title;
//   final String route;
//   DemoItem(this.title, this.route);

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(title),
//       onTap: () {
//         Navigator.pushNamed(context, route);
//       },
//     );
//   }
// }

// class CarouselDemoHome extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Carousel demo'),
//         actions: [
//           IconButton(
//               icon: Icon(Icons.nightlight_round),
//               onPressed: () {
//                 themeMode.value = themeMode.value == 1 ? 2 : 1;
//               })
//         ],
//       ),
//       body: ListView(
//         children: <Widget>[
//           DemoItem('Basic demo', '/basic'),
//         ],
//       ),
//     );
//   }
// }

// class BasicDemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Basic demo')),
//       body: Container(
//         child: CarouselSlider(
//           options: CarouselOptions(),
//           items: imgList.map((imageUrl) {
//             return Container(
//               child: Center(
//                 child: Image.network(
//                   imageUrl,
//                   fit: BoxFit.cover,
//                   width: double.infinity,
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Sliderss extends StatefulWidget {
  final Function(String) switchLanguage;
  Sliderss({Key? key, required this.switchLanguage}) : super(key: key);
  @override
  State<Sliderss> createState() => _HomePageState();
}

class _HomePageState extends State<Sliderss> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.red, width: 5)),
            child: CarouselSlider.builder(
              itemCount: 5,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://carousels-ads.swiggy.com/images/slider/2.jpg'),
                          fit: BoxFit.cover)),
                );
              },
              options: CarouselOptions(
                autoPlay: true,
                height: 230.0,
                // enlargeCenterPage: true,
                aspectRatio: 0,
                // autoPlayCurve: Curves.easeIn,
                enableInfiniteScroll: true,
                viewportFraction: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
