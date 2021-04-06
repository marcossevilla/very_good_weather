import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../enums/location_type.dart';

part 'location_response.g.dart';

@JsonSerializable()
class LocationResponse extends Equatable {
  LocationResponse({
    required this.woeid,
    required this.title,
    required this.lattLong,
    required this.locationType,
  });

  factory LocationResponse.fromJson(Map<String, dynamic> json) =>
      _$LocationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LocationResponseToJson(this);

  final int woeid;

  final String title;

  @JsonKey(name: 'latt_long')
  final String lattLong;

  @JsonKey(defaultValue: LocationType.city)
  final LocationType locationType;

  LocationResponse copyWith({
    required int woeid,
    required String title,
    required String lattLong,
    required LocationType locationType,
  }) =>
      LocationResponse(
        woeid: this.woeid,
        title: this.title,
        lattLong: this.lattLong,
        locationType: this.locationType,
      );

  @override
  List<Object> get props => [
        woeid,
        title,
        lattLong,
        locationType,
      ];
}
