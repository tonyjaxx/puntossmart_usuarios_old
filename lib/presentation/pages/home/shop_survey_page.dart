import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puntossmart/infrastructure/services/local_storage.dart';
import 'package:puntossmart/presentation/pages/home/controller/shop_survey_controller.dart';
import 'package:puntossmart/presentation/pages/home/survey_question_answer_screen.dart';
import 'package:puntossmart/presentation/theme/app_style.dart';

// ignore: must_be_immutable
class ShopSurveyPage extends StatelessWidget {
  final String shopName;
  final String imageUrl;
  final int shopID;
  ShopSurveyPage({
    super.key,
    required this.shopName,
    required this.imageUrl,
    required this.shopID,
  });

  ShopSurveyController shopSurveyController = Get.put(ShopSurveyController());

  @override
  Widget build(BuildContext context) {
    final bool isLtr = LocalStorage.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: AppStyle.bgGrey,
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
              shopName,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
                color: AppStyle.black,
                letterSpacing: -0.4,
              ),
            ),
            bottom: TabBar(
              labelStyle: AppStyle.interNormal(
                size: 14,
                color: AppStyle.brandGreen,
              ),
              unselectedLabelStyle: AppStyle.interNormal(
                size: 14,
                color: AppStyle.black,
              ),
              indicatorWeight: 3,
              indicatorColor: AppStyle.brandGreen,
              tabs: const [
                Tab(text: 'Survey'),
                Tab(text: 'My Survey'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Obx(() {
                return shopSurveyController.isLoading.value
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 8),
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            mainAxisExtent: 140,
                          ),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return ShimmerEffect();
                          },
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 8),
                        child: shopSurveyController.shopWiseSurveyModel.value
                                    ?.surveys?.isEmpty ??
                                true
                            ? Center(
                                child: Text(
                                  "No Survey Found",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.0,
                                    color: AppStyle.black,
                                  ),
                                ),
                              )
                            : GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  mainAxisExtent: 150,
                                ),
                                itemCount: shopSurveyController
                                        .shopWiseSurveyModel
                                        .value
                                        ?.surveys
                                        ?.length ??
                                    0,
                                itemBuilder: (context, index) {
                                  final survey = shopSurveyController
                                      .shopWiseSurveyModel
                                      .value
                                      ?.surveys?[index];
                                  return Stack(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          shopSurveyController
                                              .getSurveysQuestionAnswer(
                                                  surveyID:
                                                      survey?.surveyId ?? 0);
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SurveyQuestionAnswerScreen(
                                                surveyTitle:
                                                    survey?.surveyTitle ?? "",
                                                surveyID: survey?.surveyId
                                                        .toString() ??
                                                    "",
                                              ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(5),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                          ),
                                          child: Column(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                child: Image.network(imageUrl,
                                                    fit: BoxFit.cover,
                                                    width: 100,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.12),
                                              ),
                                              const SizedBox(height: 2),
                                              Text(survey?.surveyTitle ?? "",
                                                  style: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14.0,
                                                    color: AppStyle.black,
                                                  ),
                                                  textAlign: TextAlign.center),
                                              const SizedBox(height: 2),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    "assets/images/add.png",
                                                    width: 18,
                                                    height: 18,
                                                  ),
                                                  const SizedBox(width: 6),
                                                  Text(
                                                    "${survey?.totalPoints ?? 0}",
                                                    style: GoogleFonts.inter(
                                                      fontSize: 13.0,
                                                      color: AppStyle.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                      );
              }),

              // My Survey Tab
              Obx(() {
                return shopSurveyController.isLoading.value
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 8),
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            mainAxisExtent: 140,
                          ),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return ShimmerEffect();
                          },
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 8),
                        child: shopSurveyController
                                    .userCompletedSurveysByShopModel
                                    .value
                                    ?.surveys
                                    ?.isEmpty ??
                                true
                            ? Center(
                                child: Text(
                                  "No Survey Found",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.0,
                                    color: AppStyle.black,
                                  ),
                                ),
                              )
                            : GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  mainAxisExtent: 150,
                                ),
                                itemCount: shopSurveyController
                                        .userCompletedSurveysByShopModel
                                        .value
                                        ?.surveys
                                        ?.length ??
                                    0,
                                itemBuilder: (context, index) {
                                  final survey = shopSurveyController
                                      .userCompletedSurveysByShopModel
                                      .value
                                      ?.surveys?[index];
                                  return Stack(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                        ),
                                        child: Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              child: Image.network(
                                                imageUrl,
                                                fit: BoxFit.cover,
                                                width: 100,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.12,
                                              ),
                                            ),
                                            const SizedBox(height: 2),
                                            Text(
                                              survey?.surveyTitle ?? "",
                                              style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.0,
                                                color: AppStyle.black,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            const SizedBox(height: 2),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  "assets/images/add.png",
                                                  width: 18,
                                                  height: 18,
                                                ),
                                                const SizedBox(width: 6),
                                                Text(
                                                  "${survey?.totalPoints ?? 0}",
                                                  style: GoogleFonts.inter(
                                                    fontSize: 13.0,
                                                    color: AppStyle.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                      );
              })
            ],
          ),
        ),
      ),
    );
  }
}

class ShimmerEffect extends StatefulWidget {
  @override
  _ShimmerEffectState createState() => _ShimmerEffectState();
}

class _ShimmerEffectState extends State<ShimmerEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);
    _animation = ColorTween(
      begin: Colors.grey[300],
      end: Colors.grey[100],
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(5),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: _animation.value,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
        );
      },
    );
  }
}
