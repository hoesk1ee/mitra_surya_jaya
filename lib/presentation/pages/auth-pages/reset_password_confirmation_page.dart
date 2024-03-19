import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mitra_surya_jaya/presentation/misc/paddings.dart';
import 'package:mitra_surya_jaya/presentation/misc/text_styles.dart';
import 'package:mitra_surya_jaya/presentation/widgets/custom_authbutton_widget.dart';

class ResetPasswordConfirmationPage extends StatelessWidget {
  const ResetPasswordConfirmationPage({super.key});

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
                  "Reset Password Berhasil",
                  style: AppTextStyle.titleTextStyle,
                ),
                const Gap(18),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 1.2,
                  child: const Text(
                    "Silahkan cek email yang terdaftar untuk proses reset password.",
                    style: AppTextStyle.hintTextStyle,
                  ),
                ),
                const Gap(36),
                CustomAuthButtonWidget(
                  label: "Ke Halaman Utama",
                  onPressed: () {
                    context.go('/home');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
