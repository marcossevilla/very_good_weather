import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../enums/location_type.dart';

part 'location_response.g.dart';

@JsonSerializable()
class LocationResponse extends Equatable {
  LocationResponse({
    required this.title,
    required this.locationType,
    required this.woeid,
    required this.lattLong,
  });

  factory LocationResponse.fromJson(Map<String, dynamic> json) =>
      _$LocationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LocationResponseToJson(this);

  final String title;
  final LocationType locationType;
  final int woeid;
  final String lattLong;

  LocationResponse copyWith({
    required String title,
    required LocationType locationType,
    required int woeid,
    required String lattLong,
  }) =>
      LocationResponse(
        title: this.title,
        locationType: this.locationType,
        woeid: this.woeid,
        lattLong: this.lattLong,
      );

  @override
  List<Object> get props => [
        title,
        locationType,
        woeid,
        lattLong,
      ];
}
