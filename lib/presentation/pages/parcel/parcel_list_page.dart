import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:puntossmart/application/parcels_list/parcel_list_notifier.dart';
import 'package:puntossmart/application/parcels_list/parcel_list_provider.dart';
import 'package:puntossmart/infrastructure/services/app_helpers.dart';
import 'package:puntossmart/infrastructure/services/local_storage.dart';
import 'package:puntossmart/infrastructure/services/tr_keys.dart';
import 'package:puntossmart/presentation/components/app_bars/common_app_bar.dart';
import 'package:puntossmart/presentation/components/buttons/pop_button.dart';
import 'package:puntossmart/presentation/components/custom_tab_bar.dart';
import 'package:puntossmart/presentation/components/loading.dart';
import 'package:puntossmart/presentation/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'parcel_item.dart';

@RoutePage()
class ParcelListPage extends ConsumerStatefulWidget {
  const ParcelListPage({super.key});

  @override
  ConsumerState<ParcelListPage> createState() => _ParcelListPageState();
}

class _ParcelListPageState extends ConsumerState<ParcelListPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late RefreshController activeRefreshController;
  late RefreshController historyRefreshController;
  late ParcelListNotifier event;

  final _tabs = [
    // Tab(text: AppHelpers.getTranslation(TrKeys.activeParcel)),
    // Tab(text: AppHelpers.getTranslation(TrKeys.parcelHistory)),
    Tab(text: AppHelpers.getTranslation('Paquete Activo')),
    Tab(text: AppHelpers.getTranslation('Paquete Recibido')),
  ];

  @override
  void initState() {
    activeRefreshController = RefreshController();
    historyRefreshController = RefreshController();
    _tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(parcelListProvider.notifier).fetchActiveOrders(context);
      ref.read(parcelListProvider.notifier).fetchHistoryOrders(context);
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    event = ref.read(parcelListProvider.notifier);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _tabController.dispose();
    activeRefreshController.dispose();
    historyRefreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.getAppThemeMode();
    final bool isLtr = LocalStorage.getLangLtr();
    final state = ref.watch(parcelListProvider);
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        backgroundColor: isDarkMode ? AppStyle.mainBackDark : AppStyle.bgGrey,
        body: Column(
          children: [
            CommonAppBar(
              child: Text(
                AppHelpers.getTranslation(
                    AppLocalizations.of(context)!.parcels),
                style: AppStyle.interNoSemi(
                  size: 18,
                  color: AppStyle.black,
                ),
              ),
            ),
            16.verticalSpace,
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    CustomTabBar(
                      isScrollable: false,
                      tabController: _tabController,
                      tabs: _tabs,
                    ),
                    Expanded(
                      child: TabBarView(controller: _tabController, children: [
                        state.isActiveLoading
                            ? const Loading()
                            : SmartRefresher(
                                controller: activeRefreshController,
                                enablePullDown: true,
                                enablePullUp: true,
                                onRefresh: () {
                                  event.fetchActiveOrdersPage(
                                      context, activeRefreshController,
                                      isRefresh: true);
                                  activeRefreshController.refreshCompleted();
                                },
                                onLoading: () {
                                  event.fetchActiveOrdersPage(
                                      context, activeRefreshController);
                                },
                                child: state.activeOrders.isNotEmpty
                                    ? ListView.builder(
                                        shrinkWrap: true,
                                        padding: EdgeInsets.only(top: 24.h),
                                        itemCount: state.activeOrders.length,
                                        itemBuilder: (context, index) {
                                          return ParcelItem(
                                            parcel: state.activeOrders[index],
                                            isActive: true,
                                          );
                                        },
                                      )
                                    : _resultEmpty(context),
                              ),
                        state.isHistoryLoading
                            ? const Loading()
                            : SmartRefresher(
                                controller: historyRefreshController,
                                enablePullDown: true,
                                enablePullUp: true,
                                onRefresh: () {
                                  event.fetchHistoryOrdersPage(
                                      context, historyRefreshController,
                                      isRefresh: true);
                                  historyRefreshController.refreshCompleted();
                                },
                                onLoading: () {
                                  event.fetchHistoryOrdersPage(
                                      context, historyRefreshController);
                                },
                                child: ListView.builder(
                                  padding: EdgeInsets.only(top: 24.h),
                                  itemCount: state.historyOrders.length,
                                  itemBuilder: (context, index) {
                                    return ParcelItem(
                                      parcel: state.historyOrders[index],
                                      isActive: false,
                                    );
                                  },
                                ),
                              ),
                      ]),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: const PopButton(),
        ),
      ),
    );
  }
}

Widget _resultEmpty(BuildContext context) {
  return Column(
    children: [
      24.verticalSpace,
      Image.asset("assets/images/notFound.png"),
      Text(
        AppHelpers.getTranslation(AppLocalizations.of(context)!
            .nothing_found /*TrKeys.nothingFound*/),
        style: AppStyle.interSemi(size: 18.sp),
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 32.w,
        ),
        child: Text(
          AppHelpers.getTranslation(AppLocalizations.of(context)!
              .try_searching_again /*TrKeys.trySearchingAgain*/),
          style: AppStyle.interRegular(size: 14.sp),
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );
}
