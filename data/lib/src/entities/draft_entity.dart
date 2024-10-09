import 'package:json_annotation/json_annotation.dart';

part 'draft_entity.g.dart';

@JsonSerializable()
class DraftEntity {
  @JsonKey(name: 'data')
  final String draft;

  const DraftEntity({
    required this.draft,
  });

  factory DraftEntity.fromJson(Map<String, dynamic> json) =>
      _$DraftEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DraftEntityToJson(this);
}
