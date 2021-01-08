
class DataParseHelper{
  static String USER_NOTE_COUNT = "userNoteCount";//笔记数量
  static String USER_ARTICLE_PUBLISH_COUNT = "userArticlePublishCount";////发表文章数量
  static String USER_STRATEGY_PUBLISH_COUNT = "userStrategyPublishCount";//发表攻略数量
  static String USER_POST_PUBLISH_COUNT = "userPostPublishCount";//发表帖子数量
  static String USER_PLAN_COUNT = "userPlanCount";//秒读计划数量
  static String USER_ACTIVITY_COUNT = "userActivityCount";//读书活动数量
  static String USER_READING_TIME_MINUTE = "userReadingTimeMinute";//本周阅读时长，单位分钟
  static String USER_READING_TIME_RANK = "userReadingTimeRank";//92% 超过了的网友
  static String USER_PRAISE_COUNT = "userPraiseCount";//收到的赞
  static String USER_FANS_COUNT = "userFansCount";//多少人关注我
  //6.3版本新添加
  static String USER_READING_TIME_ALL = "userReadingTimeAll";//用户总阅读时长，单位分钟
  //6.7.1添加
  static String USER_DAY_READING_TIME_MINUTE = "userDayReadingTimeMinute";//本日阅读时长，单位分钟

  ///签到
  static const String GOTO_SIGNIN_PAGE = "gotoSignInPage";
  ///阅读打卡
  static const String TO_READING_CLOCK_PAGE = "toReadingClockPage";
  ///邀请好友
  static const String TO_INVITE_FRIENDS = "toInviteFriends";
  ///书架
  static const String GO_TO_SHELF = "goto_shelf";

  //足迹类型  1电子书、2听书、3网文、4漫画、5纸书、6书摊、7心愿
   static final String FOOT_PRINT_TYPE_EBOOK = "1";
   static final String FOOT_PRINT_TYPE_LISTEN = "2";
   static final String FOOT_PRINT_TYPE_WANGWEN = "3";
   static final String FOOT_PRINT_TYPE_COMIC = "4";
   static final String FOOT_PRINT_TYPE_PAPER = "5";
   static final String FOOT_PRINT_TYPE_BOOKSTALL = "6";
   static final String FOOT_PRINT_TYPE_WISH = "7";

   static bool isWish(String footPrintType) {
    return footPrintType  == FOOT_PRINT_TYPE_WISH;
  }

  static bool isBookStall(String footPrintType) {
    return footPrintType == FOOT_PRINT_TYPE_BOOKSTALL;
  }

  static bool isPaper(String footPrintType) {
    return footPrintType == FOOT_PRINT_TYPE_PAPER;
  }

  static bool isEbook(String footPrintType) {
    return footPrintType == FOOT_PRINT_TYPE_EBOOK;
  }

  static bool isListen(String footPrintType) {
    return footPrintType == FOOT_PRINT_TYPE_LISTEN;
  }
}