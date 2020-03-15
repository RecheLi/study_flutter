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
        Navigator.of(context).pushNamed('/chat',arguments: {'navTitle':messages[index].name})
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
                  child: Image.network(messages[index].avatarUrl,fit: BoxFit.cover,height: 44,width: 44,),
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
        color: Colors.black12,
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: (){
                Navigator.of(context).pushNamed('/search');
              },
              child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(4.0))
                  ),
                  height: 44.0,
                  child: Row(
//                crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          alignment:Alignment.center,
                          child: Center(
                            child: Icon(Icons.search,color: Colors.black12,textDirection: TextDirection.ltr,),
                          )
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text('搜索',style: TextStyle(color: Colors.black12),),
                      ),
//                  Container(
//                    child: Expanded(
//                      child: TextField(
//                      textAlign: TextAlign.center,
//                        textAlignVertical: TextAlignVertical.center,
//                        decoration: InputDecoration(
//                            hintText: '搜索',
//                            hintStyle: TextStyle(color: Colors.black12),
//                            border: InputBorder.none
//                        ),
//                        showCursor: false,
//                        onTap: (){
//                          Navigator.of(context).pushNamed('/search');
//                        },
//                      ),
//                    ),
//                  )
                    ],
                  ),
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
