import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puntossmart/infrastructure/services/app_constants.dart';
import 'package:puntossmart/infrastructure/services/app_helpers.dart';
import 'package:puntossmart/infrastructure/services/local_storage.dart';
import 'package:puntossmart/infrastructure/services/tr_keys.dart';
import 'package:puntossmart/presentation/components/buttons/custom_button.dart';
import 'package:puntossmart/presentation/pages/friends/controller/friend_controller.dart';
import 'package:puntossmart/presentation/theme/app_style.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SendPointByQrCode extends StatefulWidget {
  SendPointByQrCode({
    super.key,
  });

  @override
  State<SendPointByQrCode> createState() => _SendPointByQrCodeState();
}

class _SendPointByQrCodeState extends State<SendPointByQrCode> {
  final FriendController friendController = Get.put(FriendController());
  int points = 0;
  final FocusNode _focusNode = FocusNode();
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: points.toString());
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
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
            AppLocalizations.of(context)!
                .friends, // replace widget.name with the actual title if needed
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: 18.0,
              color: AppStyle.black,
              letterSpacing: -0.4,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DottedBorder(
                      dashPattern: [10, 4],
                      color: const Color(0xfffdc35c),
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(15),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xfffffaf0),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: const Color(0xfffffaf0),
                            child: Image.asset("assets/images/add.png"),
                          ),
                          title: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: LocalStorage.getWalletData()
                                          ?.price
                                          .toString() ??
                                      "0.0",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                    color: AppStyle.brandGreen,
                                  ),
                                ),
                                TextSpan(
                                  text: " ",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                TextSpan(
                                  text: "PS",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                    color: AppStyle.brandGreen,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          subtitle:
                              Text(AppLocalizations.of(context)!.my_balance),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      AppLocalizations.of(context)!.puntos_smart,
                      style: GoogleFonts.bungee(
                        fontWeight: FontWeight.w600,
                        fontSize: 22.0,
                        color: AppStyle.newThemeColor,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 20),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppStyle.black,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Container(
                            //   decoration: BoxDecoration(
                            //     border: Border.all(width: 1),
                            //     shape: BoxShape.circle,
                            //   ),
                            //   child: GestureDetector(
                            //     onTap: () {
                            //       if (points > 0) {
                            //         setState(() {
                            //           points--;
                            //         });
                            //       }
                            //     },
                            //     child: const Icon(Icons.remove),
                            //   ),
                            // ),
                            // const SizedBox(
                            //   width: 10,
                            // ),
                            // Text(
                            //   "$points",
                            //   style: GoogleFonts.inter(
                            //     fontSize: 18.0,
                            //     color: AppStyle.black,
                            //   ),
                            // ),
                            // const SizedBox(
                            //   width: 10,
                            // ),
                            // Container(
                            //   decoration: BoxDecoration(
                            //     border: Border.all(width: 1),
                            //     shape: BoxShape.circle,
                            //   ),
                            //   child: GestureDetector(
                            //     onTap: () {
                            //       setState(() {
                            //         points++;
                            //       });
                            //     },
                            //     child: const Icon(Icons.add),
                            //   ),
                            // ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                shape: BoxShape.circle,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  if (points > 0) {
                                    setState(() {
                                      points--;
                                      _controller.text = points.toString();
                                    });
                                  }
                                },
                                child: const Icon(Icons.remove),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 50,
                              child: TextField(
                                controller: _controller,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    points = int.tryParse(value) ?? points;
                                  });
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                shape: BoxShape.circle,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    points++;
                                    _controller.text = points.toString();
                                  });
                                },
                                child: const Icon(Icons.add),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 30,
                      ),
                      height: 150,
                      width: 1,
                      color: AppStyle.textGrey,
                    ),
                    Obx(() {
                      return friendController.isLoading.value
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListTile(
                              leading: CircleAvatar(
                                child: Image.network(friendController
                                        .userByQRCodeModel
                                        .value
                                        ?.user
                                        ?.profilePic ??
                                    AppConstants.emptyImage),
                              ),
                              title: Text(
                                friendController
                                        .userByQRCodeModel.value?.user?.name ??
                                    AppConstants.emptyString,
                                style: GoogleFonts.inter(
                                  fontSize: 15.0,
                                  color: AppStyle.black,
                                ),
                              ),
                            );
                    }),
                    TextFormField(
                      autocorrect: true,
                      style: AppStyle.interRegular(
                        size: 16,
                        color: AppStyle.black,
                      ),
                      onFieldSubmitted: (value) {
                        _focusNode.unfocus();
                      },
                      controller: friendController.noteController,
                      cursorColor: AppStyle.black,
                      cursorWidth: 1,
                      decoration: InputDecoration(
                        hintStyle: AppStyle.interNormal(
                          size: 13,
                          color: AppStyle.hintColor,
                        ),
                        hintText: AppHelpers.getTranslation(
                            AppLocalizations.of(context)!.note),
                        contentPadding:
                            REdgeInsets.symmetric(horizontal: 15, vertical: 14),
                        fillColor: AppStyle.bgGrey,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: const BorderSide(
                                color: AppStyle.borderColor, width: 1.2)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: const BorderSide(
                                color: AppStyle.borderColor, width: 1.2)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: const BorderSide(
                                color: AppStyle.borderColor, width: 1.2)),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .10,
                    ),
                  ],
                ),
                CustomButton(
                  title: AppLocalizations.of(context)!.continue_,
                  onPressed: () {
                    if (points < 1) {
                      Fluttertoast.showToast(
                          msg: AppLocalizations.of(context)!
                              .points_should_be_greater_then_zero,
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.TOP,
                          timeInSecForIosWeb: 3,
                          backgroundColor: AppStyle.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      //int.parse
                    } else if (points >
                        double.parse(
                            LocalStorage.getWalletData()!.price.toString())) {
                      Fluttertoast.showToast(
                          msg: AppLocalizations.of(context)!
                              .you_dont_have_enough_points,
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.TOP,
                          timeInSecForIosWeb: 3,
                          backgroundColor: AppStyle.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else if (friendController.noteController.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg: AppLocalizations.of(context)!
                              .please_enter_you_note,
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.TOP,
                          timeInSecForIosWeb: 3,
                          backgroundColor: AppStyle.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      return;
                    } else {
                      showModalBottomSheet(
                        backgroundColor: AppStyle.borderColor,
                        context: context,
                        builder: (context) {
                          return Container(
                            height: MediaQuery.of(context).size.height * .40,
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                const SizedBox(height: 20),
                                Text(
                                  AppLocalizations.of(context)!.send_points,
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 22.0,
                                    color: AppStyle.black,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: AppLocalizations.of(context)!
                                            .are_you_sure_to_send,
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.0,
                                          color: AppStyle.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "$points PS",
                                        style: GoogleFonts.inter(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                          color: AppStyle.brandGreen,
                                        ),
                                      ),
                                      TextSpan(
                                        text: " para ",
                                        style: GoogleFonts.inter(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                          color: AppStyle.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            "\"${friendController.userByQRCodeModel.value?.user?.name ?? AppConstants.emptyString}\"",
                                        style: GoogleFonts.inter(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                          color: AppStyle.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "?",
                                        style: GoogleFonts.inter(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                          color: AppStyle.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 50),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: CustomButton(
                                        background: Colors.transparent,
                                        borderColor: AppStyle.black,
                                        title: "No",
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(child: Obx(() {
                                      return friendController
                                              .sendPointLoading.value
                                          ? Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : CustomButton(
                                              title:
                                                  AppLocalizations.of(context)!
                                                      .send,
                                              onPressed: () {
                                                friendController.sendPoints(
                                                  uuid: friendController
                                                          .userByQRCodeModel
                                                          .value
                                                          ?.user
                                                          ?.uuid ??
                                                      "",
                                                  points: points.toString(),
                                                );
                                                Navigator.pop(context);
                                                showModalBottomSheet(
                                                  backgroundColor:
                                                      AppStyle.borderColor,
                                                  context: context,
                                                  isScrollControlled: true,
                                                  builder: (context) {
                                                    return AnimatedContainer(
                                                      duration: Duration(
                                                          milliseconds: 5000),
                                                      curve: Curves.easeInOut,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.50,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              16.0),
                                                      child: Column(
                                                        children: [
                                                          const SizedBox(
                                                              height: 20),
                                                          ScaleTransition(
                                                            scale:
                                                                CurvedAnimation(
                                                              parent:
                                                                  AnimationController(
                                                                vsync: Navigator
                                                                    .of(context),
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        5000),
                                                              )..forward(),
                                                              curve: Curves
                                                                  .easeInOut,
                                                            ),
                                                            child: Image.asset(
                                                              "assets/images/confirm.png",
                                                              height: 150,
                                                              width: 150,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              height: 20),
                                                          Text.rich(
                                                            TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text: AppLocalizations.of(
                                                                          context)!
                                                                      .you_have_successfully_sent,
                                                                  style:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        14.0,
                                                                    color: AppStyle
                                                                        .black,
                                                                  ),
                                                                ),
                                                                TextSpan(
                                                                  text:
                                                                      "$points PS",
                                                                  style:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontSize:
                                                                        14.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: AppStyle
                                                                        .brandGreen,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              height: 50),
                                                          CustomButton(
                                                            background: Colors
                                                                .transparent,
                                                            borderColor:
                                                                AppStyle.black,
                                                            title: AppLocalizations
                                                                    .of(context)!
                                                                .back_to_home,
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                              Navigator.pop(
                                                                  context);
                                                              Navigator.pop(
                                                                  context);
                                                              Navigator.pop(
                                                                  context);
                                                              // Navigator.of(
                                                              //         context)
                                                              //     .pushReplacement(
                                                              //         MaterialPageRoute(
                                                              //             builder: (context) =>
                                                              //                 ProfilePage()));
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            );
                                    })),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
