import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:leaderboard/src/login/provider/login_provider.dart';
import 'package:leaderboard/src/login/widget/input_field.dart';
import 'package:leaderboard/src/providers/notification_provider.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    final size = MediaQuery.of(context).size;

    return Consumer<LoginProvider>(builder: (context, auth, child) {
      print(auth.errorMessage);
      if (auth.errorMessage != null) {
        Provider.of<NotificationProvider>(context, listen: false)
            .showNotification(
          context,
          auth.errorMessage!,
        );
      }

      return Form(
        key: _globalKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width,
              child: Text(
                'TPIH',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size.height * 0.05,
                ),
              ),
            ),
            const Gap(25),
            InputField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a username';
                }
                return null;
              },
              controller: _userController,
              hintText: 'User',
            ),
            const Gap(25),
            InputField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                } else if (value.length <= 6) {
                  return 'Password must be more than 6 characters';
                }
                return null;
              },
              controller: _passwordController,
              isPassword: true,
              hintText: 'Password',
            ),
            const Gap(20),
            Container(
              width: size.width * 0.1,
              height: size.height * 0.04,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Log in',
                  style: TextStyle(
                    color: Color.fromARGB(255, 47, 28, 81),
                  ),
                ),
                onPressed: () {
                  if (_globalKey.currentState?.validate() ?? false) {
                    loginProvider.login(
                      _userController.text,
                      _passwordController.text,
                    );
                  }
                },
              ),
            )
          ],
        ),
      );
    });
  }
}
