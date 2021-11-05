import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'source.g.dart';

@JsonSerializable()
class Source extends Equatable {
  const Source({
    required this.title,
    required this.slug,
    required this.url,
    required this.crawlRate,
  });

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);

  final String title;
  final String slug;
  final String url;

  @JsonKey(name: 'crawl_rate')
  final int crawlRate;

  Source copyWith({
    String? title,
    String? slug,
    String? url,
    int? crawlRate,
  }) =>
      Source(
        title: title ?? this.title,
        slug: slug ?? this.slug,
        url: url ?? this.url,
        crawlRate: crawlRate ?? this.crawlRate,
      );

  @override
  List<Object> get props => [
        title,
        slug,
        url,
        crawlRate,
      ];
}
