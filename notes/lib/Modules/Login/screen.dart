// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/Modules/Login/sign_up_connector.dart';

// MARK: - Props
class LoginProps {
  final bool isLoginInProgress;
  final bool canSignUp;
  final void Function(String? name, String email, String password) login;

  LoginProps(this.isLoginInProgress, this.canSignUp, this.login);
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

  String _name = "";
  String _email = "";
  String _password = "";

  void _login() {
    final bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      widget.props.login(_name, _email, _password);

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
          : BackButton(onPressed: () {
              Navigator.of(context).pop();
            }),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }

  _logo() {
    return Flexible(
      child: Image.asset(
        'images/main-logo-any.png',
        width: 150,
      ),
    );
  }

  _nameTextFormField() {
    return widget.props.canSignUp
        ? const SizedBox()
        : _textFormField((name) {
            _name = name;
          }, (value) {
            return null;
          }, 'Enter Your Name');
  }

  _emailTextFormField() {
    return _textFormField((email) {
      _email = email;
    }, (value) {
      return (value ?? "").trim().length < 5
          ? 'This field requires a minimum of 5 characters'
          : null;
    }, 'Enter Your Email');
  }

  _passwordTextFormField() {
    return _textFormField((password) {
      _password = password;
    }, (value) {
      return (value ?? "").trim().length < 8
          ? 'This field requires a minimum of 8 characters'
          : null;
    }, 'Enter Your Password', obscureText: true);
  }

  _textFormField(Function(String) onChanged,
      String? Function(String?) validator, String labelText,
      {bool obscureText = false}) {
    return TextFormField(
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator,
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
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SignUpConnector()));
              },
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 18),
                primary: Colors.black,
              ),
              child: const Text('Sign Up'),
            ),
          )
        : Container();
  }
}