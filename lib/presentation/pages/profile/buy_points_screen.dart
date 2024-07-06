// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puntossmart/infrastructure/services/local_storage.dart';
import 'package:puntossmart/presentation/components/buttons/custom_button.dart';
import 'package:puntossmart/presentation/pages/profile/buy_history_screen.dart';
import 'package:puntossmart/presentation/pages/profile/controller/package_controller.dart';
import 'package:puntossmart/presentation/theme/app_style.dart';

class BuyPointsScreen extends StatefulWidget {
  const BuyPointsScreen({
    super.key,
  });

  @override
  State<BuyPointsScreen> createState() => _BuyPointsScreenState();
}

class _BuyPointsScreenState extends State<BuyPointsScreen> {
  PackageController packageController = Get.put(PackageController());
  int points = 0;
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _refreshPackages() async {
    await packageController.getPackages();
    await packageController.getBuyHistory();
  }

  @override
  Widget build(BuildContext context) {
    final bool isLtr = LocalStorage.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
          backgroundColor: AppStyle.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppStyle.bgGrey,
            leading: IconButton(
              splashRadius: 18.0,
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                isLtr
                    ? FlutterRemix.arrow_left_s_line
                    : FlutterRemix.arrow_right_s_line,
                size: 24.0,
                color: AppStyle.black,
              ),
            ),
            title: Text(
              'Buy Puntos Smart',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
                color: AppStyle.black,
                letterSpacing: -0.4,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BuyHistoryScreen()));
                },
                icon: Icon(
                  FlutterRemix.history_line,
                  color: AppStyle.black,
                ),
              )
            ],
          ),
          body: Obx(() {
            if (packageController.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppStyle.brandGreen,
                ),
              );
            }

            final packages =
                packageController.packageModel.value?.packages ?? [];

            if (packages.isEmpty) {
              return Center(
                child: Text(
                  'No Package Found',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0,
                    color: AppStyle.black,
                  ),
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: _refreshPackages,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final package = packages[index];
                  return buyPointCard(
                    onClick: () async {
                      showBottomSheet(
                          context: context,
                          builder: (context) => Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 10,
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.30,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                  color: AppStyle.recommendBg,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Are you sure to buy this Puntos Smart?",
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16.0,
                                        color: AppStyle.black,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: CustomButton(
                                            background: AppStyle.transparent,
                                            borderColor: AppStyle.borderColor,
                                            title: "No",
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(child: Obx(() {
                                          return packageController
                                                  .requestLoding.value
                                              ? const Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: AppStyle.brandGreen,
                                                  ),
                                                )
                                              : CustomButton(
                                                  title: "Yes",
                                                  onPressed: () {
                                                    packageController
                                                        .sendBuyRequest(
                                                      context,
                                                      packageID:
                                                          package.id ?? 0,
                                                      packageName:
                                                          package.packageName ??
                                                              "",
                                                      points:
                                                          package.points ?? 0,
                                                      pens: package.pens ?? 0,
                                                    );
                                                  },
                                                );
                                        })),
                                      ],
                                    )
                                  ],
                                ),
                              ));
                    },
                    points: package.points ?? 0,
                    packageName: package.packageName ?? "",
                    pens: package.pens?.toString() ?? "0",
                    bgColor: Color(int.parse("0xff${package.bgColor}")),
                  );
                },
                itemCount: packages.length,
              ),
            );
          })),
    );
  }

  Widget buyPointCard({
    required int points,
    required String packageName,
    required pens,
    required Color bgColor,
    required Function() onClick,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.17,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: bgColor,
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "$points",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 22.0,
                            color: AppStyle.white,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Punto Smart",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            fontSize: 28.0,
                            color: AppStyle.brandGreen,
                          ),
                        ),
                        Image.asset(
                          "assets/images/add.png",
                          width: 40,
                          height: 40,
                        ),
                      ],
                    ),
                    Text(
                      packageName,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        color: AppStyle.black,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppStyle.bgGrey,
                      ),
                      child: Text(
                        "$pens PEN",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 15.0,
                          color: AppStyle.black,
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
}
