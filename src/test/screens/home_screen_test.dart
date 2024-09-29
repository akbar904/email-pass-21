
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_cubit_app/screens/home_screen.dart';
import 'package:simple_cubit_app/cubits/auth_cubit.dart';
import 'package:simple_cubit_app/cubits/auth_state.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		late AuthCubit authCubit;

		setUp(() {
			authCubit = MockAuthCubit();
		});

		testWidgets('displays Logout button', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AuthCubit>(
						create: (context) => authCubit,
						child: HomeScreen(),
					),
				),
			);

			expect(find.text('Logout'), findsOneWidget);
			expect(find.byType(ElevatedButton), findsOneWidget);
		});

		testWidgets('tapping Logout button triggers logout', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AuthCubit>(
						create: (context) => authCubit,
						child: HomeScreen(),
					),
				),
			);

			await tester.tap(find.text('Logout'));
			await tester.pump();

			verify(() => authCubit.logout()).called(1);
		});
	});
}
