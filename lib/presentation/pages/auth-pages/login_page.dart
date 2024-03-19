import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mitra_surya_jaya/presentation/misc/colors.dart';
import 'package:mitra_surya_jaya/presentation/misc/paddings.dart';
import 'package:mitra_surya_jaya/presentation/misc/text_styles.dart';
import 'package:mitra_surya_jaya/presentation/providers/auth_provider.dart';
import 'package:mitra_surya_jaya/presentation/widgets/custom_authbutton_widget.dart';
import 'package:mitra_surya_jaya/presentation/widgets/custom_textfield_widget.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppPadding.authPadding,
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
                      CustomTextFieldWidget(
                        controller: _emailController,
                        hintText: "Email",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Silahkan isi email terlebih dahulu!';
                          }
                          return null;
                        },
                      ),
                      const Gap(16),
                      CustomTextFieldWidget(
                        controller: _passwordController,
                        hintText: 'Password',
                        obscure: isObscure,
                        suffix: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                          child: Icon(
                            isObscure
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: AppColor.mainOrangeColor,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Silahkan isi password terlebih dahulu!';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const Gap(16),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      context.go("/login/forgot-password");
                    },
                    child: const Text(
                      "Lupa password?",
                      style: AppTextStyle.mainColorTextStyle,
                    ),
                  ),
                ),
                const Gap(64),
                CustomAuthButtonWidget(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      final authRead = context.read<AuthProvider>();

                      await authRead.userLogin().then((value) {
                        context.go('/home');
                      });
                    }
                  },
                  label: "Masuk",
                ),
                const Gap(24),
                Center(
                  child: Column(
                    children: [
                      const Text(
                        "Belum memiliki akun?",
                        style: AppTextStyle.smallSizeTextStyle,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.go('/login/register');
                        },
                        child: const Text(
                          "Daftar disini",
                          style: AppTextStyle.mainColorTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
