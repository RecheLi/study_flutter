import 'package:flutter/material.dart';
import '../const.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  @override
  void initState() {
    _controller = AnimationController(duration: Duration(seconds: 10),value: 0.7, vsync: this);
    _animation = Tween(begin: 10.0,end: 100.0).animate(_controller);
    _controller.addListener(_animationListener);
    Future.delayed(Duration(seconds: 1),(){ // 动画测试
      _controller.forward();
    });
    super.initState();
  }
  @override
  void didUpdateWidget(DiscoverPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _animationListener() {
    setState(() {

    });
  }
  Widget _dividerBuilder(BuildContext context, int index){
    return Divider(
      height: 8.0,
      color: Color(0xFFEEEEEE),
    );
  }
  Widget _dicoverItemBuilder(BuildContext context, int index){
    return GestureDetector(
        onTap: ()=>{
          
        },
        child: Container(
          padding: EdgeInsets.only(left: 10.0),
          height: 50.0,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              discoverItems[index].icon,
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(discoverItems[index].menuTitle),
              ),
              Spacer(
                flex: 2,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.keyboard_arrow_right,color: Colors.black12),
              )
            ],
          ),
        ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFEEEEEE),
      child: ListView.separated(
          itemBuilder: _dicoverItemBuilder,
          separatorBuilder: _dividerBuilder,
          itemCount: discoverItems.length),
    );
  }
}
