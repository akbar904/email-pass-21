
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.simple_cubit_app/cubits/auth_state.dart';

void main() {
	group('AuthState Tests', () {
		test('AuthInitial is an instance of AuthState', () {
			expect(AuthInitial(), isA<AuthState>());
		});

		test('Authenticated is an instance of AuthState', () {
			expect(Authenticated(), isA<AuthState>());
		});

		test('Unauthenticated is an instance of AuthState', () {
			expect(Unauthenticated(), isA<AuthState>());
		});
	});

	group('AuthState Props', () {
		test('AuthInitial has correct props', () {
			expect(AuthInitial().props, []);
		});

		test('Authenticated has correct props', () {
			expect(Authenticated().props, []);
		});

		test('Unauthenticated has correct props', () {
			expect(Unauthenticated().props, []);
		});
	});
}
