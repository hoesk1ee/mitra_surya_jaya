import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:mitra_surya_jaya/presentation/misc/colors.dart';
import 'package:mitra_surya_jaya/presentation/misc/text_styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 64, 18, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Mitra Surya Jaya",
                style: AppTextStyle.titleTextStyle,
              ),
              const Gap(18),
              SizedBox(
                width: MediaQuery.sizeOf(context).width / 1.2,
                child: const Text(
                  "Selamat datang, silahkan masukkan email dan kata sandi untuk proses log in.",
                  style: AppTextStyle.hintTextStyle,
                ),
              ),
              const Gap(36),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColor.textFieldColor,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 18),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: AppColor.shadowColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: AppColor.mainOrangeColor,
                          ),
                        ),
                        hintText: "Email",
                        hintStyle: AppTextStyle.hintTextStyle,
                      ),
                    ),
                    const Gap(16),
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColor.textFieldColor,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 18),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: AppColor.shadowColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: AppColor.mainOrangeColor,
                          ),
                        ),
                        hintText: "Password",
                        hintStyle: AppTextStyle.hintTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(16),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Lupa Password?",
                    style: AppTextStyle.mainColorTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
