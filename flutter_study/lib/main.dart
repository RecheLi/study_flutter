import 'package:flutter/material.dart';
import 'const.dart';
import 'loading.dart';
import 'router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wechat',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: MainPage(),
      routes: routers,
//      onGenerateRoute: onGenerateRoute,
    );
  }
}

class MainPage extends StatefulWidget {
  var _currentIndex = 0;

  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void _updateIndex(index) {
    setState(() {
      widget._currentIndex = index;
    });
  }

  void _showMenu() {
    showMenu(
      color: Colors.black38,
        context: context,
        position: RelativeRect.fromLTRB(500, 76.0, 10, 0),
        items: <PopupMenuEntry>[
          PopupMenuItem(
            child: Column(
              children: <Widget>[
                _popItem('发起群聊'),
                _popItem('扫一扫'),
              ],
            ),
          ),
        ]
    );
  }

  Widget _appBarRightButton() {
    switch (widget._currentIndex) {
      case 0:
        return IconButton(
          icon: Icon(Icons.add_circle_outline),
          onPressed: ()=>{
            _showMenu()
          },
        );
        break;
      case 1:
        return IconButton(
          icon: Icon(Icons.person_add),
          onPressed: ()=>{
          },
        );
        break;
      case 2:
        return Container(
          width: 0,height: 0,
        );
        break;
      case 3:
        return IconButton(
          icon: Icon(Icons.camera_alt),
          onPressed: ()=>{
          },
        );
        break;
      default:
        break;
    }
  }

  Widget _popItem(String title, {String imageName, IconData icon}) {
    return PopupMenuItem(
      child: Row(
        children: <Widget>[
          imageName!=null ?
          Image.asset(imageName,width: 32.0,height: 32.0,) :SizedBox(
                width: 32.0,
                height: 32.0,
                child: Icon(icon,color: Colors.white),
          ),
          Container(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[widget._currentIndex]),
        backgroundColor: Colors.white,
        actions: <Widget>[
          _appBarRightButton()
        ],

      ),
      body: pages[widget._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: widget._currentIndex,
        items: [
          BottomNavigationBarItem(
            title: Text('微信',style: TextStyle(color: widget._currentIndex==0?Colors.greenAccent:Colors.black)),
            icon: Icon(Icons.message,color: widget._currentIndex==0?Colors.greenAccent: Colors.black,size: 20.0,),

          ),
          BottomNavigationBarItem(
            title: Text('联系人',style: TextStyle(color:widget._currentIndex==1?Colors.greenAccent: Colors.black)),
            icon: Icon(Icons.contact_phone,color: widget._currentIndex==1?Colors.greenAccent:Colors.black,size: 20.0),
          ),
          BottomNavigationBarItem(
            title: Text('发现',style: TextStyle(color: widget._currentIndex==2?Colors.greenAccent:Colors.black)),
            icon: Icon(Icons.star,color: widget._currentIndex==2?Colors.greenAccent:Colors.black,size: 20.0),
          ),
          BottomNavigationBarItem(
            title: Text('我',style: TextStyle(color:widget._currentIndex==3?Colors.greenAccent: Colors.black)),
            icon: Icon(Icons.settings,color:widget._currentIndex==3?Colors.greenAccent: Colors.black,size: 20.0),
          ),
        ],
        onTap: (int index) {
          _updateIndex(index);
        },
      ),
    );
  }
}
