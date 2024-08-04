import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:puntossmart/application/profile/profile_notifier.dart';
import 'package:puntossmart/application/profile/profile_provider.dart';
import 'package:puntossmart/application/profile/profile_state.dart';
import 'package:puntossmart/infrastructure/services/app_helpers.dart';
import 'package:puntossmart/infrastructure/services/local_storage.dart';
import 'package:puntossmart/infrastructure/services/tr_keys.dart';
import 'package:puntossmart/presentation/components/app_bars/common_app_bar.dart';
import 'package:intl/intl.dart' as intl;
import 'package:puntossmart/presentation/components/buttons/pop_button.dart';
import 'package:puntossmart/presentation/components/loading.dart';
import 'package:puntossmart/presentation/pages/profile/controller/send_transaction_controller.dart';
import '../../theme/app_style.dart';
import 'package:flutter/material.dart' as refersh;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class WalletHistoryPage extends ConsumerStatefulWidget {
  const WalletHistoryPage({super.key});

  @override
  ConsumerState<WalletHistoryPage> createState() => _WalletHistoryState();
}

class _WalletHistoryState extends ConsumerState<WalletHistoryPage>
    with SingleTickerProviderStateMixin {
  late RefreshController controller;
  late ProfileState state;
  late ProfileNotifier event;
  final bool isLtr = LocalStorage.getLangLtr();
  late TabController _tabController;
  SendTransactionController sendTransactionController =
      Get.put(SendTransactionController());

  @override
  void initState() {
    controller = RefreshController();
    _tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(profileProvider.notifier).getWallet(context);
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    event = ref.read(profileProvider.notifier);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    controller.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    state = ref.watch(profileProvider);
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppStyle.bgGrey,
        body: Column(
          children: [
            CommonAppBar(
              child: Text(
                AppHelpers.getTranslation(
                    AppLocalizations.of(context)!.transactions),
                style: AppStyle.interNoSemi(
                  size: 18,
                  color: AppStyle.black,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppStyle.white,
              ),
              child: TabBar(
                indicatorColor: AppStyle.brandGreen,
                labelColor: AppStyle.brandGreen,
                unselectedLabelColor: Colors.black,
                controller: _tabController,
                tabs: [
                  Tab(
                      text: AppHelpers.getTranslation(
                          AppLocalizations.of(context)!.received)),
                  Tab(
                      text: AppHelpers.getTranslation(
                          AppLocalizations.of(context)!.send)),
                ],
              ),
            ),
            Expanded(
              child: state.isLoadingHistory
                  ? Padding(
                      padding: EdgeInsets.only(top: 56.h),
                      child: const Loading(),
                    )
                  : TabBarView(
                      controller: _tabController,
                      children: [
                        SmartRefresher(
                          enablePullDown: true,
                          enablePullUp: true,
                          physics: const BouncingScrollPhysics(),
                          controller: controller,
                          onLoading: () {
                            event.getWalletPage(context, controller);
                          },
                          onRefresh: () {
                            event.getWallet(context,
                                refreshController: controller);
                          },
                          child: ListView.builder(
                            padding: EdgeInsets.all(16.r),
                            itemCount: state.walletHistory?.length ?? 0,
                            itemBuilder: (context, index) {
                              final transaction = state.walletHistory?[index];
                              return Container(
                                margin: EdgeInsets.only(bottom: 16.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  color: AppStyle.white,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(16.r),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            intl.DateFormat("dd/MM/yyyy h:mm a")
                                                .format(
                                              DateTime.tryParse(transaction
                                                              ?.createdAt ??
                                                          "")
                                                      ?.toLocal() ??
                                                  DateTime.now(),
                                            ),
                                            style: AppStyle.interRegular(
                                              size: 12.sp,
                                              color: AppStyle.textGrey,
                                            ),
                                          ),
                                          SizedBox(height: 4.h),
                                          Text(
                                            transaction?.note ?? "",
                                            style: AppStyle.interRegular(
                                              size: 16.sp,
                                              color: AppStyle.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Divider(color: AppStyle.textGrey),
                                    Padding(
                                      padding: EdgeInsets.all(16.r),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                AppHelpers.getTranslation(
                                                    AppLocalizations.of(
                                                            context)!
                                                        .payment_date),
                                                style: AppStyle.interRegular(
                                                  size: 12.sp,
                                                  color: AppStyle.textGrey,
                                                ),
                                              ),
                                              Text(
                                                intl.DateFormat("dd/MM/yyyy")
                                                    .format(
                                                  DateTime.tryParse(transaction
                                                                  ?.createdAt ??
                                                              "")
                                                          ?.toLocal() ??
                                                      DateTime.now(),
                                                ),
                                                style: AppStyle.interRegular(
                                                  size: 16.sp,
                                                  color: AppStyle.black,
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 16.h),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                AppHelpers.getTranslation(
                                                    AppLocalizations.of(
                                                            context)!
                                                        .sender),
                                                style: AppStyle.interRegular(
                                                  size: 12.sp,
                                                  color: AppStyle.textGrey,
                                                ),
                                              ),
                                              Text(
                                                transaction
                                                        ?.author?.firstname ??
                                                    "",
                                                style: AppStyle.interRegular(
                                                  size: 16.sp,
                                                  color: AppStyle.black,
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 16.h),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                AppHelpers.getTranslation(
                                                    AppLocalizations.of(
                                                            context)!
                                                        .deposit),
                                                style: AppStyle.interRegular(
                                                  size: 12.sp,
                                                  color: AppStyle.textGrey,
                                                ),
                                              ),
                                              Text(
                                                AppHelpers.numberFormat(
                                                    number: transaction?.price),
                                                style: AppStyle.interRegular(
                                                  size: 16.sp,
                                                  color: AppStyle.black,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Obx(() {
                          final isLoading =
                              sendTransactionController.isLoading.value;
                          final transactions = sendTransactionController
                              .sendTransactionModel.value?.transactions;

                          Future<void> _refresh() async {
                            await sendTransactionController
                                .getSendTrasactions();
                          }

                          if (isLoading) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: AppStyle.brandGreen,
                              ),
                            );
                          } else if (transactions == null ||
                              transactions.isEmpty) {
                            return Center(
                              child: Text(
                                AppLocalizations.of(context)!.nothing_found,
                                style: AppStyle.interBold(
                                  size: 14.sp,
                                  color: AppStyle.textGrey,
                                ),
                              ),
                            );
                          } else {
                            return refersh.RefreshIndicator(
                              color: AppStyle.brandGreen,
                              onRefresh: _refresh,
                              child: ListView.builder(
                                padding: EdgeInsets.all(16.r),
                                itemCount: transactions.length,
                                itemBuilder: (context, index) {
                                  final transaction = transactions[index];
                                  return Container(
                                    margin: EdgeInsets.only(bottom: 16.h),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.r),
                                      color: AppStyle.white,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(16.r),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                intl.DateFormat(
                                                        "dd/MM/yyyy h:mm a")
                                                    .format(
                                                  DateTime.tryParse(transaction
                                                                  .createdAt ??
                                                              "")
                                                          ?.toLocal() ??
                                                      DateTime.now(),
                                                ),
                                                style: AppStyle.interRegular(
                                                  size: 12.sp,
                                                  color: AppStyle.textGrey,
                                                ),
                                              ),
                                              SizedBox(height: 4.h),
                                              Text(
                                                transaction.note ?? "",
                                                style: AppStyle.interRegular(
                                                  size: 16.sp,
                                                  color: AppStyle.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Divider(color: AppStyle.textGrey),
                                        Padding(
                                          padding: EdgeInsets.all(16.r),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    AppHelpers.getTranslation(
                                                        AppLocalizations.of(
                                                                context)!
                                                            .payment_date),
                                                    style:
                                                        AppStyle.interRegular(
                                                      size: 12.sp,
                                                      color: AppStyle.textGrey,
                                                    ),
                                                  ),
                                                  Text(
                                                    intl.DateFormat(
                                                            "dd/MM/yyyy")
                                                        .format(
                                                      DateTime.tryParse(transaction
                                                                      .createdAt ??
                                                                  "")
                                                              ?.toLocal() ??
                                                          DateTime.now(),
                                                    ),
                                                    style:
                                                        AppStyle.interRegular(
                                                      size: 16.sp,
                                                      color: AppStyle.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 16.h),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    AppHelpers.getTranslation(
                                                        AppLocalizations.of(
                                                                context)!
                                                            .receiver),
                                                    style:
                                                        AppStyle.interRegular(
                                                      size: 12.sp,
                                                      color: AppStyle.textGrey,
                                                    ),
                                                  ),
                                                  Text(
                                                    transaction.userFirstname ??
                                                        "",
                                                    style:
                                                        AppStyle.interRegular(
                                                      size: 16.sp,
                                                      color: AppStyle.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 16.h),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    AppHelpers.getTranslation(
                                                        AppLocalizations.of(
                                                                context)!
                                                            .send),
                                                    style:
                                                        AppStyle.interRegular(
                                                      size: 12.sp,
                                                      color: AppStyle.textGrey,
                                                    ),
                                                  ),
                                                  Text(
                                                    AppHelpers.numberFormat(
                                                        number:
                                                            transaction.price ??
                                                                0),
                                                    style:
                                                        AppStyle.interRegular(
                                                      size: 16.sp,
                                                      color: AppStyle.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            );
                          }
                        })
                      ],
                    ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: const PopButton(),
        ),
      ),
    );
  }

  final List<Map<String, dynamic>> dummyTransactions = [
    {
      "createdAt": "2024-06-01T12:34:56.789Z",
      "note": "Received payment",
      "author": {"firstname": "John"},
      "price": 100.0
    },
  ];
}
