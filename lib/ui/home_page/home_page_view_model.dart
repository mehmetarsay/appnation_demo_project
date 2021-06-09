import 'package:appnation_demo_project/model/reddit_model.dart';
import 'package:appnation_demo_project/service/reddit_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageViewMopdel extends ChangeNotifier {
  final RedditService? _redditService = RedditService.instance;
  List<ShareModel> dataList = [];
  bool? wait=true;
  getData(BuildContext context) async{
    if(wait==true){
      var response = await _redditService!.getList();
      dataList.clear();
      for(var a in response){
        dataList.add(a);
      }
      this.wait = false;
      notifyListeners();
    }

  }
}