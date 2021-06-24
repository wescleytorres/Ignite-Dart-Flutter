import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:split_it/theme/app_theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                style: GoogleFonts.montserrat(
                  color: AppTheme.colors.green_500,
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                )),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 40),
                child: ListTile(
                  leading: Image.asset('assets/images/emoji.png'),
                  title: Text(
                    "Faça seu login com uma das contas abaixo",
                    style: GoogleFonts.inter(
                      color: AppTheme.colors.gray_500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.fromBorderSide(
                          BorderSide(color: AppTheme.colors.gray_20))),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(
                                    color: AppTheme.colors.gray_20))),
                        width: 56,
                        height: 56,
                        child: Image.asset('assets/images/google.png'),
                      ),
                      Expanded(child: Container()),
                      Text(
                        "Entrar com Google",
                        style: GoogleFonts.inter(
                          color: AppTheme.colors.gray_500,
                          fontSize: 16,
                        ),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.fromBorderSide(
                          BorderSide(color: AppTheme.colors.gray_20))),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(
                                    color: AppTheme.colors.gray_20))),
                        width: 56,
                        height: 56,
                        child: Image.asset('assets/images/apple.png'),
                      ),
                      Expanded(child: Container()),
                      Text(
                        "Entrar com Apple",
                        style: GoogleFonts.inter(
                          color: AppTheme.colors.gray_500,
                          fontSize: 16,
                        ),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
