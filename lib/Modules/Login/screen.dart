// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// MARK: - Props
class LoginProps {
  final bool isLoginInProgress;
  final bool canSignUp;
  final void Function() signUp;
  final void Function() back;
  final void Function(String? name, String email, String password) login;

  LoginProps(
      {required this.signUp,
      required this.back,
      required this.isLoginInProgress,
      required this.canSignUp,
      required this.login});
}

// MARK: - Screen
class LoginScreen extends StatefulWidget {
  final LoginProps props;
  const LoginScreen({Key? key, required this.props}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    final bool? isValid = _formKey.currentState?.validate();

    if (isValid ?? false) {
      widget.props.login(_nameController.text, _emailController.text,
          _passwordController.text);

      if (Navigator.canPop(context)) {
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Center(
                  child: Column(
                    children: [
                      _logo(),
                      const Spacer(),
                      _nameTextFormField(),
                      const SizedBox(height: 16),
                      _emailTextFormField(),
                      const SizedBox(height: 16),
                      _passwordTextFormField(),
                      const SizedBox(height: 64),
                      _loginButton(),
                      const SizedBox(height: 16),
                      _signUpButton(),
                    ],
                  ),
                ),
              ))),
      floatingActionButton: widget.props.canSignUp
          ? Container()
          : BackButton(onPressed: widget.props.back),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }

  _logo() {
    return Flexible(child: Image.asset('images/main-logo-any.png', width: 150));
  }

  _nameTextFormField() {
    return widget.props.canSignUp
        ? const SizedBox()
        : _textFormField((_) => null, _nameController, 'Enter Your Name');
  }

  _emailTextFormField() {
    return _textFormField((value) {
      return (value ?? "").trim().length < 5
          ? 'This field requires a minimum of 5 characters'
          : null;
    }, _emailController, 'Enter Your Email');
  }

  _passwordTextFormField() {
    return _textFormField((value) {
      return (value ?? "").trim().length < 8
          ? 'This field requires a minimum of 8 characters'
          : null;
    }, _passwordController, 'Enter Your Password', obscureText: true);
  }

  _textFormField(String? Function(String?) validator,
      TextEditingController controller, String labelText,
      {bool obscureText = false}) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Colors.black)),
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Colors.red, width: 2))),
    );
  }

  _loginButton() {
    return widget.props.isLoginInProgress
        ? const CircularProgressIndicator()
        : SizedBox(
            width: double.infinity,
            height: 60,
            child: OutlinedButton(
                onPressed: _login,
                style: OutlinedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 18),
                    primary: Colors.black,
                    side: const BorderSide(color: Colors.black),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)))),
                child: widget.props.canSignUp
                    ? const Text('Sign In')
                    : const Text('Sign Up')),
          );
  }

  _signUpButton() {
    return widget.props.canSignUp
        ? SizedBox(
            height: 60,
            child: TextButton(
                onPressed: widget.props.signUp,
                style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 18),
                    primary: Colors.black),
                child: const Text('Sign Up')),
          )
        : Container();
  }
}
