import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puntossmart/infrastructure/services/local_storage.dart';
import 'package:puntossmart/presentation/components/buttons/custom_button.dart';
import 'package:puntossmart/presentation/pages/home/controller/shop_survey_controller.dart';
import 'package:puntossmart/presentation/theme/app_style.dart';

// ignore: must_be_immutable
class SurveyQuestionAnswerScreen extends StatelessWidget {
  final String surveyTitle;
  final String surveyID;

  SurveyQuestionAnswerScreen({
    super.key,
    required this.surveyTitle,
    required this.surveyID,
  });

  ShopSurveyController shopSurveyController = Get.put(ShopSurveyController());

  @override
  Widget build(BuildContext context) {
    final bool isLtr = LocalStorage.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
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
            surveyTitle,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: 18.0,
              color: AppStyle.black,
              letterSpacing: -0.4,
            ),
          ),
        ),
        body: Obx(() {
          if (shopSurveyController.isLoading.value) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: ShimmerEffect(),
            );
          } else if (shopSurveyController.surveyQuestionAnswerModel.value ==
              null) {
            return const Center(child: Text("No Survey Question Found"));
          } else {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: shopSurveyController.surveyQuestionAnswerModel
                              .value?.questions?.length ??
                          0,
                      itemBuilder: (context, questionIndex) {
                        final question = shopSurveyController
                            .surveyQuestionAnswerModel
                            .value
                            ?.questions?[questionIndex];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                question?.questionText ?? "",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.0,
                                  color: AppStyle.black,
                                ),
                              ),
                              const SizedBox(height: 8),
                              ...?question?.answers?.map((answer) {
                                return Card(
                                  color: AppStyle.bgGrey,
                                  child: ListTile(
                                    title: Text(answer.answerText ?? ""),
                                    trailing: Obx(() {
                                      return Radio<int>(
                                        activeColor: AppStyle.brandGreen,
                                        value: int.tryParse(
                                                answer.points ?? "0") ??
                                            0,
                                        groupValue: shopSurveyController
                                                .selectedAnswers[questionIndex]
                                                ?.value ??
                                            0,
                                        onChanged: (value) {
                                          if (value != null) {
                                            shopSurveyController
                                                .setSelectedAnswer(
                                                    questionIndex, value);
                                          }
                                        },
                                      );
                                    }),
                                  ),
                                );
                              }),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Obx(() {
                    return shopSurveyController.surveyLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: AppStyle.brandGreen,
                            ),
                          )
                        : CustomButton(
                            title: "Submit",
                            onPressed: () {
                              final totalPoints =
                                  shopSurveyController.calculateTotalPoints();
                              if (totalPoints > 1) {
                                shopSurveyController.submitSurvey(
                                  context: context,
                                  surveyID: surveyID,
                                  points: totalPoints.toString(),
                                  note:
                                      "You get $totalPoints points from survey $surveyTitle",
                                );
                              } else {
                                print("Please answer the a least one question");
                              }
                              print("Total Points: $totalPoints");
                            });
                  })
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}

class ShimmerEffect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return ShimmerItem();
      },
    );
  }
}

class ShimmerItem extends StatefulWidget {
  @override
  _ShimmerItemState createState() => _ShimmerItemState();
}

class _ShimmerItemState extends State<ShimmerItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          width: double.infinity,
          height: 20.0,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(5.0),
            gradient: LinearGradient(
              begin: Alignment(-1.0 + _controller.value * 2, -0.3),
              end: Alignment(1.0 + _controller.value * 2, 0.3),
              colors: [Colors.grey[300]!, Colors.grey[100]!, Colors.grey[300]!],
              stops: [0.4, 0.5, 0.6],
            ),
          ),
        );
      },
    );
  }
}
