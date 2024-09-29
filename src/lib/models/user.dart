
class User {
	final String email;
	final String password;

	User({required this.email, required this.password})
		: assert(email.isNotEmpty, 'Email cannot be empty'),
		  assert(password.isNotEmpty, 'Password cannot be empty');
}
