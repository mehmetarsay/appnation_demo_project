// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reddit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShareModel _$RedditModelFromJson(Map<String, dynamic> json) {
  return ShareModel(
    author: json['author'] as String?,
    title: json['title'] as String?,
    subreddit: json['subreddit'] as String?,
    selftext: json['selftext'] as String?,
    thumbnail: json['thumbnail'] as String?,
    score: json['score'] as int?,
    url: json['url'] as String?,
  )..preview = json['preview'];
}

Map<String, dynamic> _$RedditModelToJson(ShareModel instance) =>
    <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'subreddit': instance.subreddit,
      'selftext': instance.selftext,
      'thumbnail': instance.thumbnail,
      'preview': instance.preview,
      'score': instance.score,
      'url': instance.url,
    };
