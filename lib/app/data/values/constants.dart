import 'package:flutter/material.dart';

class Timeouts {
  Timeouts._privateConstructor();

  static const CONNECT_TIMEOUT = Duration(milliseconds: 10000);
  static const RECEIVE_TIMEOUT = Duration(milliseconds: 10000);
}

class GlobalKeys {
  GlobalKeys._privateConstructor();

  static final navigationKey = GlobalKey<NavigatorState>();
}

enum VariableType { indicator, value }
