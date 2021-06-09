
import 'package:appnation_demo_project/core/extension/network_extension.dart';
import 'package:appnation_demo_project/core/constants/enums/network_service_enum.dart';
import 'package:appnation_demo_project/core/init/network/network_manager.dart';
import 'package:appnation_demo_project/model/reddit_model.dart';

class RedditService {
  static RedditService? _instance;

  static RedditService? get instance {
    _instance ??= RedditService._init();
    return _instance;
  }

  RedditService._init();

  final NetworkManager? _networkManager = NetworkManager.instance;

  Future getList() async {
    List<ShareModel> dataList=[];
    var res = await _networkManager!
        .dioGetMap(path: ServicePath.URL.rawValue, isList: true );
      for(var data in res["data"]["children"]){
        dataList.add(ShareModel(
          author: data["data"]["author"],
          title: data["data"]["title"],
          subreddit: data["data"]["subreddit"],
          selftext: data["data"]["selftext"],
          thumbnail: data["data"]["thumbnail"],
          score: data["data"]["score"],
          url: data["data"]["url"]
        ));
      }
    return dataList;

  }
}
