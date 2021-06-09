
import 'package:appnation_demo_project/core/base/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reddit_model.g.dart';

@JsonSerializable()
class ShareModel extends BaseModel {
  ShareModel({
    this.author,
    this.title,
    this.subreddit,
    this.selftext,
    this.thumbnail,
    this.score,
    this.url,
    this.preview
  });

  String? author;
  String? title;
  String? subreddit;
  String? selftext;
  String? thumbnail;
  dynamic preview;
  int? score;
  String? url;

  @override
  fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

}
