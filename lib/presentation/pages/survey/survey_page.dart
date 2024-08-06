import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:puntossmart/infrastructure/services/app_helpers.dart';
import 'package:puntossmart/infrastructure/services/local_storage.dart';
import 'package:puntossmart/infrastructure/services/tr_keys.dart';
import 'package:puntossmart/presentation/components/buttons/custom_button.dart';
import 'package:puntossmart/presentation/pages/survey/create_new_survey_screen.dart';
import 'package:puntossmart/presentation/theme/app_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SurveyPage extends StatefulWidget {
  const SurveyPage({super.key});

  @override
  State<SurveyPage> createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  @override
  Widget build(BuildContext context) {
    final bool isLtr = LocalStorage.getLangLtr();

    return DefaultTabController(
      length: 2,
      child: Directionality(
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
              'Smart Survey',
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
              tabs: [
                Tab(
                    text: AppHelpers.getTranslation(
                        AppLocalizations.of(context)!.statistics)),
                Tab(
                    text: AppHelpers.getTranslation(
                        AppLocalizations.of(context)!.surveys)),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CreateSurveyPage()));
                },
                icon: const Icon(
                  Icons.add,
                  color: AppStyle.black,
                ),
              ),
            ],
          ),
          body: const TabBarView(
            children: [
              StatisticsTab(),
              SurveysTab(),
            ],
          ),
        ),
      ),
    );
  }
}

class StatisticsTab extends StatelessWidget {
  const StatisticsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Smart Survey Statistics',
            style: AppStyle.interNormal(
              size: 16,
              color: AppStyle.black,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "35,569 ",
                      style: AppStyle.interNormal(
                        size: 22,
                        color: AppStyle.black,
                      ),
                    ),
                    TextSpan(
                      text: "Users Answered",
                      style: AppStyle.interNormal(
                        size: 16,
                        color: AppStyle.textGrey,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.red[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '↓ 8.02%',
                  style: AppStyle.interNormal(
                    size: 16,
                    color: AppStyle.red,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Genre',
                      style: AppStyle.interNormal(
                        size: 20,
                        color: AppStyle.black,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "30,120 ",
                            style: AppStyle.interNormal(
                              size: 16,
                              color: AppStyle.black,
                            ),
                          ),
                          TextSpan(
                            text: "Male",
                            style: AppStyle.interNormal(
                              size: 16,
                              color: AppStyle.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "5,548 ",
                            style: AppStyle.interNormal(
                              size: 16,
                              color: AppStyle.black,
                            ),
                          ),
                          TextSpan(
                            text: "Female",
                            style: AppStyle.interNormal(
                              size: 16,
                              color: AppStyle.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              PieChart(
                dataMap: const {
                  "Male": 73,
                  "Female": 27,
                },
                animationDuration: const Duration(milliseconds: 800),
                chartLegendSpacing: 32,
                chartRadius: MediaQuery.of(context).size.width / 3.2,
                colorList: const [
                  Colors.yellow,
                  Colors.blue,
                ],
                initialAngleInDegree: 0,
                chartType: ChartType.ring,
                ringStrokeWidth: 20,
                legendOptions: LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: LegendPosition.right,
                  showLegends: false,
                  legendShape: BoxShape.circle,
                  legendTextStyle: AppStyle.interNormal(
                    size: 16,
                    color: AppStyle.black,
                  ),
                ),
                chartValuesOptions: const ChartValuesOptions(
                  showChartValueBackground: true,
                  showChartValues: true,
                  showChartValuesInPercentage: false,
                  showChartValuesOutside: false,
                  decimalPlaces: 1,
                ),
              )
            ],
          ),
          const SizedBox(height: 40),
          Container(
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: LinearProgressIndicator(
              borderRadius: BorderRadius.circular(15),
              value: 0.73,
              backgroundColor: Colors.red,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '73% Positive',
                style: AppStyle.interNormal(
                  size: 16,
                  color: AppStyle.black,
                ),
              ),
              Text(
                '27% Negative',
                style: AppStyle.interNormal(
                  size: 16,
                  color: AppStyle.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Text(
            "Do you want more details? Be Premimum",
            style: AppStyle.interNormal(
              size: 17,
              color: AppStyle.black,
            ),
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
              color: AppStyle.bgGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(""),
                    ),
                    Expanded(
                      child: Image.asset("assets/images/back.png"),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "run your business\nto the next level.",
                      style: AppStyle.interNormal(
                        size: 17,
                        color: AppStyle.black,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 5),
                      decoration: BoxDecoration(
                        color: const Color(0xff1e9666),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Promote Yourself NOW!",
                            style: AppStyle.interNormal(
                              size: 14,
                              color: AppStyle.white,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: AppStyle.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SurveysTab extends StatelessWidget {
  const SurveysTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final surveys =
        List.generate(7, (index) => "Survey La Preferida ${index + 1}");
    final dates = List.generate(7, (index) => "09 May, 6:12 pm");

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: surveys.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              const Icon(Icons.calendar_today, size: 20, color: Colors.grey),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dates[index],
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    surveys[index],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(FlutterRemix.delete_bin_6_fill,
                    color: Colors.red),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: CustomButton(
                  background: Colors.transparent,
                  borderColor: AppStyle.borderColor,
                  title: "Edit",
                  onPressed: () {},
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
