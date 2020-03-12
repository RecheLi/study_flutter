import 'package:flutter/material.dart';

class Message  {
  String imageUrl;
  String name;
  String message;
  Message(String imageUrl,String name,String message) {
    this.imageUrl = imageUrl;
    this.name = name;
    this.message = message;
  }
}