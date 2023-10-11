import 'package:appwrite/appwrite.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  String email = "";
  String password = "";
  String username = "";
  final client = Client()
      .setEndpoint('https://cloud.appwrite.io/v1') // Your API Endpoint
      .setProject('651de5a0d4c1158c8b2f'); // Your project ID

  GlobalKey<FormState> signupKey = GlobalKey();

  registerNewUser() async {
    emit(SignUpLoading());

    try {
      final account = Account(client);

      final user = await account.create(
        userId: ID.unique(),
        email: email,
        password: password,
        name: username,
      );
      emit(SignUpSuccess());
    } on AppwriteException catch (e) {
      print(e.toString());
      emit(SignUpFailure());
      // TODO
    }
  }

  loginUser(Account account) async {
    try {
      emit(SignInLoading());
      final account = Account(client);

      final session =
          await account.createEmailSession(email: email, password: password);
      emit(SignInSuccess());
    } on Exception catch (e) {
      emit(SignInFailure());
      // TODO
    }
  }
}
