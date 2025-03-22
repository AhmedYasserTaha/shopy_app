import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shopy_app/common/widgets/appbar/app_bar_button.dart';
import 'package:shopy_app/common/widgets/button/app_button.dart';
import 'package:shopy_app/presentation/auth/page/sign_up_page.dart';
import 'package:shopy_app/presentation/auth/widget/bottom_navigation_bar_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarWidget(
        title: "not a member ?",
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        titleBotton: "register now",
        styleBotton: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.blue,
        ),
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => const SignUpPage()));
        },
      ),
      appBar: AppBarButton(
        title: SvgPicture.asset(
          "assets/vectors/spotify_logo.svg",
          height: 40,
          width: 40,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 45),
        child: Column(
          children: [
            const Text(
              "Sign in",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const Gap(70),
            emailFeild(context),
            const Gap(16),
            passwordFeild(context),
            const Gap(61),
            AppButton(onPressed: () {}, title: "Login"),
          ],
        ),
      ),
    );
  }

  Widget emailFeild(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: "Enter Email",
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget passwordFeild(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: "Password",
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }
}
