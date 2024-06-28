class SurveyShopModel {
  int? shopId;
  String? slug;
  String? shopUuid;
  int? tax;
  int? percentage;
  String? shopLocation;
  String? shopPhone;
  int? showType;
  int? open;
  int? visibility;
  String? backgroundImg;
  String? logoImg;
  int? minAmount;
  String? shopStatus;
  String? statusNote;
  String? deliveryTime;
  int? price;
  int? pricePerKm;
  String? shopCreatedAt;
  String? shopUpdatedAt;
  String? shopDeletedAt;
  int? serviceFee;
  int? verify;
  int? shopType;
  String? shopLocale;
  String? shopTitle;
  String? shopDescription;
  String? shopAddress;
  String? shopTranslationDeletedAt;

  SurveyShopModel(
      {this.shopId,
      this.slug,
      this.shopUuid,
      this.tax,
      this.percentage,
      this.shopLocation,
      this.shopPhone,
      this.showType,
      this.open,
      this.visibility,
      this.backgroundImg,
      this.logoImg,
      this.minAmount,
      this.shopStatus,
      this.statusNote,
      this.deliveryTime,
      this.price,
      this.pricePerKm,
      this.shopCreatedAt,
      this.shopUpdatedAt,
      this.shopDeletedAt,
      this.serviceFee,
      this.verify,
      this.shopType,
      this.shopLocale,
      this.shopTitle,
      this.shopDescription,
      this.shopAddress,
      this.shopTranslationDeletedAt});

  SurveyShopModel.fromJson(Map<String, dynamic> json) {
    shopId = json['shop_id'];
    slug = json['slug'];
    shopUuid = json['shop_uuid'];
    tax = json['tax'];
    percentage = json['percentage'];
    shopLocation = json['shop_location'];
    shopPhone = json['shop_phone'];
    showType = json['show_type'];
    open = json['open'];
    visibility = json['visibility'];
    backgroundImg = json['background_img'];
    logoImg = json['logo_img'];
    minAmount = json['min_amount'];
    shopStatus = json['shop_status'];
    statusNote = json['status_note'];
    deliveryTime = json['delivery_time'];
    price = json['price'];
    pricePerKm = json['price_per_km'];
    shopCreatedAt = json['shop_created_at'];
    shopUpdatedAt = json['shop_updated_at'];
    shopDeletedAt = json['shop_deleted_at'];
    serviceFee = json['service_fee'];
    verify = json['verify'];
    shopType = json['shop_type'];
    shopLocale = json['shop_locale'];
    shopTitle = json['shop_title'];
    shopDescription = json['shop_description'];
    shopAddress = json['shop_address'];
    shopTranslationDeletedAt = json['shop_translation_deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shop_id'] = this.shopId;
    data['slug'] = this.slug;
    data['shop_uuid'] = this.shopUuid;
    data['tax'] = this.tax;
    data['percentage'] = this.percentage;
    data['shop_location'] = this.shopLocation;
    data['shop_phone'] = this.shopPhone;
    data['show_type'] = this.showType;
    data['open'] = this.open;
    data['visibility'] = this.visibility;
    data['background_img'] = this.backgroundImg;
    data['logo_img'] = this.logoImg;
    data['min_amount'] = this.minAmount;
    data['shop_status'] = this.shopStatus;
    data['status_note'] = this.statusNote;
    data['delivery_time'] = this.deliveryTime;
    data['price'] = this.price;
    data['price_per_km'] = this.pricePerKm;
    data['shop_created_at'] = this.shopCreatedAt;
    data['shop_updated_at'] = this.shopUpdatedAt;
    data['shop_deleted_at'] = this.shopDeletedAt;
    data['service_fee'] = this.serviceFee;
    data['verify'] = this.verify;
    data['shop_type'] = this.shopType;
    data['shop_locale'] = this.shopLocale;
    data['shop_title'] = this.shopTitle;
    data['shop_description'] = this.shopDescription;
    data['shop_address'] = this.shopAddress;
    data['shop_translation_deleted_at'] = this.shopTranslationDeletedAt;
    return data;
  }
}
