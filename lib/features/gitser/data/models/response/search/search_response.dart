import 'package:flutter_gitser/features/gitser/data/models/response/users/user_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_response.g.dart';

@JsonSerializable()
class SearchResponse {
  final int? totalCount;
  final bool? incompleteResults;
  final List<UserResponseItem>? items;

  SearchResponse({
    this.totalCount,
    this.incompleteResults,
    this.items,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}
