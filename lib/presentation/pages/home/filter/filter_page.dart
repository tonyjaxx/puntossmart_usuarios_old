import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:puntossmart/application/filter/filter_notifier.dart';
import 'package:puntossmart/application/filter/filter_state.dart';
import 'package:puntossmart/infrastructure/models/data/take_data.dart';
import 'package:puntossmart/infrastructure/services/app_helpers.dart';
import 'package:puntossmart/infrastructure/services/local_storage.dart';
import 'package:puntossmart/infrastructure/services/tr_keys.dart';
import 'package:puntossmart/presentation/components/buttons/custom_button.dart';
import 'package:puntossmart/presentation/components/custom_toggle.dart';
import 'package:puntossmart/presentation/components/loading.dart';
import 'package:puntossmart/presentation/components/title_icon.dart';
import 'package:puntossmart/presentation/routes/app_router.dart';
import 'package:puntossmart/presentation/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../application/filter/filter_provider.dart';
import 'widgets/filter_item.dart';

class FilterPage extends ConsumerStatefulWidget {
  final ScrollController controller;
  final int categoryId;

  const FilterPage({
    super.key,
    required this.categoryId,
    required this.controller,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FilterPageState();
}

class _FilterPageState extends ConsumerState<FilterPage> {
  List rating = ["2.5 - 3.5", "3.5 - 4.5", "4.5 - 5.0", "5.0"];
  List sorts = [
    // AppHelpers.getTranslation(TrKeys.trustYou ),
    // AppHelpers.getTranslation(TrKeys.bestSale),
    // AppHelpers.getTranslation(TrKeys.highlyRated),
    // AppHelpers.getTranslation(TrKeys.lowSale),
    // AppHelpers.getTranslation(TrKeys.lowRating),
    AppHelpers.getTranslation('Confiar en ti'),
    AppHelpers.getTranslation('Mejor Sale'),
    AppHelpers.getTranslation('Altamente Calificado'),
    AppHelpers.getTranslation('Baja Venta'),
    AppHelpers.getTranslation('Clasificación Baja'),
  ];

  final _freeDeliveryController = ValueNotifier<bool>(false);
  final _dealsController = ValueNotifier<bool>(false);
  final _openController = ValueNotifier<bool>(true);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(filterProvider.notifier)
        ..init(context, widget.categoryId)
        ..fetchRestaurant(context, widget.categoryId);
    });
    _freeDeliveryController.addListener(() {
      ref.read(filterProvider.notifier).setCheck(
          context,
          _freeDeliveryController.value,
          _dealsController.value,
          _openController.value,
          widget.categoryId);
    });
    _dealsController.addListener(() {
      ref.read(filterProvider.notifier).setCheck(
          context,
          _freeDeliveryController.value,
          _dealsController.value,
          _openController.value,
          widget.categoryId);
    });
    _openController.addListener(() {
      ref.read(filterProvider.notifier).setCheck(
          context,
          _freeDeliveryController.value,
          _dealsController.value,
          _openController.value,
          widget.categoryId);
    });

    super.initState();
  }

  @override
  void dispose() {
    _freeDeliveryController.dispose();
    _dealsController.dispose();
    _openController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isLtr = LocalStorage.getLangLtr();
    final state = ref.watch(filterProvider);
    final event = ref.read(filterProvider.notifier);
    return Directionality(
        textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
        child: Container(
          decoration: BoxDecoration(
              color: AppStyle.bgGrey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r),
              )),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              controller: widget.controller,
              children: [
                8.verticalSpace,
                Center(
                  child: Container(
                    height: 4.h,
                    width: 48.w,
                    decoration: BoxDecoration(
                        color: AppStyle.dragElement,
                        borderRadius: BorderRadius.all(Radius.circular(40.r))),
                  ),
                ),
                18.verticalSpace,
                TitleAndIcon(
                  title:
                      "${AppHelpers.getTranslation(AppLocalizations.of(context)!.filter)} (${!state.isLoading ? state.shopCount : AppHelpers.getTranslation(AppLocalizations.of(context)!.loading)})",
                  rightTitleColor: AppStyle.red,
                  rightTitle: AppHelpers.getTranslation(
                      AppLocalizations.of(context)!.clear_all),
                  onRightTap: () {
                    event.clear(context, widget.categoryId);
                  },
                ),
                state.isTagLoading
                    ? Padding(
                        padding: EdgeInsets.only(top: 56.h),
                        child: const Loading(),
                      )
                    : Column(
                        children: [
                          8.verticalSpace,
                          state.endPrice > 1
                              ? _priceRange(state, event)
                              : const SizedBox.shrink(),
                          8.verticalSpace,
                          FilterItem(
                            title: AppHelpers.getTranslation(
                                AppLocalizations.of(context)!.rating),
                            list: rating,
                            isRating: true,
                            currentItem: state.filterModel?.rating,
                            onTap: (s) {
                              if (s == state.filterModel?.rating) {
                                state.filterModel?.rating = null;
                              } else {
                                state.filterModel?.rating = s;
                              }
                              event.setFilterModel(context, state.filterModel,
                                  widget.categoryId);
                            },
                          ),
                          state.tags.isNotEmpty
                              ? Column(
                                  children: [
                                    8.verticalSpace,
                                    FilterItem(
                                      title: AppHelpers.getTranslation(
                                          AppLocalizations.of(context)!
                                              .special_offers),
                                      list: state.tags,
                                      isOffer: true,
                                      currentItem: state.filterModel?.offer,
                                      onTap: (s) {
                                        if ((s as TakeModel).id ==
                                            state.filterModel?.offer) {
                                          state.filterModel?.offer = null;
                                        } else {
                                          state.filterModel?.offer = s.id;
                                        }
                                        event.setFilterModel(
                                            context,
                                            state.filterModel,
                                            widget.categoryId);
                                      },
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink(),
                          8.verticalSpace,
                          FilterItem(
                            title: AppHelpers.getTranslation(
                                AppLocalizations.of(context)!.sort_by),
                            list: sorts,
                            isSort: true,
                            currentItem: state.filterModel?.sort,
                            onTap: (s) {
                              if (s == state.filterModel?.sort) {
                                state.filterModel?.sort = null;
                              } else {
                                state.filterModel?.sort = s;
                              }
                              event.setFilterModel(context, state.filterModel,
                                  widget.categoryId);
                            },
                          ),
                          8.verticalSpace,
                          CustomToggle(
                            title: AppHelpers.getTranslation(
                                AppLocalizations.of(context)!.free_delivery),
                            isChecked: state.freeDelivery,
                            controller: _freeDeliveryController,
                            onChange: () {},
                          ),
                          8.verticalSpace,
                          CustomToggle(
                            title: AppHelpers.getTranslation(
                                AppLocalizations.of(context)!.deals),
                            isChecked: state.deals,
                            controller: _dealsController,
                            onChange: () {},
                          ),
                          8.verticalSpace,
                          CustomToggle(
                            title: AppHelpers.getTranslation(
                                AppLocalizations.of(context)!.open_shop),
                            isChecked: state.open,
                            controller: _openController,
                            onChange: () {},
                          ),
                          40.verticalSpace,
                          CustomButton(
                            isLoading: state.isLoading,
                            background: AppStyle.black,
                            textColor: AppStyle.white,
                            title:
                                "${AppHelpers.getTranslation(AppLocalizations.of(context)!.show)} ${state.shopCount} ${AppHelpers.getTranslation(AppLocalizations.of(context)!.shops)} ",
                            onPressed: () {
                              context.pushRoute(ResultFilterRoute(
                                  categoryId: widget.categoryId));
                            },
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ));
  }

  Container _priceRange(FilterState state, FilterNotifier event) {
    return Container(
      width: double.infinity,
      padding:
          EdgeInsets.only(left: 10.w, right: 10.w, top: 18.h, bottom: 10.h),
      decoration: BoxDecoration(
        color: AppStyle.white.withOpacity(0.9),
        borderRadius: BorderRadius.all(
          Radius.circular(10.r),
        ),
      ),
      child: Column(
        children: [
          Text(
            AppHelpers.getTranslation(
                AppLocalizations.of(context)!.price_range),
            style: AppStyle.interNoSemi(
              size: 16,
              color: AppStyle.black,
            ),
          ),
          18.verticalSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 2.h),
                child: SizedBox(
                  width: 64.w,
                  child: Text(
                    AppHelpers.numberFormat(number: state.rangeValues.start),
                    style: AppStyle.interNormal(
                      size: 14,
                      color: AppStyle.black,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: 22.r,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (int i = 0; i < state.prices.length; i++)
                            Container(
                              width: 8.w,
                              height: 100.h / state.prices[i],
                              decoration: BoxDecoration(
                                  color: ((state.rangeValues.start /
                                                      (state.endPrice / 20))
                                                  .round() <=
                                              i) &&
                                          ((state.rangeValues.end /
                                                      (state.endPrice / 20))
                                                  .round() >=
                                              i)
                                      ? AppStyle.brandGreen
                                      : AppStyle.bgGrey,
                                  borderRadius: BorderRadius.circular(48.r)),
                            )
                        ],
                      ),
                    ),
                    8.verticalSpace,
                    Padding(
                      padding: EdgeInsets.only(
                        right: 24.r,
                      ),
                      child: RangeSlider(
                          activeColor: AppStyle.brandGreen,
                          inactiveColor: AppStyle.bgGrey,
                          min: state.startPrice,
                          max: state.endPrice,
                          values: state.rangeValues,
                          onChanged: (value) {
                            event.setRange(RangeValues(value.start, value.end),
                                context, widget.categoryId);
                          }),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 2.h),
                child: SizedBox(
                  width: 64.w,
                  child: Text(
                    AppHelpers.numberFormat(
                      number: state.rangeValues.end,
                    ),
                    style: AppStyle.interNormal(
                      size: 12.sp,
                      color: AppStyle.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
