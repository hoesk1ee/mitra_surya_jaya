import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mitra_surya_jaya/presentation/misc/colors.dart';
import 'package:mitra_surya_jaya/presentation/misc/text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 24, 18, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 28,
                    ),
                    const Gap(12),
                    RichText(
                      text: TextSpan(
                        text: "Selamat Pagi,",
                        style: DefaultTextStyle.of(context).style.copyWith(
                              height: 1.2,
                              fontSize: 14,
                            ),
                        children: [
                          TextSpan(
                            text: "\nJohn Doe",
                            style: AppTextStyle.titleTextStyle.copyWith(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Gap(22),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    color: AppColor.mainOrangeColor,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(22, 18, 22, 18),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Omset",
                              style: AppTextStyle.titleTextStyle.copyWith(
                                color: AppColor.mainWhiteColor,
                                fontSize: 21,
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: "Rp ",
                                style: AppTextStyle.titleTextStyle.copyWith(
                                    fontFamily: "Poppins", fontSize: 14),
                                children: [
                                  TextSpan(
                                    text: "20.000.000",
                                    style: AppTextStyle.titleTextStyle.copyWith(
                                      fontSize: 32,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Gap(22),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: AppColor.profitColor,
                                        width: 2,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.expand_less,
                                      color: AppColor.profitColor,
                                    ),
                                  ),
                                  const Gap(8),
                                  Text(
                                    "20%",
                                    style: AppTextStyle.titleTextStyle.copyWith(
                                      color: AppColor.mainWhiteColor,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                              const Gap(4),
                              Text(
                                "Dibanding Kemarin",
                                style: AppTextStyle.titleTextStyle.copyWith(
                                  color: AppColor.mainWhiteColor,
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
