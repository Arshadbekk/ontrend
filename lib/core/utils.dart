
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ontrend/models/user_model.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}

setSearchParam(String search) {
  List<String> searchList = [];
  for (int i = 0; i <= search.length; i++) {
    for (int j = i + 1; j <= search.length; j++) {
      searchList.add(search.substring(i, j).toUpperCase().trim());
    }
  }
  return searchList;
}

final currentUserProvider = StateProvider<UserModel?>((ref) {
  return null;
});
