import 'package:flutter/material.dart';
import 'package:flutterstudy/pages/search.dart';
import 'pages/contact.dart';
import 'pages/discover.dart';
import 'pages/wechat.dart';
import 'pages/me.dart';
import 'pages/chat.dart';
import 'pages/timeline.dart';
import 'main.dart';

final routers = {
  '/wechat':(context)=>WechatPage(),
  '/discover':(context)=>DiscoverPage(),
  '/me':(context)=>MePage(),
  '/contact':(context)=>ContactPage(),
  '/search':(context)=>SearchPage(),
  '/chat':(context)=>ChatPage(),
  '/timeline':(context)=>TimelinePage()
};

var onGenerateRoute = (RouteSettings settings) {

};
