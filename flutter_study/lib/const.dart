import 'package:flutter/material.dart';
import './pages/discover.dart';
import './pages/me.dart';
import './pages/wechat.dart';
import './pages/contact.dart';
import 'model/meItem.dart';

final pages = [
  WechatPage(),
  ContactPage(),
  DiscoverPage(),
  MePage()
];
final titles = [
  '微信',
  '通讯录',
  '发现',
  ''
];

final meItemIconSize = 30.0;

final meItems = [
  MeItem(Icon(Icons.person,color: Colors.grey,size: meItemIconSize,), '',weChatID: 'xxx',avatarUrl: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1584038172699&di=10e3e490ce985a82f7a4b4de9dfa16e9&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201806%2F01%2F20180601112640_kqitp.jpg',userName: '星月小美女'),
  MeItem(Icon(Icons.payment,color: Colors.green,size: meItemIconSize,), '支付'),
  MeItem(Icon(Icons.collections,color: Colors.redAccent,size: meItemIconSize), '收藏'),
  MeItem(Icon(Icons.photo,color: Colors.blueAccent,size: meItemIconSize), '相册'),
  MeItem(Icon(Icons.face,color: Colors.yellow,size: meItemIconSize), '表情'),
  MeItem(Icon(Icons.settings,color: Colors.blue,size: meItemIconSize), '设置'),

];