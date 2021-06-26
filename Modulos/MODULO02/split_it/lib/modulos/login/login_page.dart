import 'package:flutter/material.dart';
import 'package:split_it/modulos/login/login_controller.dart';
import 'package:split_it/modulos/login/login_service.dart';
import 'package:split_it/modulos/login/login_state.dart';
import 'package:split_it/modulos/login/widgets/social_button.dart';
import 'package:split_it/theme/app_theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController controller;

  @override
  void initState() {
    controller = LoginController(
        service: LoginServiceImpl(),
        onUpdate: () {
          if (controller.state is LoginStateSucess) {
            final user = (controller.state as LoginStateSucess).user;
            Navigator.pushReplacementNamed(context, "/home", arguments: user);
          }
          setState(() {});
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 236,
            margin: EdgeInsets.only(left: 40),
            child: Text("Divida suas contas com seus amigos",
                style: AppTheme.textstyles.title),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 40),
                child: ListTile(
                  leading: Image.asset('assets/icons/emoji.png'),
                  title: Text(
                    "Faça seu login com uma das contas abaixo",
                    style: AppTheme.textstyles.button,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              if (controller.state is LoginStateLoading) ...[
                CircularProgressIndicator(),
              ] else if (controller.state is LoginStateError) ...[
                Text((controller.state as LoginStateError).message)
              ] else
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: SocialButtonWidget(
                    imagePath: 'assets/icons/google.png',
                    label: "Entrar com Google",
                    onTap: () {
                      controller.googleSignIn();
                    },
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
