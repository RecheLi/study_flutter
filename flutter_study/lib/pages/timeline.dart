import 'package:flutter/material.dart';
import 'package:flutterstudy/const.dart';

class TimelinePage extends StatefulWidget {
  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  ScrollController _scrollController;
  double elevation = 0;
  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    _scrollController = ScrollController();
    _scrollController.addListener((){
        if(_scrollController.position.pixels>64){
          setState(() {
            elevation = 0.5;
          });
        } else {
          setState(() {
            elevation = 0;
          });
        }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  Widget _timelineBuilder(BuildContext context,int index) {
    if (index==0) {
      return Container(
        height: ScreenWidth(context)*0.25,
        color: Colors.yellow,
      );
    }
    return GestureDetector(
      child: Container(
          margin: EdgeInsets.only(top: 10.0),
          child:Padding(
          padding: EdgeInsets.only(left: 10.0),
          child:  Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                child: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1584266497574&di=c5ec5dca67a87d54fc0024381c881492&imgtype=0&src=http%3A%2F%2Fp0.ifengimg.com%2Fa%2F2016_53%2Fbc37e4cdf282d72_size123_w900_h605.jpg',width:50,height:50,fit: BoxFit.cover,),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('名字',style: TextStyle(color: Color(0xFF1565C0)),),
                    Text('哈哈哈哈哈哈',style: TextStyle(color: Colors.black),),
                    Image.network(
                      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1584267692372&di=e856868b6d45f26c541a838cdb481e39&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F73a186eff0c15ca0bcda54f8448ddcb247521d03de60e-vglQb9_fw658',
                      width: MediaQuery.of(context).size.width-120,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
  Widget _dividerBiulder(BuildContext context,int index) {
    return Divider(
      indent: 60.0,
      height: 0.5,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.yellow,
        elevation: elevation,
        centerTitle: true,
        actions: <Widget>[
          Padding(padding: EdgeInsets.only(right: 15.0),child: Icon(Icons.camera_alt,color: Colors.white,),)
        ],
      ),
      body: Container(
        alignment: Alignment.centerLeft,
        child: ListView.separated(
          itemCount: 10,
          itemBuilder: _timelineBuilder,
          separatorBuilder: _dividerBiulder,
          controller: _scrollController,

        )
      )
    );
  }
}
