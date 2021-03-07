import 'package:flutter/material.dart';
import 'package:haritham_noel/notifiers/auth_notifier.dart';
import 'package:haritham_noel/pages/login_page.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:haritham_noel/pages/reports/new_form.dart';
import 'package:provider/provider.dart';

import 'package:haritham_noel/pages/reports/reports_list.dart';
import 'home/CategoryPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 60,
        // backgroundColor: Colors.green[400],
        elevation: 0,
        centerTitle: true,
        // iconTheme: IconThemeData(color: Colors.white),
        title: Image(
          image: AssetImage('assets/img/haritham-w.png'),
          height: 40,
        ),
        actions: [
          Icon(Icons.notifications_active),
        ],
        //Text("ഹരിതം", textAlign: TextAlign.center, style: TextStyle(color:Colors.green,fontSize: 25, fontWeight: FontWeight.bold)),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                // color: Colors.white,
              ),
              child: Text(
                '',
                style: TextStyle(
                  // color: Colors.grey,
                  fontSize: 24,
                ),
              ),
           ),
            ListTile(
              leading: Icon(Icons.login),
              title: Text('Official Login'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            ListTile(
              leading: Icon(Icons.report),
              title: Text('Reports'),
             onTap: () {
             Navigator.push(context,
                 new MaterialPageRoute(builder: (context) => ReportListPage()));
             },
            ),
             ListTile(
              leading: Icon(Icons.logout),
              title: Text('Signout'),
             onTap: () {
             context.read<AuthNotifier>().signOut();
             Navigator.pushAndRemoveUntil(
                 context,
                 MaterialPageRoute(builder: (_) => LoginPage()),
                 (route) => false);
           },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
      // physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          ListTile(
            tileColor: Colors.grey[700],
            title: Text(
              'ഹരിത നിയമ ലംഘനങ്ങൾ',
              style: TextStyle(
                // color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            trailing: RaisedButton(
              // color: Colors.white,
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => CategoryPage()));
              },
              child: Text(
                "കൂടുതൽ\nഅറിയാൻ",
                // style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
            ),
          ),
           SizedBox(
            height: 10,
          ),
          CarouselWithIndicatorDemo(),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            padding: const EdgeInsets.all(17.0),
            // textColor: Colors.white,
            // color: Colors.green,
            onPressed: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => NewReportForm()));
            },
            child: new Text("നിയമ ലംഘനം റിപ്പോർട്ട് ചെയ്യാം"),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
      ),
    );
  }
}

class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.map((url) {
            int index = imgList.indexOf(url);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index
                    ? Color.fromRGBO(0, 0, 0, 0.9)
                    : Color.fromRGBO(0, 0, 0, 0.4),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}

final List<String> imgList = [
  'assets/banners/bw1.jpg',
  'assets/banners/bw2.jpg',
  'assets/banners/bw3.jpg',
  'assets/banners/bw4.jpg',
  'assets/banners/bw5.jpg',
  'assets/banners/bw6.jpg',
  'assets/banners/bw7.jpg',
  'assets/banners/bw8.jpg',
];
const List<String> CatList = const [
  'ഖരമാലിന്യം വലിച്ചെറിയൽ',
  'ഖരമാലിന്യം കത്തിക്കൽ',
  'അശാസ്ത്രീയമായി സംസ്കരിക്കൽ',
  'ദ്രവമാലിന്യം അലക്ഷ്യമായി ഒഴുക്കിവിടൽ',
  'മലിനജല സംസ്കരണ സംവിധാനങ്ങളുടെ അഭാവം',
  'ഇറച്ചിമാലിന്യ സംസ്കരണം',
  'ശുചിത്വ സംവിധാനങ്ങളുടെ അഭാവം',
  'ഭക്ഷണപദാർത്ഥങ്ങളുമായി ബന്ധപ്പെട്ടവ',
];
final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image(image: AssetImage(item)),
                    //   Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          CatList[imgList.indexOf(item)],
                          textAlign: TextAlign.center,
                          // '${imgList.indexOf(item)} നിയമ ലംഘനങ്ങൾ',
                          style: TextStyle(
                            // color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();
