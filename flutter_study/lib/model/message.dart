import 'package:flutter/material.dart';

class Message  {
  String avatarUrl;
  String name;
  String message;
  Message(String avatarUrl, String name, String message) {
    this.avatarUrl = avatarUrl;
    this.name = name;
    this.message = message;
  }
}