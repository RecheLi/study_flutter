import 'package:flutter/material.dart';
import '../model/message.dart';

class WechatPage extends StatefulWidget {
  @override
  _WechatPageState createState() => _WechatPageState();
}

class _WechatPageState extends State<WechatPage> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  List<Message> messages=[];
  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    for (int i=0;i<10;i++) {
      Message m = Message(
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1584001177666&di=bd345563ad4c09784114650fdf57ba79&imgtype=0&src=http%3A%2F%2F33img.com%2Fupload%2Fimage%2F20170318%2F31800006700.jpg',
        '第${i+1}个美女',
        '请我吃饭 $i'
      );
      messages.add(m);
    }
    super.initState();
  }
  Widget _seperatorBuider(BuildContext context,int index) {
    return Divider(height: 0.5,indent: 64.0,color: Colors.black12,);
  }
  Widget _messageTtemBuider(BuildContext context,int index) {
    return GestureDetector(
      onTap: ()=>{
        Navigator.of(context).pushNamed('/chat')
      },
      child: Container(
          color: Colors.white,
          height: 60.0,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child:ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  child: Image.network(messages[index].imageUrl,fit: BoxFit.cover,height: 44,width: 44,),
                )
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(messages[index].name),
                    Text(messages[index].message),
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.black12,
              padding: EdgeInsets.all(4.0),
              height: 44.0,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child:TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'search',
                        hintStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none
                      ),
                      showCursor: false,
                      onTap: (){
                        Navigator.of(context).pushNamed('/search');
                      },
//                      focusNode: ,
                    )
                  )
                ],
              )
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: _seperatorBuider,
                itemCount: messages.length,
                itemBuilder: _messageTtemBuider,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
            ),)
          ],
        ),
      ),
    );
  }
}
