import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mitra_surya_jaya/data/db/auth_repository.dart';
import 'package:mitra_surya_jaya/presentation/misc/colors.dart';
import 'package:mitra_surya_jaya/presentation/misc/text_styles.dart';
import 'package:mitra_surya_jaya/presentation/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 24, 18, 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///* User Profile Widget
              Row(
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
                  const Spacer(),
                  IconButton(
                    onPressed: () async {
                      await context.read<AuthProvider>().userLogout();
                      context.go('/');
                    },
                    icon: Icon(Icons.logout),
                  ),
                ],
              ),

              ///* Turnover Card Widget
              const Gap(22),
              _buildCard(
                context,
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Omset Hari Ini",
                          style: AppTextStyle.titleTextStyle.copyWith(
                            color: AppColor.mainWhiteColor,
                            fontSize: 17,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: "Rp",
                            style: AppTextStyle.titleTextStyle
                                .copyWith(fontFamily: "Poppins", fontSize: 14),
                            children: [
                              TextSpan(
                                text: "20.000.000",
                                style: AppTextStyle.titleTextStyle.copyWith(
                                  fontSize: 28,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColor.profitColor,
                                    width: 1,
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Icon(
                                    Icons.moving_outlined,
                                    size: 17,
                                    color: AppColor.profitColor,
                                  ),
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
                              fontSize: 11,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(14),
              const Text(
                "Aktivitas Terbaru",
                style: AppTextStyle.titleTextStyle,
              ),
              const Gap(8),
              _buildCard(
                context,
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pelanggan Hari Ini",
                          style: AppTextStyle.titleTextStyle.copyWith(
                            color: AppColor.mainWhiteColor,
                            fontSize: 17,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.people,
                              color: AppColor.mainWhiteColor,
                              size: 32,
                            ),
                            const Gap(8),
                            Text(
                              "23",
                              style: AppTextStyle.titleTextStyle.copyWith(
                                color: AppColor.mainWhiteColor,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const Gap(22),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColor.profitColor,
                                    width: 1,
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Icon(
                                    Icons.moving_outlined,
                                    size: 17,
                                    color: AppColor.profitColor,
                                  ),
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
                              fontSize: 11,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(18),
              Expanded(
                child: GridView.count(
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  crossAxisCount: 2,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.go('/home/report');
                      },
                      child: _buildCard(
                        context,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.description,
                              size: 48,
                              color: AppColor.mainWhiteColor,
                            ),
                            const Gap(8),
                            Text(
                              "Cek Laporan",
                              style: AppTextStyle.titleTextStyle.copyWith(
                                color: AppColor.mainWhiteColor,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.go("/home/transaction");
                      },
                      child: _buildCard(
                        context,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.receipt_long,
                              size: 48,
                              color: AppColor.mainWhiteColor,
                            ),
                            const Gap(8),
                            Text(
                              "Cek Transaksi",
                              style: AppTextStyle.titleTextStyle.copyWith(
                                color: AppColor.mainWhiteColor,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildCard(BuildContext context, Widget child) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: AppColor.mainOrangeColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(22, 18, 22, 18),
        child: child,
      ),
    );
  }
}