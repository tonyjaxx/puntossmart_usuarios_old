import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
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
import 'package:puntossmart/presentation/components/title_icon.dart';
import 'package:puntossmart/presentation/pages/home/controller/shop_survey_controller.dart';
import 'package:puntossmart/presentation/pages/home/shimmer/recommend_shop_shimmer.dart';
import 'package:puntossmart/presentation/pages/home/shimmer/shop_shimmer.dart';
import 'package:puntossmart/presentation/pages/home/shop_survey_page.dart';
import 'package:puntossmart/presentation/pages/home/widgets/banner_item.dart';
import 'package:puntossmart/presentation/pages/home/widgets/shop_bar_item.dart';
import 'package:puntossmart/presentation/pages/home_two/widget/delivery_banner.dart';
import 'package:puntossmart/presentation/routes/app_router.dart';
import 'package:puntossmart/presentation/theme/app_style.dart';

import '../home/shimmer/news_shop_shimmer.dart';
import 'app_bar_two.dart';
import 'category_two.dart';
import 'filter_category_shop_two.dart';
import 'shimmer/all_shop_two_shimmer.dart';
import 'widget/banner_two_item.dart';
import 'widget/banner_two_shimmer.dart';
import 'widget/market_two_item.dart';
import 'widget/recommended_two_item.dart';

class HomeTwoPage extends ConsumerStatefulWidget {
  const HomeTwoPage({super.key});

  @override
  ConsumerState<HomeTwoPage> createState() => _HomeTwoPageState();
}

class _HomeTwoPageState extends ConsumerState<HomeTwoPage> {
  late HomeNotifier event;
  final RefreshController _bannerController = RefreshController();
  final RefreshController _restaurantController = RefreshController();
  final RefreshController _categoryController = RefreshController();
  final RefreshController _storyController = RefreshController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeProvider.notifier)
        ..setAddress()
        ..fetchBanner(context)
        ..fetchShopRecommend(context)
        ..fetchShop(context)
        ..fetchStore(context)
        ..fetchAds(context)
        ..fetchRestaurant(context)
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

  ShopSurveyController shopSurveyController = Get.put(ShopSurveyController());

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeProvider);
    final bool isLtr = LocalStorage.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppStyle.bgGrey,
        body: Column(
          children: [
            AppBarTwo(state: state, event: event),
            Expanded(
              child: SmartRefresher(
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
                  padding: EdgeInsets.only(top: 4.r),
                  children: [
                    CategoryTwo(
                      state: state,
                      event: event,
                      categoryController: _categoryController,
                      onTap: () {
                        _restaurantController.resetNoData();
                      },
                    ),
                    state.selectIndexCategory == -1
                        ? _body(state, context)
                        : FilterCategoryShopTwo(
                            state: state,
                            event: event,
                            shopController: _restaurantController),
                    Container(
                      padding: const EdgeInsets.only(bottom: 5),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 9),
                      height: MediaQuery.of(context).size.height * 0.24,
                      child: Stack(
                        alignment: AlignmentDirectional.topStart,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            height: MediaQuery.of(context).size.height * 0.20,
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                              "assets/images/survey.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "ANSWER NOW",
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
                        "Surveys",
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
                              height: MediaQuery.of(context).size.height * 0.20,
                              child: ListView.builder(
                                itemCount: shopSurveyController
                                    .shopSurveyModelList.length,
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
                                        context.router
                                            .replace(const LoginRoute());
                                      }
                                      print("CHECKING two");
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
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                      ),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.20,
                                      width: MediaQuery.of(context).size.width *
                                          0.40,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child: Image.network(
                                              survey.logoImg ??
                                                  AppConstants.emptyImage,
                                              fit: BoxFit.cover,
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
                                                survey.shopTitle ?? "",
                                                style: AppStyle.interSemi(
                                                  size: 15,
                                                  color: AppStyle.black,
                                                ),
                                              ),
                                              if (survey.verify == 1)
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 4.r),
                                                  child: const BadgeItem(),
                                                ),
                                            ],
                                          ),
                                          Text(
                                            (survey.shopDescription?.length ??
                                                        0) >
                                                    25
                                                ? "${survey.shopDescription?.substring(0, 25) ?? " "}.."
                                                : survey.shopDescription ?? "",
                                            style: AppStyle.interNormal(
                                              size: 14,
                                              color: AppStyle.black,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                    })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _body(HomeState state, BuildContext context) {
    return Column(
      children: [
        state.isRestaurantLoading
            ? const AllShopTwoShimmer()
            : Column(
                children: [
                  TitleAndIcon(
                    rightTitle: AppHelpers.getTranslation(TrKeys.seeAll),
                    isIcon: true,
                    title: AppHelpers.getTranslation(TrKeys.popular),
                    onRightTap: () {
                      context.pushRoute(RecommendedTwoRoute(isPopular: true));
                    },
                  ),
                  12.verticalSpace,
                  state.restaurant.isNotEmpty
                      ? AnimationLimiter(
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    // mainAxisExtent: 238.r,
                                    childAspectRatio: 0.75),
                            padding: EdgeInsets.symmetric(horizontal: 8.r),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: state.restaurant.length > 6
                                ? 6
                                : state.restaurant.length,
                            itemBuilder: (context, index) =>
                                AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              child: SlideAnimation(
                                verticalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: MarketTwoItem(
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
        Container(
          margin: REdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
              color: AppStyle.white, borderRadius: BorderRadius.circular(6.r)),
          child: Column(
            children: [
              state.isBannerLoading
                  ? const BannerTwoShimmer()
                  : Column(
                      children: [
                        12.verticalSpace,
                        TitleAndIcon(
                          title: AppHelpers.getTranslation(TrKeys.banner),
                        ),
                        SizedBox(
                          height: state.banners.isNotEmpty ? 220.h : 0,
                          width: double.infinity,
                          child: SmartRefresher(
                            scrollDirection: Axis.horizontal,
                            controller: _bannerController,
                            enablePullDown: false,
                            enablePullUp: true,
                            onLoading: () async {
                              await event.fetchBannerPage(
                                  context, _bannerController);
                            },
                            child: AnimationLimiter(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: state.banners.length,
                                padding: REdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                itemBuilder: (context, index) =>
                                    AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 375),
                                  child: SlideAnimation(
                                    verticalOffset: 50.0,
                                    child: FadeInAnimation(
                                      child: BannerTwoItem(
                                        banner: state.banners[index],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        16.verticalSpace,
                      ],
                    ),
              const DeliveryBanner(),
              state.isShopLoading
                  ? ShopShimmer(
                      title: AppHelpers.getTranslation(TrKeys.shops),
                    )
                  : state.shops.isNotEmpty
                      ? Column(
                          children: [
                            TitleAndIcon(
                              rightTitle:
                                  AppHelpers.getTranslation(TrKeys.seeAll),
                              isIcon: true,
                              title: AppHelpers.getTranslation(
                                  TrKeys.favouriteBrand),
                              onRightTap: () {
                                context.pushRoute(
                                    RecommendedTwoRoute(isShop: true));
                              },
                            ),
                            12.verticalSpace,
                            AnimationLimiter(
                              child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 8.r,
                                        crossAxisSpacing: 8.r,
                                        mainAxisExtent: 200.r),
                                padding: EdgeInsets.symmetric(horizontal: 16.r),
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: state.shops.length > 6
                                    ? 6
                                    : state.shops.length,
                                itemBuilder: (context, index) =>
                                    AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 375),
                                  child: SlideAnimation(
                                    verticalOffset: 50.0,
                                    child: FadeInAnimation(
                                      child: MarketTwoItem(
                                        isShop: true,
                                        shop: state.shops[index],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            24.verticalSpace,
                          ],
                        )
                      : const SizedBox.shrink(),
              Container(
                height: state.ads.isNotEmpty ? 200.h : 0,
                margin:
                    EdgeInsets.only(bottom: state.ads.isNotEmpty ? 30.h : 0),
                child: AnimationLimiter(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.ads.length,
                    padding: EdgeInsets.only(left: 16.w),
                    itemBuilder: (context, index) =>
                        AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: BannerItem(
                            isAds: true,
                            banner: state.ads[index],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        state.isShopRecommendLoading
            ? const RecommendShopShimmer()
            : state.shopsRecommend.isNotEmpty
                ? Column(
                    children: [
                      TitleAndIcon(
                        rightTitle: AppHelpers.getTranslation(TrKeys.seeAll),
                        isIcon: true,
                        title: AppHelpers.getTranslation(TrKeys.recommended),
                        onRightTap: () {
                          context.pushRoute(RecommendedTwoRoute());
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
                                  verticalOffset: 50,
                                  child: FadeInAnimation(
                                    child: RecommendedTwoItem(
                                      shop: state.shopsRecommend[index],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )),
                      30.verticalSpace,
                    ],
                  )
                : const SizedBox.shrink(),
        state.story?.isNotEmpty ?? false
            ? Padding(
                padding: EdgeInsets.only(bottom: 16.r),
                child: SizedBox(
                  height: 210.r,
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
                                    child: ShopBarItem(
                                      index: index,
                                      controller: _storyController,
                                      story: state.story?[index]?.first,
                                    ),
                                  ),
                                )),
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
        state.isRestaurantNewLoading
            ? NewsShopShimmer(
                title: AppHelpers.getTranslation(TrKeys.newsOfWeek),
              )
            : state.newRestaurant.isNotEmpty
                ? Column(
                    children: [
                      TitleAndIcon(
                        rightTitle: AppHelpers.getTranslation(TrKeys.seeAll),
                        isIcon: true,
                        title: AppHelpers.getTranslation(TrKeys.newsOfWeek),
                        onRightTap: () {
                          context.pushRoute(
                              RecommendedTwoRoute(isNewsOfPage: true));
                        },
                      ),
                      12.verticalSpace,
                      SizedBox(
                          height: 216.r,
                          child: AnimationLimiter(
                            child: ListView.builder(
                              padding: EdgeInsets.only(left: 16.r),
                              scrollDirection: Axis.horizontal,
                              itemCount: state.newRestaurant.length,
                              itemBuilder: (context, index) =>
                                  AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 375),
                                child: SlideAnimation(
                                  verticalOffset: 50.0,
                                  child: FadeInAnimation(
                                    child: MarketTwoItem(
                                      shop: state.newRestaurant[index],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )),
                    ],
                  )
                : const SizedBox.shrink(),
        30.verticalSpace,
      ],
    );
  }
}
