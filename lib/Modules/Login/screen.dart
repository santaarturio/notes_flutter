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

  LoginProps({
    required this.signUp,
    required this.back,
    required this.isLoginInProgress,
    required this.canSignUp,
    required this.login,
  });
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
      widget.props.login(
        _nameController.text,
        _emailController.text,
        _passwordController.text,
      );

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
                  Flexible(
                      child: Image.asset(
                    Theme.of(context).brightness == Brightness.light
                        ? 'images/main-logo-any.png'
                        : 'images/main-logo-dark.png',
                    width: 150,
                  )),
                  const Spacer(),
                  Visibility(
                      visible: widget.props.canSignUp == false,
                      child: _TextFormField(
                        labelText: 'Enter Your Name',
                        controller: _nameController,
                      )),
                  const SizedBox(height: 16),
                  _TextFormField(
                    labelText: 'Enter Your Email',
                    controller: _emailController,
                    validator: (value) => (value ?? "").trim().length < 5
                        ? 'This field requires a minimum of 5 characters'
                        : null,
                  ),
                  const SizedBox(height: 16),
                  _TextFormField(
                    labelText: 'Enter Your Password',
                    controller: _passwordController,
                    obscureText: true,
                    validator: (value) => (value ?? "").trim().length < 8
                        ? 'This field requires a minimum of 8 characters'
                        : null,
                  ),
                  const SizedBox(height: 64),
                  _LoginButton(
                    isLoginInProgress: widget.props.isLoginInProgress,
                    labelText: widget.props.canSignUp ? 'Sign In' : 'Sign Up',
                    onPressed: _login,
                  ),
                  const SizedBox(height: 16),
                  _SignUpButton(
                    visible: widget.props.canSignUp,
                    labelText: 'Sign Up',
                    onPressed: widget.props.signUp,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Visibility(
          visible: widget.props.canSignUp == false,
          child: BackButton(onPressed: widget.props.back)),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}

class _TextFormField extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;

  const _TextFormField({
    Key? key,
    required this.labelText,
    required this.controller,
    this.validator,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(color: Theme.of(context).primaryColor),
      decoration: InputDecoration(
        labelText: labelText,
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Theme.of(context).hintColor),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: Theme.of(context).errorColor,
            width: 2,
          ),
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  final bool isLoginInProgress;
  final String labelText;
  final void Function()? onPressed;

  const _LoginButton({
    Key? key,
    required this.isLoginInProgress,
    this.onPressed,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoginInProgress
        ? const CircularProgressIndicator()
        : SizedBox(
            width: double.infinity,
            height: 60,
            child: OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                textStyle: Theme.of(context).textTheme.button,
                primary: Theme.of(context).primaryColor,
                side: BorderSide(color: Theme.of(context).primaryColor),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
              child: Text(labelText),
            ),
          );
  }
}

class _SignUpButton extends StatelessWidget {
  final bool visible;
  final String labelText;
  final void Function()? onPressed;

  const _SignUpButton({
    Key? key,
    required this.visible,
    required this.labelText,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: SizedBox(
        height: 60,
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.button,
              primary: Theme.of(context).primaryColor),
          child: Text(labelText),
        ),
      ),
    );
  }
}
