class FootListNew {
  String currentDate;
  List<FootprintCategory> footprintCategory;
  List<Product> productList;
  String systemDate;

  FootListNew(
      {this.currentDate,
      this.footprintCategory,
      this.productList,
      this.systemDate});

  factory FootListNew.fromJson(Map<String, dynamic> json) {
    return FootListNew(
      currentDate: json['currentDate'],
      footprintCategory: json['footprintCategory'] != null
          ? (json['footprintCategory'] as List)
              .map((i) => FootprintCategory.fromJson(i))
              .toList()
          : null,
      productList: json['productList'] != null
          ? (json['productList'] as List)
              .map((i) => Product.fromJson(i))
              .toList()
          : null,
      systemDate: json['systemDate'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentDate'] = this.currentDate;
    data['systemDate'] = this.systemDate;
    if (this.footprintCategory != null) {
      data['footprintCategory'] =
          this.footprintCategory.map((v) => v.toJson()).toList();
    }
    if (this.productList != null) {
      data['productList'] = this.productList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  BookstallVo bookstallVo;
  num footprintDate;
  String footprintType;
  MediaVo mediaVo;
  PaperVo paperVo;
  WishVo wishVo;

  Product(
      {this.bookstallVo,
      this.footprintDate,
      this.footprintType,
      this.mediaVo,
      this.paperVo,
      this.wishVo});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      bookstallVo: json['bookstallVo'] != null
          ? BookstallVo.fromJson(json['bookstallVo'])
          : null,
      footprintDate: json['footprintDate'],
      footprintType: json['footprintType'],
      mediaVo:
          json['mediaVo'] != null ? MediaVo.fromJson(json['mediaVo']) : null,
      paperVo:
          json['paperVo'] != null ? PaperVo.fromJson(json['paperVo']) : null,
      wishVo: json['wishVo'] != null ? WishVo.fromJson(json['wishVo']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['footprintDate'] = this.footprintDate;
    data['footprintType'] = this.footprintType;
    if (this.bookstallVo != null) {
      data['bookstallVo'] = this.bookstallVo.toJson();
    }
    if (this.mediaVo != null) {
      data['mediaVo'] = this.mediaVo.toJson();
    }
    if (this.paperVo != null) {
      data['paperVo'] = this.paperVo.toJson();
    }
    if (this.wishVo != null) {
      data['wishVo'] = this.wishVo.toJson();
    }
    return data;
  }
}

class BookstallVo {
  num activityType;
  num creationDate;
  num exchangeType;
  String expectDesc;
  num id;
  num mediaId;
  MediaInfoX mediaInfo;
  num price;
  num saleId;
  num updateDate;

  BookstallVo(
      {this.activityType,
      this.creationDate,
      this.exchangeType,
      this.expectDesc,
      this.id,
      this.mediaId,
      this.mediaInfo,
      this.price,
      this.saleId,
      this.updateDate});

  factory BookstallVo.fromJson(Map<String, dynamic> json) {
    return BookstallVo(
      activityType: json['activityType'],
      creationDate: json['creationDate'],
      exchangeType: json['exchangeType'],
      expectDesc: json['expectDesc'],
      id: json['id'],
      mediaId: json['mediaId'],
      mediaInfo: json['mediaInfo'] != null
          ? MediaInfoX.fromJson(json['mediaInfo'])
          : null,
      price: json['price'],
      saleId: json['saleId'],
      updateDate: json['updateDate'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activityType'] = this.activityType;
    data['creationDate'] = this.creationDate;
    data['exchangeType'] = this.exchangeType;
    data['expectDesc'] = this.expectDesc;
    data['id'] = this.id;
    data['mediaId'] = this.mediaId;
    data['price'] = this.price;
    data['saleId'] = this.saleId;
    data['updateDate'] = this.updateDate;
    if (this.mediaInfo != null) {
      data['mediaInfo'] = this.mediaInfo.toJson();
    }
    return data;
  }
}

class MediaInfo {
  String authorName;
  String coverPic;
  String descs;
  int mediaId;
  int mediaType;
  int price;
  String title;

  MediaInfo(
      {this.authorName,
      this.coverPic,
      this.descs,
      this.mediaId,
      this.mediaType,
      this.price,
      this.title});

  factory MediaInfo.fromJson(Map<String, dynamic> json) {
    return MediaInfo(
      authorName: json['authorName'],
      coverPic: json['coverPic'],
      descs: json['descs'],
      mediaId: json['mediaId'],
      mediaType: json['mediaType'],
      price: json['price'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authorName'] = this.authorName;
    data['coverPic'] = this.coverPic;
    data['descs'] = this.descs;
    data['mediaId'] = this.mediaId;
    data['mediaType'] = this.mediaType;
    data['price'] = this.price;
    data['title'] = this.title;
    return data;
  }
}

class PaperVo {
  num isStore;
  List<Media> mediaList;

  PaperVo({this.isStore, this.mediaList});

  factory PaperVo.fromJson(Map<String, dynamic> json) {
    return PaperVo(
      isStore: json['isStore'],
      mediaList: json['mediaList'] != null
          ? (json['mediaList'] as List).map((i) => Media.fromJson(i)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isStore'] = this.isStore;
    if (this.mediaList != null) {
      data['mediaList'] = this.mediaList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Media {
  num authorId;
  String authorIntroduction;
  String authorPenname;
  num bookReviewCount;
  String coverPic;
  String descs;
  num displayStatus;
  num hasEbook;
  num isAuthorized;
  num isHaveVipDiscount;
  num isPresale;
  num isStore;
  num isSupportCod;
  String isbn;
  num lowestPrice;
  num mediaType;
  num originalPrice;
  String paperWordCnt;
  num price;
  int mediaId;
  num promotionPrice;
  int publishDate;
  String publisher;
  num salePrice;
  num score;
  num stockQuantity;
  int stockStatus;
  int supportSevenDays;
  String title;
  num vipPrice;
  int isCompanyBook; // : 0, // 书籍是否在企业书库中 0:不在 1:在
  List<Promotion> promotionList;

  Media(
      {this.authorId,
      this.authorIntroduction,
      this.authorPenname,
      this.bookReviewCount,
      this.coverPic,
      this.descs,
      this.displayStatus,
      this.hasEbook,
      this.isAuthorized,
      this.isHaveVipDiscount,
      this.isPresale,
      this.isStore,
      this.isSupportCod,
      this.isbn,
      this.lowestPrice,
      this.mediaType,
      this.originalPrice,
      this.paperWordCnt,
      this.price,
      this.mediaId,
      this.promotionPrice,
      this.publishDate,
      this.publisher,
      this.salePrice,
      this.score,
      this.stockQuantity,
      this.stockStatus,
      this.supportSevenDays,
      this.title,
      this.vipPrice,
      this.promotionList,
      this.isCompanyBook});

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      authorId: json['authorId'],
      authorIntroduction: json['authorIntroduction'],
      authorPenname: json['authorPenname'],
      bookReviewCount: json['bookReviewCount'],
      coverPic: json['coverPic'],
      descs: json['descs'],
      displayStatus: json['displayStatus'],
      hasEbook: json['hasEbook'],
      isAuthorized: json['isAuthorized'],
      isHaveVipDiscount: json['isHaveVipDiscount'],
      isPresale: json['isPresale'],
      isStore: json['isStore'],
      isSupportCod: json['isSupportCod'],
      isbn: json['isbn'],
      lowestPrice: json['lowestPrice'],
      mediaType: json['mediaType'],
      originalPrice: json['originalPrice'],
      paperWordCnt: json['paperWordCnt'],
      price: json['price'],
      mediaId: json['mediaId'],
      promotionPrice: json['promotionPrice'],
      publishDate: json['publishDate'],
      publisher: json['publisher'],
      salePrice: json['salePrice'],
      score: json['score'],
      stockQuantity: json['stockQuantity'],
      stockStatus: json['stockStatus'],
      supportSevenDays: json['supportSevenDays'],
      title: json['title'],
      vipPrice: json['vipPrice'],
      isCompanyBook: json['isCompanyBook'],
      promotionList: json['promotionList'] != null
          ? (json['promotionList'] as List)
              .map((i) => Promotion.fromJson(i))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authorId'] = this.authorId;
    data['authorIntroduction'] = this.authorIntroduction;
    data['authorPenname'] = this.authorPenname;
    data['bookReviewCount'] = this.bookReviewCount;
    data['coverPic'] = this.coverPic;
    data['descs'] = this.descs;
    data['displayStatus'] = this.displayStatus;
    data['hasEbook'] = this.hasEbook;
    data['isAuthorized'] = this.isAuthorized;
    data['isHaveVipDiscount'] = this.isHaveVipDiscount;
    data['isPresale'] = this.isPresale;
    data['isStore'] = this.isStore;
    data['isSupportCod'] = this.isSupportCod;
    data['isbn'] = this.isbn;
    data['lowestPrice'] = this.lowestPrice;
    data['mediaType'] = this.mediaType;
    data['originalPrice'] = this.originalPrice;
    data['paperWordCnt'] = this.paperWordCnt;
    data['price'] = this.price;
    data['mediaId'] = this.mediaId;
    data['promotionPrice'] = this.promotionPrice;
    data['publishDate'] = this.publishDate;
    data['publisher'] = this.publisher;
    data['salePrice'] = this.salePrice;
    data['score'] = this.score;
    data['stockQuantity'] = this.stockQuantity;
    data['stockStatus'] = this.stockStatus;
    data['supportSevenDays'] = this.supportSevenDays;
    data['title'] = this.title;
    data['vipPrice'] = this.vipPrice;
    data['isCompanyBook'] = this.isCompanyBook;
    if (this.promotionList != null) {
      data['promotionList'] =
          this.promotionList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Promotion {
  String promotionAlias;
  String promotionDesc;
  num promotionEndTime;
  num promotionLeftTime;
  String promotionName;
  String promotionPic;
  String promotionPicPC;
  num promotionPrice;
  num promotionStartTime;
  num promotionType;
  int stockStatus;

  Promotion(
      {this.promotionAlias,
      this.promotionDesc,
      this.promotionEndTime,
      this.promotionLeftTime,
      this.promotionName,
      this.promotionPic,
      this.promotionPicPC,
      this.promotionPrice,
      this.promotionStartTime,
      this.promotionType,
      this.stockStatus});

  factory Promotion.fromJson(Map<String, dynamic> json) {
    return Promotion(
      promotionAlias: json['promotionAlias'],
      promotionDesc: json['promotionDesc'],
      promotionEndTime: json['promotionEndTime'],
      promotionLeftTime: json['promotionLeftTime'],
      promotionName: json['promotionName'],
      promotionPic: json['promotionPic'],
      promotionPicPC: json['promotionPicPC'],
      promotionPrice: json['promotionPrice'],
      promotionStartTime: json['promotionStartTime'],
      promotionType: json['promotionType'],
      stockStatus: json['stockStatus'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['promotionAlias'] = this.promotionAlias;
    data['promotionDesc'] = this.promotionDesc;
    data['promotionEndTime'] = this.promotionEndTime;
    data['promotionLeftTime'] = this.promotionLeftTime;
    data['promotionName'] = this.promotionName;
    data['promotionPic'] = this.promotionPic;
    data['promotionPicPC'] = this.promotionPicPC;
    data['promotionPrice'] = this.promotionPrice;
    data['promotionStartTime'] = this.promotionStartTime;
    data['promotionType'] = this.promotionType;
    data['stockStatus'] = this.stockStatus;
    return data;
  }
}

class MediaVo {
  String desc;
  num isStore;
  num isSupportFullBuy;
  List<Media> mediaList;
  num price;
  num saleId;
  num type;

  MediaVo(
      {this.desc,
      this.isStore,
      this.isSupportFullBuy,
      this.mediaList,
      this.price,
      this.saleId,
      this.type});

  factory MediaVo.fromJson(Map<String, dynamic> json) {
    return MediaVo(
      desc: json['desc'],
      isStore: json['isStore'],
      isSupportFullBuy: json['isSupportFullBuy'],
      mediaList: json['mediaList'] != null
          ? (json['mediaList'] as List).map((i) => Media.fromJson(i)).toList()
          : null,
      price: json['price'],
      saleId: json['saleId'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['desc'] = this.desc;
    data['isStore'] = this.isStore;
    data['isSupportFullBuy'] = this.isSupportFullBuy;
    data['price'] = this.price;
    data['saleId'] = this.saleId;
    data['type'] = this.type;
    if (this.mediaList != null) {
      data['mediaList'] = this.mediaList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WishVo {
  num activityType;
  num creationDate;
  num exchangeType;
  String expectDesc;
  num id;
  num mediaId;
  MediaInfo mediaInfo;
  num price;
  num saleId;
  num updateDate;

  WishVo(
      {this.activityType,
      this.creationDate,
      this.exchangeType,
      this.expectDesc,
      this.id,
      this.mediaId,
      this.mediaInfo,
      this.price,
      this.saleId,
      this.updateDate});

  factory WishVo.fromJson(Map<String, dynamic> json) {
    return WishVo(
      activityType: json['activityType'],
      creationDate: json['creationDate'],
      exchangeType: json['exchangeType'],
      expectDesc: json['expectDesc'],
      id: json['id'],
      mediaId: json['mediaId'],
      mediaInfo: json['mediaInfo'] != null
          ? MediaInfo.fromJson(json['mediaInfo'])
          : null,
      price: json['price'],
      saleId: json['saleId'],
      updateDate: json['updateDate'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activityType'] = this.activityType;
    data['creationDate'] = this.creationDate;
    data['exchangeType'] = this.exchangeType;
    data['expectDesc'] = this.expectDesc;
    data['id'] = this.id;
    data['mediaId'] = this.mediaId;
    data['price'] = this.price;
    data['saleId'] = this.saleId;
    data['updateDate'] = this.updateDate;
    if (this.mediaInfo != null) {
      data['mediaInfo'] = this.mediaInfo.toJson();
    }
    return data;
  }
}

class MediaInfoX {
  String authorName;
  String coverPic;
  String descs;
  num mediaId;
  num mediaType;
  num price;
  String title;

  MediaInfoX(
      {this.authorName,
      this.coverPic,
      this.descs,
      this.mediaId,
      this.mediaType,
      this.price,
      this.title});

  factory MediaInfoX.fromJson(Map<String, dynamic> json) {
    return MediaInfoX(
      authorName: json['authorName'],
      coverPic: json['coverPic'],
      descs: json['descs'],
      mediaId: json['mediaId'],
      mediaType: json['mediaType'],
      price: json['price'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authorName'] = this.authorName;
    data['coverPic'] = this.coverPic;
    data['descs'] = this.descs;
    data['mediaId'] = this.mediaId;
    data['mediaType'] = this.mediaType;
    data['price'] = this.price;
    data['title'] = this.title;
    return data;
  }
}

class FootprintCategory {
  String footprintType;
  String typeName;

  FootprintCategory({this.footprintType, this.typeName});

  factory FootprintCategory.fromJson(Map<String, dynamic> json) {
    return FootprintCategory(
      footprintType: json['footprintType'],
      typeName: json['typeName'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['footprintType'] = this.footprintType;
    data['typeName'] = this.typeName;
    return data;
  }
}
