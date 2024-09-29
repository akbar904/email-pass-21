
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.simple_cubit_app/cubits/auth_cubit.dart';

class LoginScreen extends StatelessWidget {
	const LoginScreen({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		final TextEditingController emailController = TextEditingController();
		final TextEditingController passwordController = TextEditingController();

		return Scaffold(
			appBar: AppBar(
				title: Text('Login'),
			),
			body: Padding(
				padding: const EdgeInsets.all(16.0),
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						TextField(
							key: Key('emailField'),
							controller: emailController,
							decoration: InputDecoration(
								labelText: 'Email',
							),
						),
						SizedBox(height: 16.0),
						TextField(
							key: Key('passwordField'),
							controller: passwordController,
							decoration: InputDecoration(
								labelText: 'Password',
							),
							obscureText: true,
						),
						SizedBox(height: 32.0),
						ElevatedButton(
							key: Key('loginButton'),
							onPressed: () {
								final String email = emailController.text;
								final String password = passwordController.text;
								context.read<AuthCubit>().login(email, password);
							},
							child: Text('Login'),
						),
					],
				),
			),
		);
	}
}
