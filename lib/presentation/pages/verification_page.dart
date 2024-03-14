import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mitra_surya_jaya/presentation/misc/colors.dart';
import 'package:mitra_surya_jaya/presentation/misc/paddings.dart';
import 'package:mitra_surya_jaya/presentation/misc/text_styles.dart';
import 'package:mitra_surya_jaya/presentation/widgets/custom_authbutton_widget.dart';
import 'package:qr_flutter/qr_flutter.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

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
                  "Verifikasi Akun",
                  style: AppTextStyle.titleTextStyle,
                ),
                const Gap(18),
                const Text(
                  "Akun berhasil dibuat. Silahkan tunjukkan QR code pada admin untuk menverifikasi akun.",
                  style: AppTextStyle.hintTextStyle,
                ),
                const Gap(36),
                Center(
                  child: CustomPaint(
                    foregroundPainter: BorderPainter(),
                    child: QrImageView(
                        data: "1231231234567",
                        eyeStyle: const QrEyeStyle(
                          eyeShape: QrEyeShape.square,
                          color: AppColor.mainOrangeColor,
                        ),
                        dataModuleStyle: const QrDataModuleStyle(
                          dataModuleShape: QrDataModuleShape.square,
                          color: AppColor.mainOrangeColor,
                        ),
                        version: QrVersions.auto,
                        size: 200),
                  ),
                ),
                const Gap(36),
                CustomAuthButtonWidget(
                  label: "Ke Halaman Utama",
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

class BorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double sh = size.height;
    double sw = size.width;
    double cornerSide = sh * 0.1;

    Paint paint = Paint()
      ..color = AppColor.mainOrangeColor
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Path path = Path()
      ..moveTo(cornerSide, 0)
      ..quadraticBezierTo(0, 0, 0, cornerSide)
      ..moveTo(0, sh - cornerSide)
      ..quadraticBezierTo(0, sh, cornerSide, sh)
      ..moveTo(sw - cornerSide, sh)
      ..quadraticBezierTo(sw, sh, sw, sh - cornerSide)
      ..moveTo(sw, cornerSide)
      ..quadraticBezierTo(sw, 0, sw - cornerSide, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
