import 'package:flutter/material.dart';
import '../const.dart';

class MePage extends StatefulWidget {
  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  Widget _itemBuider(BuildContext context, int index) {
    if (index==0) {
      return _profile(context, index);
    }
    return ListTile(
      leading: meItems[index].icon,
      title: Text(meItems[index].menuTitle,textAlign: TextAlign.left,),
      trailing: Icon(Icons.keyboard_arrow_right),
    );
  }
  Widget _profile(BuildContext context, int index) {
    return Container(
      height: 80,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(left: 10.0),
        child:Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 25.0,
              child: Image.network(meItems[index].avatarUrl,width: 50,height: 50.0,fit: BoxFit.cover,),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(meItems[index].weChatID),
                  Text('微信号:'+ meItems[index].userName),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: meItems.length,
          itemBuilder: _itemBuider,
        ),
      )
    );
  }
}
