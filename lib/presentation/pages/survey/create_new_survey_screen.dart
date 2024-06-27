import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puntossmart/infrastructure/services/local_storage.dart';
import 'package:puntossmart/presentation/components/buttons/custom_button.dart';
import 'package:puntossmart/presentation/components/text_fields/outline_bordered_text_field.dart';
import 'package:puntossmart/presentation/theme/app_style.dart';

class CreateSurveyPage extends StatefulWidget {
  const CreateSurveyPage({super.key});

  @override
  State<CreateSurveyPage> createState() => _CreateSurveyPageState();
}

class _CreateSurveyPageState extends State<CreateSurveyPage> {
  final TextEditingController _surveyNameController = TextEditingController();
  final List<Map<String, dynamic>> _questions = [
    {
      'title': TextEditingController(),
      'options': [TextEditingController(), TextEditingController()]
    }
  ];

  void _addQuestion() {
    setState(() {
      _questions.add({
        'title': TextEditingController(),
        'options': [TextEditingController(), TextEditingController()]
      });
    });
  }

  void _removeQuestion(int index) {
    setState(() {
      _questions.removeAt(index);
    });
  }

  void _addOption(int questionIndex) {
    setState(() {
      _questions[questionIndex]['options'].add(TextEditingController());
    });
  }

  void _removeOption(int questionIndex, int optionIndex) {
    setState(() {
      _questions[questionIndex]['options'].removeAt(optionIndex);
    });
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
            'Create Smart Survey',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: 18.0,
              color: AppStyle.black,
              letterSpacing: -0.4,
            ),
          ),
          actions: [
            IconButton(
              splashRadius: 18.0,
              onPressed: () {
                // Add your save functionality here
              },
              icon: Icon(
                FlutterRemix.save_line,
                size: 24.0,
                color: AppStyle.brandGreen,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OutlinedBorderTextField(
                label: "Survey Name",
                textController: _surveyNameController,
              ),
              const SizedBox(height: 20),
              ..._questions.asMap().entries.map((entry) {
                int questionIndex = entry.key;
                var question = entry.value;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Question ${questionIndex + 1}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () => _removeQuestion(questionIndex),
                          icon: Icon(FlutterRemix.delete_bin_6_line,
                              color: Colors.red),
                        ),
                      ],
                    ),
                    OutlinedBorderTextField(
                      label: "Title",
                      textController: question['title'],
                    ),
                    const SizedBox(height: 10),
                    ...question['options'].asMap().entries.map((optionEntry) {
                      int optionIndex = optionEntry.key;
                      TextEditingController optionController =
                          optionEntry.value;
                      return Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: OutlinedBorderTextField(
                                label: 'Option ${optionIndex + 1}',
                                textController: optionController,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () =>
                                _removeOption(questionIndex, optionIndex),
                            icon: const Icon(FlutterRemix.close_line,
                                color: Colors.red),
                          ),
                        ],
                      );
                    }).toList(),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomButton(
                        background: AppStyle.transparent,
                        borderColor: AppStyle.borderColor,
                        onPressed: () => _addOption(questionIndex),
                        title: 'ADD +',
                      ),
                    ),
                    const Divider(thickness: 1, height: 40),
                  ],
                );
              }).toList(),
              Center(
                child: CustomButton(
                  onPressed: _addQuestion,
                  title: 'Add another Question +',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
