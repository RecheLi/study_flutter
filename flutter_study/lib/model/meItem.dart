import 'package:flutter/cupertino.dart';

class MeItem {
  Icon icon;
//  String menuImageName;
  String menuTitle;
  String avatarUrl;
  String userName;
  String weChatID;
  MeItem(this.icon,this.menuTitle,{this.userName,this.avatarUrl,this.weChatID});
}