import 'package:appwrite/models.dart';

class CheckUserIfExistsState {}

final class CheckUserIfExistsInitial extends CheckUserIfExistsState {}

final class UserExists extends CheckUserIfExistsState {
  final User user;

  UserExists({required this.user});
}

final class NoUserFound extends CheckUserIfExistsState {}
