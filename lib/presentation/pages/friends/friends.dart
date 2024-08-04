import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puntossmart/infrastructure/services/app_constants.dart';
import 'package:puntossmart/infrastructure/services/app_helpers.dart';
import 'package:puntossmart/infrastructure/services/local_storage.dart';
import 'package:puntossmart/infrastructure/services/tr_keys.dart';
import 'package:puntossmart/presentation/components/buttons/custom_button.dart';
import 'package:puntossmart/presentation/components/text_fields/search_text_field.dart';
import 'package:puntossmart/presentation/pages/friends/controller/friend_controller.dart';
import 'package:puntossmart/presentation/pages/friends/send_point_screen.dart';
import 'package:puntossmart/presentation/theme/app_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FriendScreen extends StatefulWidget {
  const FriendScreen({super.key});

  @override
  State<FriendScreen> createState() => _FriendScreenState();
}

class _FriendScreenState extends State<FriendScreen> {
  FriendController friendController = Get.put(FriendController());
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
              AppLocalizations.of(context)!
                  .friends, // replace widget.name with the actual title if needed
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
                        AppLocalizations.of(context)!.friend_)),
                Tab(
                    text: AppHelpers.getTranslation(
                        AppLocalizations.of(context)!.add)),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              FriendsTab(),
              UsersTab(),
            ],
          ),
        ),
      ),
    );
  }
}

class UsersTab extends StatefulWidget {
  const UsersTab({Key? key}) : super(key: key);

  @override
  State<UsersTab> createState() => _UsersTabState();
}

class _UsersTabState extends State<UsersTab> {
  final FriendController friendController = Get.put(FriendController());

  Future<void> _refreshData() async {
    friendController.getAllUsers(searchName: '');
  }

  @override
  Widget build(BuildContext context) {
    print("=========MY TOKEN============");
    print(LocalStorage.getToken());
    print("=====================");
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 10,
              ),
              SearchTextField(
                isBorder: true,
                hintText: AppHelpers.getTranslation(
                    AppLocalizations.of(context)!.search),
                onChanged: (value) {
                  friendController.getAllUsers(searchName: value);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(() {
                if (friendController.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppStyle.brandGreen,
                    ),
                  );
                } else if (friendController.getUserModel.value?.users == null ||
                    friendController.getUserModel.value!.users!.isEmpty) {
                  return Center(
                    child: Text(
                      AppLocalizations.of(context)!.no_user_found,
                      style: AppStyle.interNormal(
                        size: 18,
                        color: AppStyle.black,
                      ),
                    ),
                  );
                } else {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        friendController.getUserModel.value!.users!.length,
                    itemBuilder: (context, index) {
                      final user =
                          friendController.getUserModel.value!.users![index];
                      return addFriendsTab(
                        imageUrl: user.profilePic ?? AppConstants.emptyImage,
                        name: user.name ?? "",
                        phone: user.phone ?? "",
                        onClick: () {
                          showModalBottomSheet(
                            backgroundColor: AppStyle.borderColor,
                            context: context,
                            builder: (context) {
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height * .40,
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 20),
                                    Text(
                                      AppLocalizations.of(context)!.add_friend,
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 22.0,
                                        color: AppStyle.black,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      AppLocalizations.of(context)!
                                          .are_you_sure,
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.0,
                                        color: AppStyle.black,
                                      ),
                                    ),
                                    const SizedBox(height: 50),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                        Expanded(
                                          child: Obx(() {
                                            return friendController
                                                    .addFriendLoading.value
                                                ? const Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  )
                                                : CustomButton(
                                                    title: AppLocalizations.of(
                                                            context)!
                                                        .yes,
                                                    onPressed: () {
                                                      friendController
                                                          .addNewFriend(
                                                        receivedUserID: user
                                                            .userId
                                                            .toString(),
                                                      );
                                                      Navigator.pop(context);
                                                      showModalBottomSheet(
                                                        backgroundColor:
                                                            AppStyle
                                                                .borderColor,
                                                        context: context,
                                                        isScrollControlled:
                                                            true,
                                                        builder: (context) {
                                                          return AnimatedContainer(
                                                            duration: Duration(
                                                                milliseconds:
                                                                    5000),
                                                            curve: Curves
                                                                .easeInOut,
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.50,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(16.0),
                                                            child: Column(
                                                              children: [
                                                                const SizedBox(
                                                                    height: 20),
                                                                ScaleTransition(
                                                                  scale:
                                                                      CurvedAnimation(
                                                                    parent:
                                                                        AnimationController(
                                                                      vsync: Navigator.of(
                                                                          context),
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              5000),
                                                                    )..forward(),
                                                                    curve: Curves
                                                                        .easeInOut,
                                                                  ),
                                                                  child: Image
                                                                      .asset(
                                                                    "assets/images/confirm.png",
                                                                    height: 150,
                                                                    width: 150,
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                    height: 20),
                                                                Text(
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .friend_added_successfully,
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
                                                                const SizedBox(
                                                                    height: 50),
                                                                CustomButton(
                                                                  background: Colors
                                                                      .transparent,
                                                                  borderColor:
                                                                      AppStyle
                                                                          .black,
                                                                  title: AppLocalizations.of(
                                                                          context)!
                                                                      .back_to_home,
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  );
                                          }),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 8);
                    },
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}

Widget addFriendsTab(
    {required String imageUrl,
    required String name,
    required String phone,
    required Function() onClick}) {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 6,
      vertical: 2,
    ),
    decoration: BoxDecoration(
      border: Border.all(width: 1, color: AppStyle.borderColor),
      borderRadius: BorderRadius.circular(10),
    ),
    child: ListTile(
      leading: CircleAvatar(
        child: Image.network(imageUrl),
      ),
      title: Text(
        name,
        style: AppStyle.interNormal(
          size: 14,
          color: AppStyle.black,
        ),
      ),
      subtitle: Text(
        phone,
        style: AppStyle.interNormal(
          size: 14,
          color: AppStyle.black,
        ),
      ),
      trailing: GestureDetector(
        onTap: onClick,
        child: Icon(
          FlutterRemix.add_line,
          color: AppStyle.black,
        ),
      ),
    ),
  );
}

class FriendsTab extends StatefulWidget {
  const FriendsTab({Key? key}) : super(key: key);

  @override
  State<FriendsTab> createState() => _FriendsTabState();
}

class _FriendsTabState extends State<FriendsTab> {
  final FriendController friendController = Get.put(FriendController());

  Future<void> _refreshData() async {
    friendController.getFriends(searchName: '');
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 10,
              ),
              SearchTextField(
                isBorder: true,
                hintText: AppHelpers.getTranslation(
                    AppLocalizations.of(context)!.search),
                onChanged: (value) {
                  friendController.getFriends(searchName: value);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(() {
                if (friendController.addFriendLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppStyle.brandGreen,
                    ),
                  );
                } else if (friendController.getFriendModel.value?.friends ==
                        null ||
                    friendController.getFriendModel.value!.friends!.isEmpty) {
                  return Center(
                    child: Text(
                      AppLocalizations.of(context)!.no_friend_found,
                      style: AppStyle.interNormal(
                        size: 18,
                        color: AppStyle.black,
                      ),
                    ),
                  );
                } else {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        friendController.getFriendModel.value!.friends!.length,
                    itemBuilder: (context, index) {
                      final user = friendController
                          .getFriendModel.value!.friends![index];
                      return friendTab(
                        imageUrl: user.profilePic ?? AppConstants.emptyImage,
                        name: user.name ?? "",
                        phone: user.phone ?? "",
                        onDelete: () {
                          showBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                    decoration: const BoxDecoration(
                                      color: AppStyle.bgGrey,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        topRight: Radius.circular(25),
                                      ),
                                    ),
                                    padding: const EdgeInsets.all(15),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          FlutterRemix.delete_bin_2_fill,
                                          size: 80,
                                          color: AppStyle.red,
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "Delete Friend?",
                                          style: AppStyle.interBold(
                                              color: AppStyle.red),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "Are you sure you want to Remove the Friend permanently?",
                                          style: AppStyle.interRegular(),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: CustomButton(
                                                borderColor: AppStyle.black,
                                                background:
                                                    AppStyle.transparent,
                                                title: "No",
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Obx(() {
                                                return friendController
                                                        .deleteFriendLoading
                                                        .value
                                                    ? const Center(
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: AppStyle
                                                              .brandGreen,
                                                        ),
                                                      )
                                                    : CustomButton(
                                                        background:
                                                            AppStyle.red,
                                                        textColor:
                                                            AppStyle.white,
                                                        title: "Yes, Delete",
                                                        onPressed: () {
                                                          friendController
                                                              .deleteFriend(
                                                            context,
                                                            friendID: user
                                                                .friendshipId
                                                                .toString(),
                                                          );
                                                        },
                                                      );
                                              }),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ));
                              });
                        },
                        onClick: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SendPointScreen(
                                uuid: user.uuid ?? "",
                                username: user.name ?? "",
                                imageUrl:
                                    user.profilePic ?? AppConstants.emptyImage,
                              ),
                            ),
                          );
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 8);
                    },
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget friendTab(
      {required String imageUrl,
      required String name,
      required String phone,
      required Function() onDelete,
      required Function() onClick}) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: AppStyle.borderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Image.network(imageUrl),
        ),
        title: Text(
          name,
          style: AppStyle.interNormal(
            size: 14,
            color: AppStyle.black,
          ),
        ),
        subtitle: Text(
          phone,
          style: AppStyle.interNormal(
            size: 14,
            color: AppStyle.black,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: onDelete,
              child: const Icon(
                FlutterRemix.delete_bin_2_fill,
                color: AppStyle.red,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: onClick,
              child: const Icon(
                FlutterRemix.send_plane_2_fill,
                color: AppStyle.brandGreen,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
