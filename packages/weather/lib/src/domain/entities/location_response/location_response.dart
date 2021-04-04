import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../enums/location_type.dart';

part 'location_response.g.dart';

@JsonSerializable()
class LocationResponse extends Equatable {
  LocationResponse({
    this.title,
    this.locationType,
    this.woeid,
    this.lattLong,
  });

  factory LocationResponse.fromJson(Map<String, dynamic> json) =>
      _$LocationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LocationResponseToJson(this);

  final String? title;
  final LocationType? locationType;
  final int? woeid;
  final String? lattLong;

  LocationResponse copyWith({
    String? title,
    LocationType? locationType,
    int? woeid,
    String? lattLong,
  }) =>
      LocationResponse(
        title: title ?? this.title,
        locationType: locationType ?? this.locationType,
        woeid: woeid ?? this.woeid,
        lattLong: lattLong ?? this.lattLong,
      );

  @override
  List<Object?> get props => [
        title,
        locationType,
        woeid,
        lattLong,
      ];
}
