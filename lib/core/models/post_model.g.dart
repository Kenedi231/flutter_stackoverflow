// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) {
  return PostModel(
    (json['tags'] as List)?.map((e) => e as String)?.toList(),
    json['is_answered'] as bool,
    json['view_count'] as int,
    json['answer_count'] as int,
    json['score'] as int,
    json['last_activity_date'] == null
        ? null
        : DateTime.parse(json['last_activity_date'] as String),
    json['creation_date'] == null
        ? null
        : DateTime.parse(json['creation_date'] as String),
    json['question_id'] as int,
    json['link'] as String,
    json['title'] as String,
  )..owner = json['owner'] as Map<String, dynamic>;
}

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'tags': instance.tags,
      'owner': instance.owner,
      'is_answered': instance.is_answered,
      'view_count': instance.view_count,
      'answer_count': instance.answer_count,
      'score': instance.score,
      'last_activity_date': instance.last_activity_date?.toIso8601String(),
      'creation_date': instance.creation_date?.toIso8601String(),
      'question_id': instance.question_id,
      'link': instance.link,
      'title': instance.title,
    };
