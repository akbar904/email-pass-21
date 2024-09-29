
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:your_project_name/models/user.dart';

void main() {
	group('User Model', () {
		test('should create a User instance with given email and password', () {
			final user = User(email: 'test@example.com', password: 'password123');

			expect(user.email, 'test@example.com');
			expect(user.password, 'password123');
		});

		test('should fail if email is not provided', () {
			expect(() => User(email: '', password: 'password123'), throwsAssertionError);
		});

		test('should fail if password is not provided', () {
			expect(() => User(email: 'test@example.com', password: ''), throwsAssertionError);
		});
	});
}
