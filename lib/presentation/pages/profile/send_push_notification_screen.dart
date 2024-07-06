import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puntossmart/infrastructure/services/local_storage.dart';
import 'package:puntossmart/presentation/components/buttons/custom_button.dart';
import 'package:puntossmart/presentation/components/text_fields/outline_bordered_text_field.dart';
import 'package:puntossmart/presentation/pages/profile/controller/send_push_notification_controller.dart';
import 'package:puntossmart/presentation/theme/app_style.dart';

// ignore: must_be_immutable
class PushNotificationScreen extends StatelessWidget {
  PushNotificationScreen({Key? key}) : super(key: key);

  SendPushNotificationController pushNotificationController =
      Get.put(SendPushNotificationController());

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
              "Push Notification",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
                color: AppStyle.black,
                letterSpacing: -0.4,
              ),
            ),
          ),
          body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OutlinedBorderTextField(label: "Promotion Title"),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Age >',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          child: IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              if (pushNotificationController.age.value > 0)
                                pushNotificationController.age.value--;
                            },
                          ),
                        ),
                        Obx(() => Text(
                              '${pushNotificationController.age.value}',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                            )),
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: AppStyle.borderColor),
                              color: AppStyle.transparent,
                              borderRadius: BorderRadius.circular(50)),
                          child: IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () =>
                                pushNotificationController.age.value++,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                Text(
                  'Genre',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                Obx(() => Row(
                      children: [
                        ChoiceChip(
                          label: Text('Male'),
                          selected:
                              pushNotificationController.gender.value == 'male',
                          onSelected: (selected) {
                            if (selected)
                              pushNotificationController.gender.value = 'male';
                          },
                        ),
                        const SizedBox(width: 8),
                        ChoiceChip(
                          label: Text('Female'),
                          selected: pushNotificationController.gender.value ==
                              'FEMALE',
                          onSelected: (selected) {
                            if (selected)
                              pushNotificationController.gender.value =
                                  'FEMALE';
                          },
                        ),
                      ],
                    )),
                const SizedBox(height: 16),
                // OutlinedBorderTextField(label: "Location")

                // const SizedBox(height: 16),
                OutlinedBorderTextField(label: "Description"),

                const SizedBox(height: 16),
                InkWell(
                  onTap: () {
                    // Handle image upload
                  },
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.cloud_upload, color: Colors.grey),
                          Text(
                            'Cargar',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: CustomButton(
                    onPressed: () {},
                    title: "SEND PUSH NOW",
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
