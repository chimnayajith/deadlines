import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.freezed.dart';
part 'user_data.g.dart';

@freezed
class UserData with _$UserData {
  const factory UserData({
    required String userId,
    required String displayName,
    required String emailAddress,
    String? profileImage,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}










// class User {
//   String userId;
//   String username;
//   String email;
//   String password;
//   // Additional fields like displayName, profileImage, etc.

//   User({
//     required this.userId,
//     required this.username,
//     required this.email,
//     required this.password,
//   });
// }
// class Group {
//   String groupId;
//   String groupName;
//   List<User> users;

//   Group({
//     required this.groupId,
//     required this.groupName,
//     required this.users,
//   });
// }
// class Event {
//   String eventId;
//   String eventName;
//   DateTime eventDate;
//   String groupId;
//   List<String> tags;

//   Event({
//     required this.eventId,
//     required this.eventName,
//     required this.eventDate,
//     required this.groupId,
//     required this.tags,
//   });
// }
// class DueDate {
//   String dueDateId;
//   String taskName;
//   DateTime dueDate;
//   String groupId;
//   List<String> tags;

//   DueDate({
//     required this.dueDateId,
//     required this.taskName,
//     required this.dueDate,
//     required this.groupId,
//     required this.tags,
//   });
// }
