
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.simple_cubit_app/screens/login_screen.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('LoginScreen Widget Tests', () {
		testWidgets('should display email and password fields and login button', (WidgetTester tester) async {
			await tester.pumpWidget(MaterialApp(home: LoginScreen()));

			expect(find.byType(TextField), findsNWidgets(2)); // email and password fields
			expect(find.byType(ElevatedButton), findsOneWidget); // login button
			expect(find.text('Login'), findsOneWidget); // button text
		});
	});

	group('AuthCubit Tests', () {
		late MockAuthCubit mockAuthCubit;

		setUp(() {
			mockAuthCubit = MockAuthCubit();
		});

		blocTest<MockAuthCubit, AuthState>(
			'login emits Authenticated state when successful',
			build: () => mockAuthCubit,
			act: (cubit) => cubit.login('test@example.com', 'password'),
			expect: () => [isA<Authenticated>()],
		);

		blocTest<MockAuthCubit, AuthState>(
			'login emits Unauthenticated state when failed',
			build: () => mockAuthCubit,
			act: (cubit) => cubit.login('wrong@example.com', 'wrongpassword'),
			expect: () => [isA<Unauthenticated>()],
		);
	});
}
