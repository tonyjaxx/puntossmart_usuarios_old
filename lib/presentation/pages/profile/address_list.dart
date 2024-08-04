import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:puntossmart/application/home/home_provider.dart';
import 'package:puntossmart/application/profile/profile_provider.dart';
import 'package:puntossmart/infrastructure/models/data/address_old_data.dart';
import 'package:puntossmart/infrastructure/models/data/location.dart';
import 'package:puntossmart/infrastructure/services/app_helpers.dart';
import 'package:puntossmart/infrastructure/services/local_storage.dart';
import 'package:puntossmart/infrastructure/services/tr_keys.dart';
import 'package:puntossmart/presentation/components/app_bars/common_app_bar.dart';
import 'package:puntossmart/presentation/components/buttons/custom_button.dart';
import 'package:puntossmart/presentation/components/buttons/pop_button.dart';
import 'package:puntossmart/presentation/components/select_address_item.dart';
import 'package:puntossmart/presentation/routes/app_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../theme/app_style.dart';

@RoutePage()
class AddressListPage extends ConsumerStatefulWidget {
  const AddressListPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddressListPageState();
}

class _AddressListPageState extends ConsumerState<AddressListPage> {
  final bool isLtr = LocalStorage.getLangLtr();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final state = ref.watch(profileProvider).userData?.addresses ?? [];
        final event = ref.read(profileProvider.notifier);
        print("===========");
        print(state);
        return Directionality(
          textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
          child: Scaffold(
            backgroundColor: AppStyle.bgGrey,
            body: Column(
              children: [
                CommonAppBar(
                  child: Text(
                    AppHelpers.getTranslation(
                        AppLocalizations.of(context)!.delivery_address),
                    style: AppStyle.interNoSemi(
                      size: 18,
                      color: AppStyle.black,
                    ),
                  ),
                ),
                ListView.builder(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.r, vertical: 24.r),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.length,
                    itemBuilder: (context, index) {
                      print(state);
                      return SelectAddressItem(
                        onTap: () {
                          event.change(index);
                        },
                        isActive:
                            ref.watch(profileProvider).selectAddress == index,
                        address: state[index],
                        update: () async {
                          await context.pushRoute(ViewMapRoute(
                              address: ref
                                  .watch(profileProvider)
                                  .userData
                                  ?.addresses?[index],
                              indexAddress: index));
                          if (context.mounted) {
                            ref
                                .read(profileProvider.notifier)
                                .fetchUser(context, onSuccess: () {
                              ref
                                  .read(profileProvider.notifier)
                                  .findSelectIndex();
                            });
                          }
                        },
                      );
                    }),
              ],
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                children: [
                  PopButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  24.horizontalSpace,
                  Expanded(
                      child: CustomButton(
                          title: AppHelpers.getTranslation(
                              AppLocalizations.of(context)!.add_address),
                          onPressed: () {
                            context.pushRoute(ViewMapRoute());
                          })),
                  24.horizontalSpace,
                  Expanded(
                      child: CustomButton(
                          title: AppHelpers.getTranslation(
                              AppLocalizations.of(context)!.save),
                          onPressed: () {
                            ref.read(profileProvider.notifier).setActiveAddress(
                                index: ref.watch(profileProvider).selectAddress,
                                id: ref
                                    .watch(profileProvider)
                                    .userData
                                    ?.addresses?[ref
                                        .watch(profileProvider)
                                        .selectAddress]
                                    .id);
                            LocalStorage.setAddressSelected(AddressData(
                                title: ref
                                        .watch(profileProvider)
                                        .userData
                                        ?.addresses?[ref
                                            .watch(profileProvider)
                                            .selectAddress]
                                        .title ??
                                    "",
                                address: ref
                                        .watch(profileProvider)
                                        .userData
                                        ?.addresses?[ref
                                            .watch(profileProvider)
                                            .selectAddress]
                                        .address
                                        ?.address ??
                                    "",
                                location: LocationModel(
                                    longitude: ref
                                        .watch(profileProvider)
                                        .userData
                                        ?.addresses?[ref
                                            .watch(profileProvider)
                                            .selectAddress]
                                        .location
                                        ?.last,
                                    latitude: ref
                                        .watch(profileProvider)
                                        .userData
                                        ?.addresses?[ref
                                            .watch(profileProvider)
                                            .selectAddress]
                                        .location
                                        ?.first)));
                            ref.read(homeProvider.notifier)
                              ..fetchBannerPage(context, RefreshController(),
                                  isRefresh: true)
                              ..fetchRestaurantPage(
                                  context, RefreshController(),
                                  isRefresh: true)
                              ..fetchShopPageRecommend(
                                  context, RefreshController(),
                                  isRefresh: true)
                              ..fetchShopPage(context, RefreshController(),
                                  isRefresh: true)
                              ..fetchStorePage(context, RefreshController(),
                                  isRefresh: true)
                              ..fetchRestaurantPageNew(
                                  context, RefreshController(),
                                  isRefresh: true)
                              ..fetchCategoriesPage(
                                  context, RefreshController(),
                                  isRefresh: true)
                              ..setAddress();
                            Navigator.pop(context);
                          }))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
