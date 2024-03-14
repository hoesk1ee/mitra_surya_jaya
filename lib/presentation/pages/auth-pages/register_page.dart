import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mitra_surya_jaya/presentation/misc/colors.dart';
import 'package:mitra_surya_jaya/presentation/misc/paddings.dart';
import 'package:mitra_surya_jaya/presentation/misc/text_styles.dart';
import 'package:mitra_surya_jaya/presentation/widgets/custom_authbutton_widget.dart';
import 'package:mitra_surya_jaya/presentation/widgets/custom_textfield_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _repeatPasswordController = TextEditingController();
  final _phoneController = TextEditingController();
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
                  "Buat Akun",
                  style: AppTextStyle.titleTextStyle,
                ),
                const Gap(18),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 1.2,
                  child: const Text(
                    "Silahkan masukkan data lengkap untuk proses register.",
                    style: AppTextStyle.hintTextStyle,
                  ),
                ),
                const Gap(36),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextFieldWidget(
                        controller: _nameController,
                        hintText: "Nama",
                      ),
                      const Gap(16),
                      CustomTextFieldWidget(
                        controller: _phoneController,
                        hintText: "No. HP",
                      ),
                      const Gap(16),
                      CustomTextFieldWidget(
                        controller: _emailController,
                        hintText: "Email",
                      ),
                      const Gap(16),
                      CustomTextFieldWidget(
                        controller: _passwordController,
                        hintText: 'Kata Sandi',
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
                      ),
                      const Gap(16),
                      CustomTextFieldWidget(
                        controller: _repeatPasswordController,
                        hintText: 'Ulang Kata Sandi',
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
                      ),
                      const Gap(16),
                      CustomAuthButtonWidget(
                        onPressed: () {
                          context.go('/verification');
                        },
                        label: "Daftar",
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
