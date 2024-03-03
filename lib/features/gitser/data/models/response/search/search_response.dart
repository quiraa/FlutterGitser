import 'package:flutter_gitser/features/gitser/data/models/response/search/search_result.dart';
import 'package:flutter_gitser/features/gitser/data/models/response/users/user_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_response.g.dart';

@JsonSerializable()
class SearchResponse {
  final int? total_count;
  final bool? incomplete_results;
  final List<SearchResult>? items;

  SearchResponse({
    this.total_count,
    this.incomplete_results,
    this.items,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}
