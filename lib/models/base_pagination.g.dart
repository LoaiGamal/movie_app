// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasePagination _$BasePaginationFromJson(Map<String, dynamic> json) =>
    BasePagination(
      json['dates'] as Map<String, dynamic>?,
      (json['page'] as num?)?.toInt(),
      (json['results'] as List<dynamic>?)
          ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['total_pages'] as num?)?.toInt(),
      (json['total_results'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BasePaginationToJson(BasePagination instance) =>
    <String, dynamic>{
      'dates': instance.dates,
      'page': instance.page,
      'results': instance.movies,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
