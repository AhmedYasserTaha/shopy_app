import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shopy_app/common/widgets/button/app_button.dart';
import 'package:shopy_app/core/service/service_lecator.dart';
import 'package:shopy_app/data/model/auth/create_user_rep.dart';
import 'package:shopy_app/domain/useCases/auth/sing_up.dart';
import 'package:shopy_app/presentation/auth/page/login_page.dart';

class CreateAccountWidget extends StatefulWidget {
  const CreateAccountWidget({
    super.key,
    required this.fullName,
    required this.email,
    required this.password,
  });

  final TextEditingController fullName;
  final TextEditingController email;
  final TextEditingController password;

  @override
  State<CreateAccountWidget> createState() => _CreateAccountWidgetState();
}

class _CreateAccountWidgetState extends State<CreateAccountWidget> {
  bool isLoading = false; // متغير للتحكم في حالة التحميل

  Future<void> _createAccount() async {
    setState(() {
      isLoading = true;
    });

    try {
      final result = await serviceLecator<SignUpUseCase>().call(
        params: CreateUserRep(
          fullName: widget.fullName.text.trim(),
          email: widget.email.text.trim(),
          password: widget.password.text.trim(),
        ),
      );

      result.fold(
        (l) {
          log("Sign Up Error: $l");
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(l)));
        },
        (r) {
          log("Sign Up Successful");

          // عرض رسالة تفيد بإنشاء الحساب
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Account created successfully, LogIn now"),
              backgroundColor: Colors.green,
            ),
          );

          // توجيه المستخدم إلى صفحة تسجيل الدخول
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginPage()),
            (route) => false,
          );
        },
      );
    } catch (e) {
      log("Exception during sign up: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: isLoading ? null : _createAccount, // تعطيل الزر أثناء اللودينج
      title: "Create account",
      isLoading: isLoading, // تمرير حالة التحميل للزر
      style: const TextStyle(color: Colors.white),
    );
  }
}
