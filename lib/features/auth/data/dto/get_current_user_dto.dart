
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/auth_entity.dart';
part 'get_current_user_dto.g.dart';

@JsonSerializable()
class GetCurrentUserDto {
  @JsonKey(name:"_id")
  final String id;
  final String email;
  final String phone;
  final String username;

  GetCurrentUserDto({
    required this.id,
    required this.email,
    required this.phone,
    required this.username,
  });

  AuthEntity toEntity() {
    return AuthEntity(
        id: id,
        email: email,
        phone: phone,
        username: username,
        password: ''
    );
  }

  factory GetCurrentUserDto.fromJson(Map<String, dynamic> json) =>
      _$GetCurrentUserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetCurrentUserDtoToJson(this);
}
