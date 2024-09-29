
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
	AuthCubit() : super(AuthInitial());

	void login(String email, String password) {
		// Simulate a login process
		if (email.isNotEmpty && password.isNotEmpty) {
			emit(Authenticated());
		} else {
			emit(Unauthenticated());
		}
	}

	void logout() {
		emit(Unauthenticated());
	}
}
