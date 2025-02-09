import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
//import 'package:marquee/marquee.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:puntossmart/application/currency/currency_provider.dart';
import 'package:puntossmart/application/home/home_notifier.dart';
import 'package:puntossmart/application/home/home_provider.dart';
import 'package:puntossmart/application/home/home_state.dart';
import 'package:puntossmart/application/map/view_map_provider.dart';
import 'package:puntossmart/application/profile/profile_provider.dart';
import 'package:puntossmart/application/shop_order/shop_order_provider.dart';
import 'package:puntossmart/infrastructure/services/app_constants.dart';
import 'package:puntossmart/infrastructure/services/app_helpers.dart';
import 'package:puntossmart/infrastructure/services/local_storage.dart';
import 'package:puntossmart/infrastructure/services/tr_keys.dart';
import 'package:puntossmart/presentation/components/badge_item.dart';

import 'package:puntossmart/presentation/components/text_fields/search_text_field.dart';
import 'package:puntossmart/presentation/components/title_icon.dart';
import 'package:puntossmart/presentation/pages/home/controller/shop_survey_controller.dart';
import 'package:puntossmart/presentation/pages/home/shop_survey_page.dart';
import 'package:puntossmart/presentation/pages/home_three/banner_three.dart';
import 'package:puntossmart/presentation/pages/home_three/controller/promotion_controller.dart';
import 'package:puntossmart/presentation/pages/home_three/video_player_screen.dart';
import 'package:puntossmart/presentation/pages/home_three/widgets/door_three.dart';
import 'package:puntossmart/presentation/pages/home_three/widgets/market_three_item.dart';
import 'package:puntossmart/presentation/pages/home_three/widgets/send_point_home.dart';
import 'package:puntossmart/presentation/pages/home_three/widgets/shop_see_all.dart';
import 'package:puntossmart/presentation/routes/app_router.dart';
import 'package:puntossmart/presentation/theme/theme.dart';
import 'package:upgrader/upgrader.dart';
import '../../components/text_fields/scrolling_text .dart';
import 'app_bar_home_three.dart';
import 'category_screen_three.dart';
import 'filter_category_shop_three.dart';
import 'shimmer/all_shop_shimmer.dart';
import 'shimmer/banner_shimmer.dart';
import 'shimmer/news_shop_shimmer.dart';
import 'shimmer/recommend_shop_shimmer.dart';
import 'shimmer/shop_shimmer_three.dart';
import 'widgets/explore_three.dart';
import 'widgets/recommended_three_item.dart';
import 'widgets/shop_bar_item_three.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePageThree extends ConsumerStatefulWidget {
  const HomePageThree({super.key});

  @override
  ConsumerState<HomePageThree> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePageThree> {
  late HomeNotifier event;
  final RefreshController _bannerController = RefreshController();
  final RefreshController _restaurantController = RefreshController();
  final RefreshController _categoryController = RefreshController();
  final RefreshController _storyController = RefreshController();
  final PageController _pageController = PageController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeProvider.notifier)
        ..setAddress()
        ..fetchBanner(context)
        ..fetchShopRecommend(context)
        ..fetchShop(context)
        ..fetchStore(context)
        ..fetchRestaurant(context)
        ..fetchAds(context)
        ..fetchRestaurantNew(context)
        ..fetchCategories(context);
      ref.read(viewMapProvider.notifier).checkAddress(context);
      ref.read(currencyProvider.notifier).fetchCurrency(context);
      if (LocalStorage.getToken().isNotEmpty) {
        ref.read(shopOrderProvider.notifier).getCart(context, () {});
        ref.read(profileProvider.notifier).fetchUser(context);
      }
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    event = ref.read(homeProvider.notifier);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _bannerController.dispose();
    _categoryController.dispose();
    _restaurantController.dispose();
    _storyController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _onLoading() {
    if (ref.watch(homeProvider).selectIndexCategory == -1) {
      event.fetchRestaurantPage(context, _restaurantController);
    } else {
      event.fetchFilterRestaurant(context, controller: _restaurantController);
    }
  }

  void _onRefresh() {
    ref.watch(homeProvider).selectIndexCategory == -1
        ? (event
          ..fetchBannerPage(context, _restaurantController, isRefresh: true)
          ..fetchRestaurantPage(context, _restaurantController, isRefresh: true)
          ..fetchCategoriesPage(context, _restaurantController, isRefresh: true)
          ..fetchStorePage(context, _restaurantController, isRefresh: true)
          ..fetchShopPage(context, _restaurantController, isRefresh: true)
          ..fetchAds(context)
          ..fetchRestaurantPageNew(context, _restaurantController,
              isRefresh: true)
          ..fetchShopPageRecommend(context, _restaurantController,
              isRefresh: true))
        : event.fetchFilterRestaurant(context,
            controller: _restaurantController, isRefresh: true);
  }

  String despacito = "Despacito";

  ShopSurveyController shopSurveyController = Get.put(ShopSurveyController());
  PromotionController promotionController = Get.put(PromotionController());
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeProvider);
    final event = ref.read(homeProvider.notifier);
    final bool isDarkMode = LocalStorage.getAppThemeMode();
    final bool isLtr = LocalStorage.getLangLtr();
    return UpgradeAlert(
      child: Directionality(
        textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
        child: Scaffold(
          backgroundColor: isDarkMode ? AppStyle.mainBackDark : AppStyle.white,
          body: SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            physics: const BouncingScrollPhysics(),
            controller: _restaurantController,
            header: WaterDropMaterialHeader(
              distance: 160.h,
              backgroundColor: AppStyle.white,
              color: AppStyle.textGrey,
            ),
            onLoading: () => _onLoading(),
            onRefresh: () => _onRefresh(),
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: 120.r),
              children: [
                AppBarThree(state: state, event: event),
                12.verticalSpace,
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 12),
                  child: SearchTextField(
                    isRead: true,
                    isBorder: true,
                    onTap: () {
                      context.pushRoute(SearchRoute());
                    },
                    suffixIcon: const Icon(
                      FlutterRemix.equalizer_fill,
                      color: AppStyle.black,
                    ),
                  ),
                ),
                12.verticalSpace,
                state.isBannerLoading
                    ? const BannerShimmer()
                    : BannerThree(
                        bannerController: _bannerController,
                        pageController: _pageController,
                        banners: state.banners,
                        notifier: event,
                      ),
                CategoryScreenThree(
                  state: state,
                  categoryController: _categoryController,
                  event: event,
                  restaurantController: _restaurantController,
                ),
                state.selectIndexCategory == -1
                    ? _body(state, event, context)
                    : FilterCategoryShopThree(
                        state: state,
                        event: event,
                        shopController: _restaurantController),
                Container(
                  padding: const EdgeInsets.only(bottom: 10, top: 15),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  // margin:
                  //     const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
                  height: MediaQuery.of(context).size.height * 0.42, //0.24
                  child: Stack(
                    alignment: AlignmentDirectional.topStart,
                    children: [
                      // Container(
                      //   decoration: const BoxDecoration(
                      //     color: Colors.white,
                      //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      //   ),
                      //   height: MediaQuery.of(context).size.height * 0.20,
                      //   width: MediaQuery.of(context).size.width,
                      //   child: Image.asset(
                      //     "assets/images/survey.png",
                      //     fit: BoxFit.cover,
                      //   ),
                      // ),
                      if (AppHelpers.getParcel()) const SendPointHome(),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          AppLocalizations.of(context)!.answer_now,
                          style: AppStyle.interSemi(
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    AppLocalizations.of(context)!.surveys,
                    style: AppStyle.interBold(
                      size: 18,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Obx(() {
                  return shopSurveyController.isLoading.value
                      ? Container(
                          margin: const EdgeInsets.only(right: 5),
                          decoration: const BoxDecoration(
                            color: AppStyle.textGrey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                        )
                      : Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 9),
                          height: MediaQuery.of(context).size.height *
                              0.20, //ancho de la caja
                          child: ListView.builder(
                            itemCount:
                                shopSurveyController.shopSurveyModelList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final survey = shopSurveyController
                                  .shopSurveyModelList[index];
                              return GestureDetector(
                                onTap: () {
                                  if (LocalStorage.getToken().isNotEmpty) {
                                    shopSurveyController.getSurveysByShopId(
                                        shopID: survey.shopId ?? 0);
                                    shopSurveyController
                                        .getUserCompletedSurveysByShop(
                                            shopID: survey.shopId ?? 0);
                                  } else {
                                    context.router.replace(const LoginRoute());
                                  }
                                  print("CHECKING three");
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ShopSurveyPage(
                                        shopName: survey.shopTitle ?? "",
                                        imageUrl: survey.logoImg ??
                                            AppConstants.emptyImage,
                                        shopID: survey.shopId ?? 0,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  margin: const EdgeInsets.only(right: 5),
                                  decoration: const BoxDecoration(
                                    color: AppStyle.bgGrey,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                  height: //0.20
                                      MediaQuery.of(context).size.height * 0.20,
                                  width: //40
                                      MediaQuery.of(context).size.width * 0.40,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.network(
                                          survey.logoImg ??
                                              AppConstants.emptyImage,
                                          fit: BoxFit.cover,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.25,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.12,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            (survey.shopTitle?.length ?? 0) > 12
                                                ? "${survey.shopTitle?.substring(0, 12) ?? " "}.."
                                                : survey.shopTitle ?? "",
                                            //survey.shopTitle ?? "",
                                            maxLines: 2, // Limitar a dos líneas
                                            overflow: TextOverflow.ellipsis,
                                            style: AppStyle.interSemi(
                                              size: 15,
                                              color: AppStyle.black,
                                            ),
                                          ),
                                          if (survey.verify == 1)
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 4.r),
                                              child: const BadgeItem(),
                                            ),
                                          // Expanded(
                                          //   child: Text(
                                          //     survey.shopTitle ?? "",
                                          //     maxLines: 2,
                                          //     //overflow: TextOverflow.ellipsis,
                                          //     style: AppStyle.interSemi(
                                          //       size: 15,
                                          //       color: AppStyle.black,
                                          //     ),
                                          //     textAlign: TextAlign.center,
                                          //   ),
                                          // ),
                                          // if (survey.verify == 1)
                                          //   Padding(
                                          //     padding:
                                          //         EdgeInsets.only(left: 4.r),
                                          //     child: const BadgeItem(),
                                          //   ),
                                        ],
                                      ),
                                      // Text(
                                      //   // (survey.shopDescription?.length ?? 0) >
                                      //   //         20
                                      //   //     ? "${survey.shopDescription?.substring(0, 20) ?? " "}.."
                                      //   //     : survey.shopDescription ?? "",
                                      //   survey.shopDescription ?? "",
                                      //   style: AppStyle.interNormal(
                                      //     size: 14,
                                      //     color: AppStyle.black,
                                      //   ),
                                      //   textAlign: TextAlign.center,
                                      // ),
                                      Expanded(
                                        child: ScrollingText(
                                          text: survey.shopDescription ??
                                              "Sin descripción disponible",
                                          style: AppStyle.interNormal(
                                            size: 14,
                                            color: AppStyle.black,
                                          ),
                                          duration: Duration(seconds: 8),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                }),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    AppLocalizations.of(context)!.promotions,
                    style: AppStyle.interBold(
                      size: 18,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Obx(() {
                  return promotionController.promotionLoading.value
                      ? Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 9),
                          height: MediaQuery.of(context).size.height * 0.20,
                          child: ListView.builder(
                            itemCount: 3,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return ShimmerEffect();
                            },
                          ),
                        )
                      : Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 9),
                          height: MediaQuery.of(context).size.height * 0.20,
                          child: ListView.builder(
                              itemCount: promotionController.promotionModel
                                      .value?.promotions?.length ??
                                  0,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final promo = promotionController
                                    .promotionModel.value?.promotions?[index];
                                return Container(
                                  padding: const EdgeInsets.all(5),
                                  margin: const EdgeInsets.only(right: 5),
                                  height: 120,
                                  width: 110,
                                  decoration: const BoxDecoration(
                                    color: AppStyle.bgGrey,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          promo?.image ??
                                              AppConstants.emptyImage,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.15,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                        top: 2,
                                        right: 5,
                                        child: CircleAvatar(
                                          backgroundColor: AppStyle.brandGreen,
                                          radius: 13,
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        VideoPlayerScreen(
                                                          shopID:
                                                              promo?.userId ??
                                                                  0,
                                                          videoUrl:
                                                              promo?.video ??
                                                                  "",
                                                          points: promo!.points
                                                              .toString(),
                                                        )),
                                              );
                                            },
                                            child: Icon(
                                              Icons.play_arrow,
                                              size: 18,
                                              color: AppStyle.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          (promo?.title?.length ?? 0) > 20
                                              ? "${promo?.title?.substring(0, 20) ?? ""}.."
                                              : promo?.title ?? "",
                                          style: AppStyle.interNormal(
                                            size: 14,
                                            color: AppStyle.black,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _body(HomeState state, HomeNotifier event, BuildContext context) {
    return Column(
      children: [
        state.isShopLoading
            ? ShopShimmerThree(
                title: AppHelpers.getTranslation(
                    AppLocalizations.of(context)!.choose_brand),
              )
            : state.shops.isNotEmpty
                ? Column(
                    children: [
                      Text(
                        AppHelpers.getTranslation(
                            AppLocalizations.of(context)!.choose_brand),
                        style: AppStyle.interNoSemi(),
                      ),
                      AnimationLimiter(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 8.r,
                            crossAxisSpacing: 8.r,
                            mainAxisExtent: 168.r,
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.r, vertical: 16),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                              state.shops.length > 5 ? 6 : state.shops.length,
                          itemBuilder: (context, index) {
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              child: SlideAnimation(
                                verticalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: index == 5
                                      ? ShopSeeAll(
                                          brandCount: state.totalShops,
                                        )
                                      : MarketThreeItem(
                                          isShop: true,
                                          shop: state.shops[index],
                                        ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
        if (AppHelpers.getParcel()) const DoorThree(),
        state.story?.isNotEmpty ?? false
            ? SizedBox(
                height: 224.r,
                child: SmartRefresher(
                  controller: _storyController,
                  scrollDirection: Axis.horizontal,
                  enablePullDown: false,
                  enablePullUp: true,
                  onLoading: () async {
                    await event.fetchStorePage(context, _storyController);
                  },
                  child: AnimationLimiter(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: state.story?.length ?? 0,
                      padding: EdgeInsets.only(left: 16.w),
                      itemBuilder: (context, index) =>
                          AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              child: SlideAnimation(
                                verticalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: ShopBarItemThree(
                                    index: index,
                                    controller: _storyController,
                                    story: state.story?[index]?.first,
                                  ),
                                ),
                              )),
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
        16.verticalSpace,
        state.isRestaurantNewLoading
            ? NewsShopShimmer(
                title: AppHelpers.getTranslation(
                    AppLocalizations.of(context)!.new_of_week),
              )
            : state.newRestaurant.isNotEmpty
                ? Column(
                    children: [
                      TitleAndIcon(
                        rightTitle: AppHelpers.getTranslation(
                            AppLocalizations.of(context)!.see_all),
                        isIcon: true,
                        title: AppHelpers.getTranslation(
                            AppLocalizations.of(context)!.new_of_week),
                        onRightTap: () {
                          context.pushRoute(
                              RecommendedThreeRoute(isNewsOfPage: true));
                        },
                      ),
                      12.verticalSpace,
                      AnimationLimiter(
                        child: ListView.builder(
                          padding: EdgeInsets.only(bottom: 16.r),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.newRestaurant.length,
                          itemBuilder: (context, index) =>
                              AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 375),
                            child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                child: MarketThreeItem(
                                  shop: state.newRestaurant[index],
                                  isSimpleShop: true,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
        24.verticalSpace,
        state.isShopRecommendLoading
            ? const RecommendShopShimmer()
            : state.shopsRecommend.isNotEmpty
                ? Column(
                    children: [
                      TitleAndIcon(
                        rightTitle: AppHelpers.getTranslation(
                            AppLocalizations.of(context)!.see_all),
                        isIcon: true,
                        title: AppHelpers.getTranslation(
                            AppLocalizations.of(context)!.recommended),
                        onRightTap: () {
                          context.pushRoute(RecommendedThreeRoute());
                        },
                      ),
                      12.verticalSpace,
                      SizedBox(
                          height: 170.h,
                          child: AnimationLimiter(
                            child: ListView.builder(
                              shrinkWrap: false,
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              itemCount: state.shopsRecommend.length,
                              itemBuilder: (context, index) =>
                                  AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 375),
                                child: SlideAnimation(
                                  verticalOffset: 50.0,
                                  child: FadeInAnimation(
                                    child: RecommendedThreeItem(
                                      shop: state.shopsRecommend[index],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )),
                      16.verticalSpace,
                    ],
                  )
                : const SizedBox.shrink(),
        ExploreThree(
          list: state.ads,
        ),
        12.verticalSpace,
        state.isRestaurantLoading
            ? const AllShopShimmer()
            : Column(
                children: [
                  TitleAndIcon(
                    title: AppHelpers.getTranslation(
                        AppLocalizations.of(context)!.popular_near_you),
                  ),
                  state.restaurant.isNotEmpty
                      ? AnimationLimiter(
                          child: ListView.builder(
                            padding: EdgeInsets.only(top: 6.h),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: state.restaurant.length,
                            itemBuilder: (context, index) =>
                                AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              child: SlideAnimation(
                                verticalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: MarketThreeItem(
                                    shop: state.restaurant[index],
                                    isSimpleShop: true,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : SvgPicture.asset(
                          "assets/svgs/empty.svg",
                          height: 100.h,
                        )
                ],
              ),
      ],
    );
  }
}
