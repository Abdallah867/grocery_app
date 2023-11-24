import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:bloc/bloc.dart';

import 'check_user_if_exists_state.dart';

class CheckUserIfExistsCubit extends Cubit<CheckUserIfExistsState> {
  CheckUserIfExistsCubit() : super(CheckUserIfExistsInitial());

  Future<User?> getUserIfExists() async {
    Client client = Client();
    Account account = Account(client);

    client
            .setEndpoint('https://cloud.appwrite.io/v1') // Your API Endpoint
            .setProject('651de5a0d4c1158c8b2f') // Your project ID
        ;

    try {
      final user = await account.get();
      emit(UserExists(user: user));
    } on AppwriteException catch (e) {
      if (e.code != 401 || e.type != 'general_unauthorized_scope') rethrow;
      emit(NoUserFound());
    }
    return null;
  }
}
