import 'package:email_validator/email_validator.dart';
import 'package:flutter_diet_planner/views/screens/bottom_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = 'login-page';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  late SharedPreferences logindata;
  late bool newUser;

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    logindata = await SharedPreferences.getInstance();
    newUser = logindata.getBool('login') ?? true;

    if (newUser == false) {
      if (context.mounted) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomNavigation(),
            ),
            (route) => false);
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.account_circle_rounded),
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                  filled: true,
                  labelStyle: TextStyle(color: Colors.black),
                ),
                validator: (value) {
                  if (value != null && value.length < 4) {
                    return 'Minimal 4 karakter';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_rounded),
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                  filled: true,
                  labelStyle: TextStyle(color: Colors.black),
                ),
                validator: (email) {
                  if (email != null && !EmailValidator.validate(email)) {
                    return 'Masukkan email yang benar';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                  filled: true,
                  labelStyle: TextStyle(color: Colors.black),
                ),
                validator: (value) {
                  if (value != null && value.length < 8) {
                    return 'Minimal 8 karakter';
                  } else {
                    return null;
                  }
                },
                obscureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  final isValidForm = formKey.currentState!.validate();
                  String username = _nameController.text;
                  if (isValidForm) {
                    logindata.setBool('login', false);
                    logindata.setString('username', username);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BottomNavigation(),
                        ),
                        (route) => false);
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
