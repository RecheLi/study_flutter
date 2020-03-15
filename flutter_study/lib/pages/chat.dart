import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/chatModel.dart';

class ChatPage extends StatefulWidget {
  String navTitle;
  ChatPage({this.navTitle});
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  List<ChatModel> _chatArray = [];
  void _getChatData(){
    for (int i=0;i<20;i++) {
      ChatModel chatModel;
      if (i % 2 == 0) {
        chatModel = ChatModel(
          recieverName: 'lisa',
          recieverAvatar: 'http://img1.imgtn.bdimg.com/it/u=544573273,2539515276&fm=26&gp=0.jpg',
          recieverUUID: 'lisa',
          senderName: '易烊千玺',
          senderAvatar: 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1258547700,1864488122&fm=26&gp=0.jpg',
          senderUUID: 'linitial',
        );
      } else {
        chatModel = ChatModel(
          senderName: 'lisa',
          senderAvatar: 'http://img1.imgtn.bdimg.com/it/u=544573273,2539515276&fm=26&gp=0.jpg',
          senderUUID: 'lisa',
          recieverName: '易烊千玺',
          recieverAvatar: 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1258547700,1864488122&fm=26&gp=0.jpg',
          recieverUUID: 'linitial',
        );
      }
      _chatArray.add(chatModel);
    }
  }

  Widget _chatBuilder(BuildContext context,int index) {
    return Container(
      child: Row(
        mainAxisAlignment:currentUUID==_chatArray[index].senderUUID ? MainAxisAlignment.start: MainAxisAlignment.end,
        children: currentUUID==_chatArray[index].senderUUID ? <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Image.network(_chatArray[index].senderAvatar,width: 45.0,height: 45.0,fit: BoxFit.cover,),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text('😂哈哈哈')
          )
        ]: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Text('😂哈哈哈')
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Image.network(_chatArray[index].recieverAvatar,width: 45.0,height: 45.0,fit: BoxFit.cover,),
            ),
          ),

        ],
      ),
    );
  }

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    _getChatData();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dynamic obj = ModalRoute.of(context).settings.arguments;
    widget.navTitle = obj['navTitle'];
    return Scaffold(
      appBar: AppBar(title: Text(widget.navTitle),backgroundColor: Colors.white,iconTheme: IconThemeData(opacity: 0.5),),
      body: Container(
        child:ListView.builder(
          itemCount: _chatArray.length,
          itemBuilder: _chatBuilder,
        )
      ),
    );
  }
}
