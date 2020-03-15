
import 'package:flutter/material.dart';
import './pages/discover.dart';
import './pages/me.dart';
import './pages/wechat.dart';
import './pages/contact.dart';
import 'model/meItem.dart';
import 'model/discoverItem.dart';

double ScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double ScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

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

final discoverItemIconSize = 25.0;
final discoverItems = [
  DiscoverItem(Icon(Icons.swap_vertical_circle,color: Color(0xFFF9A825),size: discoverItemIconSize,), '朋友圈'),
  DiscoverItem(Icon(Icons.videocam,color: Color(0xFFF9A825),size: discoverItemIconSize,), '视频号'),
  DiscoverItem(Icon(Icons.scanner,color: Colors.blueAccent,size: discoverItemIconSize), '扫一扫'),
  DiscoverItem(Icon(Icons.location_on,color: Colors.redAccent,size: discoverItemIconSize), '附近的餐厅'),
  DiscoverItem(Icon(Icons.games,color: Colors.yellow,size: discoverItemIconSize), '游戏'),
  DiscoverItem(Icon(Icons.apps,color: Colors.blue,size: discoverItemIconSize), '小程序'),
];