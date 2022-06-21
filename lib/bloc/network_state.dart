import 'package:flutter/cupertino.dart';

@immutable
abstract class NetworkState{}

class Init extends NetworkState{}

class Loading extends NetworkState{}

class Failed extends NetworkState{}

class Success extends NetworkState{
  final Map<String, dynamic>? message;

  Success(this.message);
}

class Fetched extends NetworkState{
  final dynamic data;

  Fetched(this.data);
}
