import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mitra_surya_jaya/presentation/misc/paddings.dart';
import 'package:mitra_surya_jaya/presentation/misc/text_styles.dart';
import 'package:mitra_surya_jaya/presentation/widgets/custom_authbutton_widget.dart';
import 'package:mitra_surya_jaya/presentation/widgets/custom_textfield_widget.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
                  "Lupa Password",
                  style: AppTextStyle.titleTextStyle,
                ),
                const Gap(18),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 1.2,
                  child: const Text(
                    "Silahkan masukkan email yang terdaftar untuk proses reset password.",
                    style: AppTextStyle.hintTextStyle,
                  ),
                ),
                const Gap(36),
                Form(
                  child: CustomTextFieldWidget(
                    controller: _emailController,
                    hintText: "Email",
                  ),
                ),
                const Gap(36),
                CustomAuthButtonWidget(
                  label: "Reset Password",
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
